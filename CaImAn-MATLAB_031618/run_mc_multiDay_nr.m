function run_mc_multiDay_nr(iterNum)


% complete pipeline for calcium imaging data pre-processing
%clear;

disp(['Batch script iteration: ', num2str(iterNum)]);

%% read in matlab parameters for script
%navigate to config file directory 
cd /home/rz646/batch_scripts
%read in textfile
%display which batch textfile is read in
paramTxtNam = ['matlab_options_', num2str(iterNum), '.txt'];
fileID = fopen(paramTxtNam,'r');
readInCell = textscan(fileID,'%s %s %s');

%read in whether to use template from day 1
matchToDay1 = boolean(str2num(readInCell{1,3}{1}));

%directory of mat file that contains template for MC
template_dir = readInCell{1,3}{2};

%read in foldername of experiment
%set the batch name python config file
configNam = ['stack_param_', num2str(iterNum) ,'.config'];
fileID_expName = fopen(configNam,'r');
folderInCell = textscan(fileID_expName, '%s %s');

foldername = ['/scratch/rz646/data/stacks/', folderInCell{2}{2}];

%close files
fclose(fileID);
fclose(fileID_expName);

%% start the pipeline

addpath(genpath('../NoRMCorre'));               % add the NoRMCorre motion correction package to MATLAB path
gcp;                                            % start a parallel engine
%foldername = '/scratch/rz646/data/stacks/test';
        % folder where all the files are located. Currently supported .tif,
        % .hdf5, .raw, .avi, and .mat files
files = subdir(fullfile(foldername,'1.tif'));   % list of filenames (will search all subdirectories)
FOV = size(read_file(files(1).name,1,1));
numFiles = length(files);

%cross-day same FOV imaging parameters
%matchToDay1 = false;

% template_dir = 'E:\I42L_AB_d1_032118_2\output';
% template_files = subdir(fullfile(template_dir,'*.mat'));

if matchToDay1
    %template_dir = 'E:\I42L_AB_d1_032118_1\input';
    disp('Motion correcting relative to template from Day 1');
    disp(['Using template', template_dir]);
    template_files = subdir(fullfile(template_dir,'template_nr.mat'));
    load(template_files(1).name, 'template');
end

%add the directory to matlab search directory - necessary for classifier in
%batches run
addpath(genpath(foldername));  

%remove first field if reading single tifs;
% files(1) = [];
% numFiles = length(files);

%% motion correct (and save registered h5 files as 2d matrices (to be used in the end)..)
% register files one by one. use template obtained from file n to
% initialize template of file n + 1; 
tic;
motion_correct = true;                                         % perform motion correction
non_rigid = true;                                               % flag for non-rigid motion correction

if non_rigid; append = '_nr'; else; append = '_rig'; end        % use this to save motion corrected files
options_mc = NoRMCorreSetParms('d1',FOV(1),'d2',FOV(2),'grid_size',[128,128],'init_batch',200,...
                'overlap_pre',64,'mot_uf',4,'bin_width',100,'max_shift',44,'max_dev',8,'us_fac',50,...
                'output_type','h5', 'iter',2, 'phase_flag', true);

%do not use empty template if matching to previous day
if ~matchToDay1
    template = [];
end

col_shift = [];
for i = 1:numFiles
    fullname = files(i).name;
    [folder_name,file_name,ext] = fileparts(fullname);    
    options_mc.h5_filename = fullfile(folder_name,[file_name,append,'.h5']);
    if motion_correct    
        [M,shifts,template,options_mc,col_shift] = normcorre_batch(fullname,options_mc,template);
        save(fullfile(folder_name,[file_name,'_shifts',append,'.mat']),'shifts','-v7.3');           % save shifts of each file at the respective folder        
    else    % if files are already motion corrected convert them to h5
        convert_file(fullname,'h5',fullfile(folder_name,[file_name,'_mc.h5']));
    end
end
toc;

%% Save template for use in later day MC before end of script
cd(foldername)
save('template_nr.mat','template');


%% Convert motion corrected file to tif for viewing in Fiji
tic;
convert_to_tif = false;

if convert_to_tif
    fullname_tif_convert = fullfile(folder_name,[file_name,append,'.h5']);
    convert_file(fullname_tif_convert,'tif',fullfile(folder_name,[file_name,'_mc.tif']));
end
toc;

%% Read in subsamples of motion corrected stack and save as tif stacks for viewing in Fiji

%read in start, middle and last stack of frames
% idxStart = [1, (dims(3)/2)-1000, dims(3)-2000];
% for ii=1:3
%     Ymc{ii} = bigread2(options_mc.h5_filename,idxStart(ii),2000);
%     saveastiff(Ymc{ii},fullfile(foldername,[num2str(ii),'_temp.tif']));
% end

%% Downsample and convert h5 motion corrected stack and save

if 0
    h5_files = subdir(fullfile(foldername,['*','rig.h5']));  % list of h5 files
    tic;
    Ymc = bigread2(h5_files.name);
    toc;
    
    %downsample temporally 5x
    Yds = downsample_data(Ymc, 'time',5);
    
    clear Ymc
    
    activityImg = max(Yds,[],3)- mean(Yds,3);
    Nc = normalize(activityImg ,'center','mean');
    activityImgN = int16(Nc);
    
    
    saveastiff(activityImgN,fullfile(foldername,['1ds_activity.tif']));
    
    tic;
    saveastiff(Yds,fullfile(foldername,['1ds_rig.tif']));
    toc;
    
end

%%
disp('Motion correction was successful'); 
exit;

end

