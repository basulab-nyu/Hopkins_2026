%% Colors
%% Plot colors
cmap_blue=cbrewer('seq', 'Blues', 16);
cmap_red=cbrewer('seq', 'Reds', 16);
cmap_purple=cbrewer('seq','Purples',16);

magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.97 0.58 0.11];
%% MH110 Example FOVs of RF vs OCGOL %TODO change this to SI
MH110_rf=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\read_inputs\CNMF_output.mat");
MH110_ocgol=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\read_inputs\CNMF_output.mat");

MH110_rf_roi=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\removedROI\26_Oct_2023_selectedROIs.mat");
MH110_ocgol_roi=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\removedROI\07_Nov_2023_selectedROIs.mat");

MH110_rf_tuned=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat");
MH110_ocgol_tuned=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\16_Aug_2024_ca_analysis.mat");
%% Getting ROI masks and identity of tuned cells (SI)
rf_keep=find(MH110_rf_roi.compSelect);
rf=MH110_rf.CNMF_output.A_keep(:,rf_keep);
rf_si= find(MH110_rf_tuned.Place_cell{1,1}.Spatial_Info.significant_ROI);
rf_tuned=rf(:,rf_si); 

ocgol_keep=find(MH110_ocgol_roi.compSelect);
ocgol=MH110_ocgol.CNMF_output.A_keep(:,ocgol_keep);
ocgol_si_a=find(MH110_ocgol_tuned.Place_cell{1,4}.Spatial_Info.significant_ROI);
ocgol_si_b= find(MH110_ocgol_tuned.Place_cell{1,5}.Spatial_Info.significant_ROI);
ocgol_tuned_A=ocgol(:,ocgol_si_a); 
ocgol_tuned_B=ocgol(:,ocgol_si_b); 

%FOVs
RF_template=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\template_nr.mat");
OCGOL_template=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\template_nr.mat");
%% Plotting MH110 RF, A, B, and Merge Tuned ROIs
figure;

% Create a 1x4 tiled layout
tiledlayout(1, 4, 'TileSpacing', 'compact', 'Padding', 'compact');

% Plot RF
nexttile
FOV_ROIPlotter(RF_template.template, yellow, rf_tuned, 'RF');

% Plot OCGOL-A
nexttile
FOV_ROIPlotter(OCGOL_template.template, blue, ocgol_tuned_A, 'OCGOL-A');

% Plot OCGOL-B
nexttile
FOV_ROIPlotter(OCGOL_template.template, magenta, ocgol_tuned_B, 'OCGOL-B');

% Prepare merged overlay
avg_template = (RF_template.template + OCGOL_template.template) ./ 2;
color = [yellow; blue; magenta];
rois = {rf_tuned, ocgol_tuned_A, ocgol_tuned_B};
alpha = 0.5;

% Initialize a white RGB image
result = ones(512, 512, 3);

for ii = 1:length(rois)
    roiSelected = reshape(sum(rois{ii}, 2), [512, 512]);
    roiSelected = roiSelected > 0;
    roiSelected = full(roiSelected);

    overlayColor = color(ii, :);

    roiSelected_mask = repmat(roiSelected, [1, 1, 3]);

    overlay = zeros(size(result));
    for c = 1:3
        overlay(:,:,c) = roiSelected * overlayColor(c);
    end

    result = result .* (1 - alpha * roiSelected_mask) + overlay * alpha;
end

% Plot the merged overlay
nexttile
imshow(result)
title('Merge')

% Optional: Use a vector renderer
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'opengl');
%exportgraphics(gcf, 'ROIs_SI.pdf', 'ContentType', 'image', 'Resolution', 300);
%exportgraphics(gcf, 'ROIs_SI.pdf', 'ContentType', 'vector');
%% Plotting dff traces
% Parameters
dt = 1/30;
dtt = 1/60;
time_min = 6;
time_sample = time_min * (1/dtt) * (1/dt);
time = 1:time_sample;
time_idx_min = time * dt * dtt;

spacing = 4;
max_roi = 3; % should be multiple of 10 ideally
y_scalebar_size = 2; % ← vertical scale bar height (in same units as trace)
y_scalebar_pos = 1; % bottom of the scale bar
x_scalebar_time = 0.2; % time (in minutes) where to place the scale bar

figure;
subplot(1,3,1)
for i = 1:max_roi
    hold on
    plot(time_idx_min, MH110_rf_tuned.Imaging_split{1,1}.trace_restricted(time,i+20) + (spacing*i), ...
        'Color', yellow, 'LineWidth', 1.5);
end

ylim([1 (max_roi+1)*spacing]); 
yticks(spacing:spacing*10:(max_roi)*spacing); 
yticklabels(num2str((max_roi:-10:1).'));

title('RF');
xlabel('Time (min)');
ylabel('ROI');

% Add Y scale bar (manual)
line([x_scalebar_time x_scalebar_time], ...
     [y_scalebar_pos y_scalebar_pos + y_scalebar_size], ...
     'Color', 'k', 'LineWidth', 2);
text(x_scalebar_time + 0.05, y_scalebar_pos + y_scalebar_size/2, ...
    sprintf('%g ΔF/F', y_scalebar_size), ...
    'VerticalAlignment', 'middle', 'FontSize', 10, 'Color', 'k');

% OCGOL-A
subplot(1,3,2)
for i = 1:max_roi
    hold on
    plot(time_idx_min, MH110_ocgol_tuned.Imaging_split{1,4}.trace_restricted(time,i+65) + (spacing*i), ...
        'Color', blue, 'LineWidth', 1.5);
end
ylim([1 (max_roi+1)*spacing]); 
yticks(spacing:spacing*10:(max_roi)*spacing); 
yticklabels(num2str((max_roi:-10:1).'));

title('OCGOL-A');
xlabel('Time (min)');

% OCGOL-B
subplot(1,3,3)
for i = 1:max_roi
    hold on
    plot(time_idx_min, MH110_ocgol_tuned.Imaging_split{1,5}.trace_restricted(time,i+65) + (spacing*i), ...
        'Color', magenta, 'LineWidth', 1.5);
end
ylim([1 (max_roi+1)*spacing]); 
yticks(spacing:spacing*10:(max_roi)*spacing); 
yticklabels(num2str((max_roi:-10:1).'));

title('OCGOL-B');
xlabel('Time (min)');
print(gcf, 'Traces.pdf', '-dpdf', '-painters')
%%
% RF D2 and OCGOl D1 place files
RF_ca_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\MH112_23_05_01-001_2\output\22_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\MH113_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\MH114_23_05_01-001_2\output\16_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\MH118_23_07_14_RF-001_2\output\09_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\MH122_2024_04_17_RF-001_3\output\06_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_17_RF-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\MH124_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\MH125_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\MH126_2024_04_17_RF-001_2\output\06_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\MH128_2024_04_18_3R-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\MH131_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\MH132_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_12_RF_3R-001_1\output\24_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_12_RF_3R-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_12_RF_3R-001_1\output\25_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_12_RF_3R-001_1\output\19_Jan_2025_ca_analysis.mat'};

OCGOL_ca_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\MH112_23_05_17_Random-001_3\output\23_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\MH113_23_05_23-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\MH114_23_05_24_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\MH115_23_08_07_Random-001_6\output\09_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\MH122_2024_05_01_Random-001_1\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_01_Random-001_6\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\MH124_2024_04_30_Random-001_6\output\08_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\MH126_2024_05_01_Random-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\MH127_2024_04_30_Random-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\MH128_2024_05_04_Random-001_2\output\10_Sep_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\MH134_2024_10_28_Random-001_4\output\16_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_28_Random-001_3\output\24_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_25_Random-001_7\output\27_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_27_Random-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_27_Random-001_3\output\16_Jan_2025_ca_analysis.mat'};

RF_crossUpdate_files= {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF'};

OCGOL_crossUpdate_files= {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update'};

%Directories for place field centers
RF_centroid_files= cell(size(RF_crossUpdate_files));  
for i = 1:length(RF_crossUpdate_files)
    RF_centroid_files{i} = fullfile(RF_crossUpdate_files{i}, 'cent_diff.mat');
end

OCGOL_centroid_files= cell(size(OCGOL_crossUpdate_files)); 
for i = 1:length(OCGOL_crossUpdate_files)
    OCGOL_centroid_files{i} = fullfile(OCGOL_crossUpdate_files{i}, 'cent_diff.mat');
end

%Directories for recurrence
RF_recurr_files= cell(size(RF_crossUpdate_files));  
for i = 1:length(RF_crossUpdate_files)
    RF_recurr_files{i} = fullfile(RF_crossUpdate_files{i}, 'recurrence.mat');
end

OCGOL_recurr_files= cell(size(OCGOL_crossUpdate_files));  
for i = 1:length(OCGOL_crossUpdate_files)
    OCGOL_recurr_files{i} = fullfile(OCGOL_crossUpdate_files{i}, 'recurrence.mat');
end

%Directories for place field width
RF_pfwidth_files= cell(size(RF_crossUpdate_files));  
for i = 1:length(RF_crossUpdate_files)
    RF_pfwidth_files{i} = fullfile(RF_crossUpdate_files{i}, 'placeField_dist.mat');
end

OCGOL_pfwidth_files= cell(size(OCGOL_crossUpdate_files)); 
for i = 1:length(OCGOL_crossUpdate_files)
    OCGOL_pfwidth_files{i} = fullfile(OCGOL_crossUpdate_files{i}, 'placeField_dist.mat');
end

RF_cellType_files= cell(size(RF_crossUpdate_files)); 
for i = 1:length(RF_crossUpdate_files)
    RF_cellType_files{i} = fullfile(RF_crossUpdate_files{i}, 'tuned_logicals.mat');
end

OCGOL_cellType_files= cell(size(OCGOL_crossUpdate_files)); 
for i = 1:length(OCGOL_crossUpdate_files)
    OCGOL_cellType_files{i} = fullfile(OCGOL_crossUpdate_files{i}, 'tuned_logicals.mat');
end
%% Get mouse IDs
% Extract mouse IDs from file paths
extractMouseID = @(fp) regexp(fp, 'MH\d{3}', 'match', 'once');

RF_mice_cross = cellfun(extractMouseID, RF_crossUpdate_files, 'UniformOutput', false);
OCGOL_mice_cross = cellfun(extractMouseID, OCGOL_crossUpdate_files, 'UniformOutput', false);
RF_mice_ca = cellfun(extractMouseID, RF_ca_files, 'UniformOutput', false);
OCGOL_mice_ca = cellfun(extractMouseID, OCGOL_ca_files, 'UniformOutput', false);

% Find matched mice across cross session update directories (RF vs OCGOL)
[matchedMice, idx_rf_cross, idx_ocg_cross] = intersect(RF_mice_cross, OCGOL_mice_cross);

% Get corresponding indexes for ca files 
[~, idx_rf_ca] = ismember(matchedMice, RF_mice_ca);
[~, idx_ocg_ca] = ismember(matchedMice, OCGOL_mice_ca);

%% Calculations with calcium dynamic data
% Parameters for getting calcium dynamics of all events (makes an average
% measurement for each roi in a mouse)
sampleTime = 4 * 30;  % 4 seconds at 30 Hz

RF= processCaDynamics(matchedMice,RF_ca_files(idx_rf_ca),1,sampleTime);
OCGOL_A= processCaDynamics(matchedMice,OCGOL_ca_files(idx_ocg_ca),4,sampleTime);
OCGOL_B= processCaDynamics(matchedMice,OCGOL_ca_files(idx_ocg_ca),5,sampleTime);
% %%
% % Takes all events (across ROIs) for each mouse based on event duration
% % Parameters for getting calcium dynamics of only events 2 sec duration or less
% sampleTime_sdur = 2 * 30; %2 second at 30 Hz - chnaging this varaible WILL change the threshold
% RF_sdur= processCaDynamics_sdur(matchedMice,RF_ca_files(idx_rf_ca),1,sampleTime_sdur);
% OCGOL_A_sdur= processCaDynamics_sdur(matchedMice,OCGOL_ca_files(idx_ocg_ca),4,sampleTime_sdur);
% OCGOL_B_sdur= processCaDynamics_sdur(matchedMice,OCGOL_ca_files(idx_ocg_ca),5,sampleTime_sdur);
% 
% % Parameters for getting calcium dynamics of events longer than 2 second
% sampleTime_ldur = 6 * 30;  % How much of trace to show - hard coded >2 second threshold in processCaDynamics_ldur function 
% % (changing this variable only changes sampling window for trace, but not the threshold)
% RF_ldur= processCaDynamics_ldur(matchedMice,RF_ca_files(idx_rf_ca),1,sampleTime_ldur);
% OCGOL_A_ldur= processCaDynamics_ldur(matchedMice,OCGOL_ca_files(idx_ocg_ca),4,sampleTime_ldur);
% OCGOL_B_ldur= processCaDynamics_ldur(matchedMice,OCGOL_ca_files(idx_ocg_ca),5,sampleTime_ldur);
%% Distribution of event durations using events across all mice
% --- Define datasets and labels ---
datasets = {RF.CaDynamic.dur_all, OCGOL_A.CaDynamic.dur_all, OCGOL_B.CaDynamic.dur_all};
titles = {'RF', 'OCGOL A', 'OCGOL B'};

% --- Define histogram bins (1s bins up to 6+, i.e., 0–1,1–2,...,5–6,6+) ---
edges = [0 1 2 3 4 5 6 inf];
bin_labels = {'0-1','1-2','2-3','3-4','4-5','5-6','6+'};

% --- Create figure ---
figure;

for d = 1:3
    dur_all = datasets{d};
    nCells = numel(dur_all);

    % Preallocate fractional histogram array
    frac_hist = nan(nCells, numel(edges)-1);

    for i = 1:nCells
        durs = dur_all{i};
        if isempty(durs)
            continue; % skip empty cells
        end
        counts = histcounts(durs, edges);
        frac_hist(i,:) = counts / sum(counts);
    end

    % Compute average and SEM across cells
    avg_frac = nanmean(frac_hist, 1);
    sem_frac = nanstd(frac_hist, 0, 1) ./ sqrt(sum(~isnan(frac_hist(:,1))));

    % --- Plot in subplot ---
    subplot(1,3,d);
    bar(1:7, avg_frac, 'FaceColor', [0.3 0.6 0.8]);
    hold on;
    errorbar(1:7, avg_frac, sem_frac, 'k', 'LineStyle', 'none', 'LineWidth', 1);
    hold off;

    xticks(1:7);
    xticklabels(bin_labels);
    ylim([0 1]); % adjust if needed
    xlabel('Event duration (s)');
    ylabel('Fraction of events');
    title(['Average Fractional Histogram - ' titles{d}]);
    box off
end

sgtitle('Fractional Event Duration Distributions Across Datasets');
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%% Plot average calcium traces parsed by event duration
figure;
subplot(1,2,1); hold on
sdur = (1:sampleTime_sdur)/30;
shadedErrorBar(sdur, mean(RF_sdur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(RF_sdur.CaDynamic.avgMouse_eventTrace),'lineProps', {'Color', yellow, 'LineWidth', 1.5});
shadedErrorBar(sdur, mean(OCGOL_A_sdur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(OCGOL_A_sdur.CaDynamic.avgMouse_eventTrace),'lineProps', {'Color', blue, 'LineWidth', 1.5});
shadedErrorBar(sdur, mean(OCGOL_B_sdur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(OCGOL_B_sdur.CaDynamic.avgMouse_eventTrace), 'lineProps', {'Color', magenta, 'LineWidth', 1.5});
title('<2 sec Events')
subplot(1,2,2); hold on
ldur = (1:sampleTime_ldur)/30;
shadedErrorBar(ldur, mean(RF_ldur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(RF_ldur.CaDynamic.avgMouse_eventTrace),'lineProps', {'Color', yellow, 'LineWidth', 1.5});
shadedErrorBar(ldur, mean(OCGOL_A_ldur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(OCGOL_A_ldur.CaDynamic.avgMouse_eventTrace),'lineProps', {'Color', blue, 'LineWidth', 1.5});
shadedErrorBar(ldur, mean(OCGOL_B_ldur.CaDynamic.avgMouse_eventTrace, 1, 'omitnan'), SEM_col(OCGOL_B_ldur.CaDynamic.avgMouse_eventTrace), 'lineProps', {'Color', magenta, 'LineWidth', 1.5});
title('>2 sec Events')


figure;
t = tiledlayout(2, 4, 'TileSpacing', 'compact', 'Padding', 'compact'); % Control layout tightly

% === Avg Event Trace ===
nexttile(1);
hold on;
shadedErrorBar(sdur, mean(RF_sdur.CaDynamic.avgMouse_eventTrace), SEM_col(RF_sdur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', yellow, 'LineWidth', 1.5});
shadedErrorBar(sdur, mean(OCGOL_A_sdur.CaDynamic.avgMouse_eventTrace), SEM_col(OCGOL_A_sdur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', blue, 'LineWidth', 1.5});
shadedErrorBar(sdur, mean(OCGOL_B_sdur.CaDynamic.avgMouse_eventTrace), SEM_col(OCGOL_B_sdur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', magenta, 'LineWidth', 1.5});
hold off;
xlabel('Time (s)'); ylabel('df/f'); ylim([0 0.5])
title('Events <2 sec')
% Add legend outside the tiled layout
lg = legend({'RF','OCGOL-A','OCGOL-B'}, 'Location', 'northwest');
lg.Layout.Tile = 'west';  

% === Shared axis settings ===
xTickVals = [1 2 3];
xTickLabels = {'RF','OCGOL-A','OCGOL-B'};
xLimits = [0 4];

% === AUC ===
nexttile(2);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_sdur.CaDynamic.eventAUC_mean(i), OCGOL_A_sdur.CaDynamic.eventAUC_mean(i), OCGOL_B_sdur.CaDynamic.eventAUC_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_sdur.CaDynamic.eventAUC_mean), SEM_col(RF_sdur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_sdur.CaDynamic.eventAUC_mean), SEM_col(OCGOL_A_sdur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_sdur.CaDynamic.eventAUC_mean), SEM_col(OCGOL_B_sdur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_sdur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_sdur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_sdur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('AUC');

% === Amplitude ===
nexttile(3);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_sdur.CaDynamic.amp_mean(i), OCGOL_A_sdur.CaDynamic.amp_mean(i), OCGOL_B_sdur.CaDynamic.amp_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_sdur.CaDynamic.amp_mean), SEM_col(RF_sdur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_sdur.CaDynamic.amp_mean), SEM_col(OCGOL_A_sdur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_sdur.CaDynamic.amp_mean), SEM_col(OCGOL_B_sdur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_sdur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_sdur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_sdur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 0.6]); ylabel('Amplitude');

% === Duration ===
nexttile(4);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_sdur.CaDynamic.dur_mean(i), OCGOL_A_sdur.CaDynamic.dur_mean(i), OCGOL_B_sdur.CaDynamic.dur_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_sdur.CaDynamic.dur_mean), SEM_col(RF_sdur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_sdur.CaDynamic.dur_mean), SEM_col(OCGOL_A_sdur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_sdur.CaDynamic.dur_mean), SEM_col(OCGOL_B_sdur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_sdur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_sdur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_sdur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xlim([0 4]); ylim([1.8 2.8]);
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Duration');
%--------------------------------------------------------------
% === Avg Event Trace ===
nexttile(5);
hold on;
shadedErrorBar(ldur, mean(RF_ldur.CaDynamic.avgMouse_eventTrace), SEM_col(RF_ldur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', yellow, 'LineWidth', 1.5});
shadedErrorBar(ldur, mean(OCGOL_A_ldur.CaDynamic.avgMouse_eventTrace), SEM_col(OCGOL_A_ldur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', blue, 'LineWidth', 1.5});
shadedErrorBar(ldur, mean(OCGOL_B_ldur.CaDynamic.avgMouse_eventTrace), SEM_col(OCGOL_B_ldur.CaDynamic.avgMouse_eventTrace), ...
    'lineProps', {'Color', magenta, 'LineWidth', 1.5});
hold off;
xlabel('Time (s)'); ylabel('df/f');
title('Events >2 sec')
% === Shared axis settings ===
xTickVals = [1 2 3];
xTickLabels = {'RF','OCGOL-A','OCGOL-B'};
xLimits = [0 4];

% === AUC ===
nexttile(6);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_ldur.CaDynamic.eventAUC_mean(i), OCGOL_A_ldur.CaDynamic.eventAUC_mean(i), OCGOL_B_ldur.CaDynamic.eventAUC_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_ldur.CaDynamic.eventAUC_mean), SEM_col(RF_ldur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_ldur.CaDynamic.eventAUC_mean), SEM_col(OCGOL_A_ldur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_ldur.CaDynamic.eventAUC_mean), SEM_col(OCGOL_B_ldur.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_ldur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_ldur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_ldur.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('AUC');

% === Amplitude ===
nexttile(7);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_ldur.CaDynamic.amp_mean(i), OCGOL_A_ldur.CaDynamic.amp_mean(i), OCGOL_B_ldur.CaDynamic.amp_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_ldur.CaDynamic.amp_mean), SEM_col(RF_ldur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_ldur.CaDynamic.amp_mean), SEM_col(OCGOL_A_ldur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_ldur.CaDynamic.amp_mean), SEM_col(OCGOL_B_ldur.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_ldur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_ldur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_ldur.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Amplitude');

% === Duration ===
nexttile(8);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF_ldur.CaDynamic.dur_mean(i), OCGOL_A_ldur.CaDynamic.dur_mean(i), OCGOL_B_ldur.CaDynamic.dur_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF_ldur.CaDynamic.dur_mean), SEM_col(RF_ldur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A_ldur.CaDynamic.dur_mean), SEM_col(OCGOL_A_ldur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B_ldur.CaDynamic.dur_mean), SEM_col(OCGOL_B_ldur.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF_ldur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A_ldur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B_ldur.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xlim([0 4]); ylim([1.8 2.8]);
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Duration');
% === General Settings ===
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
%%
%Export matrices for stats
savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\2'; % Path to save directory
%Duration
% writematrix([RF_sdur.CaDynamic.avgMouse_eventTrace' OCGOL_A_sdur.CaDynamic.avgMouse_eventTrace' OCGOL_B_sdur.CaDynamic.avgMouse_eventTrace'], fullfile(savepath,'eventTrace_sdur.csv'));
% writematrix([RF_ldur.CaDynamic.avgMouse_eventTrace' OCGOL_A_ldur.CaDynamic.avgMouse_eventTrace' OCGOL_B_ldur.CaDynamic.avgMouse_eventTrace'], fullfile(savepath,'eventTrace_ldur.csv'));
% %AUC
% writematrix([RF_sdur.CaDynamic.eventAUC_mean OCGOL_A_sdur.CaDynamic.eventAUC_mean OCGOL_B_sdur.CaDynamic.eventAUC_mean], fullfile(savepath,'eventAUC_sdur.csv'));
% writematrix([RF_ldur.CaDynamic.eventAUC_mean OCGOL_A_ldur.CaDynamic.eventAUC_mean OCGOL_B_ldur.CaDynamic.eventAUC_mean], fullfile(savepath,'eventAUC_ldur.csv'));
% %Amplitude
% writematrix([RF_sdur.CaDynamic.amp_mean OCGOL_A_sdur.CaDynamic.amp_mean OCGOL_B_sdur.CaDynamic.amp_mean], fullfile(savepath,'eventAmp_sdur.csv'));
% writematrix([RF_ldur.CaDynamic.amp_mean OCGOL_A_ldur.CaDynamic.amp_mean OCGOL_B_ldur.CaDynamic.amp_mean], fullfile(savepath,'eventAmp_ldur.csv'));
% %Duration
% writematrix([RF_sdur.CaDynamic.dur_mean OCGOL_A_sdur.CaDynamic.dur_mean OCGOL_B_sdur.CaDynamic.dur_mean], fullfile(savepath,'eventDur.csv'));

%% Plot average calcium traces for RF, OCGOL A, and OCGOL B (events not parsed by duration)
err_RF = SEM_col_exNan(RF.CaDynamic.avgMouse_eventTrace);
err_A = SEM_col_exNan(OCGOL_A.CaDynamic.avgMouse_eventTrace);
err_B = SEM_col_exNan(OCGOL_B.CaDynamic.avgMouse_eventTrace);

a = (1:sampleTime)/30;

figure;
t = tiledlayout(1, 4, 'TileSpacing', 'compact', 'Padding', 'compact'); % Control layout tightly

% === Avg Event Trace ===
% nexttile(1);
% hold on;
% shadedErrorBar(a, mean(RF.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_RF(1:length(a)), ...
%     'lineProps', {'Color', yellow, 'LineWidth', 1.5});
% shadedErrorBar(a, mean(OCGOL_A.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_A(1:length(a)), ...
%     'lineProps', {'Color', blue, 'LineWidth', 1.5});
% shadedErrorBar(a, mean(OCGOL_B.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_B(1:length(a)), ...
%     'lineProps', {'Color', magenta, 'LineWidth', 1.5});
% hold off;
% xlabel('Time (s)'); ylabel('df/f'); ylim([0.1 0.65])
% % Add legend outside the tiled layout
% lg = legend({'RF','OCGOL-A','OCGOL-B'}, 'Location', 'northwest');
% lg.Layout.Tile = 'west';  
% 
% % === Shared axis settings ===
% xTickVals = [1 2 3];
% xTickLabels = {'RF','OCGOL-A','OCGOL-B'};
% xLimits = [0 4];

%=== Event Rate ===
nexttile(1); hold on
for i=1:length(matchedMice)
    plot(xTickVals,[RF.CaDynamic.event_rate_mean(i), OCGOL_A.CaDynamic.event_rate_mean(i), OCGOL_B.CaDynamic.event_rate_mean(i)] ,'Color',[0.5 0.5 0.5]);
end
errorbar(1,mean(RF.CaDynamic.event_rate_mean),SEM_col(RF.CaDynamic.event_rate_mean),'LineWidth',2,'Color',yellow);
errorbar(2,mean(OCGOL_A.CaDynamic.event_rate_mean),SEM_col(OCGOL_A.CaDynamic.event_rate_mean),'LineWidth',2,'Color',blue);
errorbar(3,mean(OCGOL_B.CaDynamic.event_rate_mean),SEM_col(OCGOL_B.CaDynamic.event_rate_mean),'LineWidth',2,'Color',magenta);

scatter(1, mean(RF.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', magenta)

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([1 5.5]); ylabel('Event/min')

% === AUC ===
nexttile(2);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF.CaDynamic.eventAUC_mean(i), OCGOL_A.CaDynamic.eventAUC_mean(i), OCGOL_B.CaDynamic.eventAUC_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF.CaDynamic.eventAUC_mean), SEM_col(RF.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A.CaDynamic.eventAUC_mean), SEM_col(OCGOL_A.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B.CaDynamic.eventAUC_mean), SEM_col(OCGOL_B.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0.5 1.5]); ylabel('AUC');

% === Amplitude ===
nexttile(3);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF.CaDynamic.amp_mean(i), OCGOL_A.CaDynamic.amp_mean(i), OCGOL_B.CaDynamic.amp_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF.CaDynamic.amp_mean), SEM_col(RF.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A.CaDynamic.amp_mean), SEM_col(OCGOL_A.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B.CaDynamic.amp_mean), SEM_col(OCGOL_B.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0.4 1.2]); ylabel('Amplitude');

% === Duration ===
nexttile(4);
hold on;
for i = 1:length(matchedMice)
    plot(xTickVals, [RF.CaDynamic.dur_mean(i), OCGOL_A.CaDynamic.dur_mean(i), OCGOL_B.CaDynamic.dur_mean(i)], ...
        'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(RF.CaDynamic.dur_mean), SEM_col(RF.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', yellow);
errorbar(2, mean(OCGOL_A.CaDynamic.dur_mean), SEM_col(OCGOL_A.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', blue);
errorbar(3, mean(OCGOL_B.CaDynamic.dur_mean), SEM_col(OCGOL_B.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', magenta);

scatter(1, mean(RF.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(OCGOL_A.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(OCGOL_B.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', magenta)
xlim([0 4]); ylim([1.8 2.8]);
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Duration');

% === General Settings ===
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'CaDynamics_Alldur.pdf', 'ContentType', 'vector');

%exportgraphics(gcf, 'eventRate.pdf', 'ContentType', 'vector');
%writematrix([RF.CaDynamic.event_rate_mean OCGOL_A.CaDynamic.event_rate_mean OCGOL_B.CaDynamic.event_rate_mean], fullfile(savepath,'eventRate.csv'));
%Event AUC (events not separated by duration)
%writematrix([RF.CaDynamic.eventAUC_mean OCGOL_A.CaDynamic.eventAUC_mean OCGOL_B.CaDynamic.eventAUC_mean], fullfile(savepath,'eventAUC.csv'));
%Event Amplitude
%writematrix([RF.CaDynamic.amp_mean OCGOL_A.CaDynamic.amp_mean OCGOL_B.CaDynamic.amp_mean], fullfile(savepath,'eventAmp.csv'));

%% Load and process centroid and caanalysis data 
% Compute for RF
RF = computeSpatialTuning(matchedMice, RF_ca_files(idx_rf_ca), RF_centroid_files(idx_rf_cross), 1);

% Compute for OCGOLA
OCGOL_A = computeSpatialTuning(matchedMice,OCGOL_ca_files(idx_ocg_ca),OCGOL_centroid_files(idx_ocg_cross), 4);
OCGOL_A_sel = computeSpatialTuning_taskSel(matchedMice, OCGOL_ca_files(idx_ocg_ca), OCGOL_centroid_files(idx_ocg_cross), OCGOL_cellType_files(idx_ocg_cross), 4);

% Compute for OCGOLB
OCGOL_B = computeSpatialTuning(matchedMice,OCGOL_ca_files(idx_ocg_ca),OCGOL_centroid_files(idx_ocg_cross), 5);
OCGOL_B_sel = computeSpatialTuning_taskSel(matchedMice, OCGOL_ca_files(idx_ocg_ca), OCGOL_centroid_files(idx_ocg_cross), OCGOL_cellType_files(idx_ocg_cross), 5);

%% Centroid Distribution with all fields (not just maximal)
pos= linspace(0, 200, 20);

results_RF = binwise_vs_value(RF.pfCentrDistr_si, 0.05, false);
results_A = binwise_vs_value(OCGOL_A.pfCentrDistr_si, 0.05, false);
results_B = binwise_vs_value(OCGOL_B.pfCentrDistr_si, 0.05, false);
results_A_sel = binwise_vs_value(OCGOL_A_sel.pfCentrDistr_si, 0.05, false);
results_B_sel = binwise_vs_value(OCGOL_B_sel.pfCentrDistr_si, 0.05, false);

% writetable(results_RF.table, fullfile(savepath,'centDist_sig_RF.xlsx'))
% writetable(results_A.table, fullfile(savepath,'centDist_sig_A.xlsx'))
% writetable(results_B.table, fullfile(savepath,'centDist_sig_B.xlsx'))
% writetable(results_A_sel.table, fullfile(savepath,'centDist_sig_A_sel.xlsx'))
% writetable(results_B_sel.table, fullfile(savepath,'centDist_sig_B_sel.xlsx'))

%All A tuned and all b tuned
figure;
subplot(1,2,1);hold on
shadedErrorBar(pos,mean(RF.pfCentrDistr_si),SEM_col(RF.pfCentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_A.pfCentrDistr_si),SEM_col(OCGOL_A.pfCentrDistr_si),'lineProps',{'Color',blue, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_A.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
box off

subplot(1,2,2);hold on
shadedErrorBar(pos,mean(RF.pfCentrDistr_si),SEM_col(RF.pfCentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_B.pfCentrDistr_si),SEM_col(OCGOL_B.pfCentrDistr_si),'lineProps',{'Color',magenta, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_B.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
box off

%A sel and B sel cells only
figure;
subplot(1,2,1);hold on
shadedErrorBar(pos,mean(RF.pfCentrDistr_si),SEM_col(RF.pfCentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_A_sel.pfCentrDistr_si),SEM_col(OCGOL_A_sel.pfCentrDistr_si),'lineProps',{'Color',blue, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_A_sel.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
box off

subplot(1,2,2);hold on
shadedErrorBar(pos,mean(RF.pfCentrDistr_si),SEM_col(RF.pfCentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_B_sel.pfCentrDistr_si),SEM_col(OCGOL_B_sel.pfCentrDistr_si),'lineProps',{'Color',magenta, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_B_sel.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
box off


%exportgraphics(gcf, 'PlaceCellRep.pdf', 'ContentType', 'vector');
%writematrix([RF.pfCentrDistr_si' OCGOL_A.pfCentrDistr_si' OCGOL_B.pfCentrDistr_si'], fullfile(savepath,'centDist.csv'));
%% Centroid distribution using only maximum field (like Zemla paper)

RF_cent= centroid_distrib(matchedMice, RF_centroid_files(idx_rf_cross), RF_cellType_files(idx_rf_cross), 1);
OCGOL_cent= centroid_distrib(matchedMice, OCGOL_centroid_files(idx_ocg_cross), OCGOL_cellType_files(idx_ocg_cross), 2);
%
results_RF = binwise_vs_value(RF_cent.CentrDistr_si, 0.05, false);
results_A = binwise_vs_value(OCGOL_cent.CentrDistr_si.allA, 0.05, false);
results_B = binwise_vs_value(OCGOL_cent.CentrDistr_si.allB, 0.05, false);
results_A_sel = binwise_vs_value(OCGOL_cent.CentrDistr_si.onlyA, 0.05, false);
results_B_sel = binwise_vs_value(OCGOL_cent.CentrDistr_si.onlyB, 0.05, false);

%All A tuned and all b tuned
figure;
subplot(1,2,1);hold on
shadedErrorBar(pos,mean(RF_cent.CentrDistr_si),SEM_col(RF_cent.CentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_cent.CentrDistr_si.allA),SEM_col(OCGOL_cent.CentrDistr_si.allA),'lineProps',{'Color',blue, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_A.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
box off

subplot(1,2,2);hold on
shadedErrorBar(pos,mean(RF_cent.CentrDistr_si),SEM_col(RF_cent.CentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_cent.CentrDistr_si.allB),SEM_col(OCGOL_cent.CentrDistr_si.allB),'lineProps',{'Color',magenta, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_B.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
box off

%A sel and B sel cells only
figure;
subplot(1,2,1);hold on
shadedErrorBar(pos,mean(RF_cent.CentrDistr_si),SEM_col(RF_cent.CentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_cent.CentrDistr_si.onlyA),SEM_col(OCGOL_cent.CentrDistr_si.onlyA),'lineProps',{'Color',blue, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_A_sel.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
box off

subplot(1,2,2);hold on
shadedErrorBar(pos,mean(RF_cent.CentrDistr_si),SEM_col(RF_cent.CentrDistr_si),'lineProps',{'Color',yellow, 'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_cent.CentrDistr_si.onlyB),SEM_col(OCGOL_cent.CentrDistr_si.onlyB),'lineProps',{'Color',magenta, 'LineWidth',1.5});
ylim([0 0.12]); yline(0.05,'-k','LineWidth',1.5); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5); xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells')
ax=gca;
plotBinwiseSignificanceBar(ax, pos, results_B_sel.sig_fdr,1);
plotBinwiseSignificanceBar(ax, pos, results_RF.sig_fdr,2);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
box off
%%
%heat maps for tuned, A sel, and B sel
cmap_yellow=whiteToColorMap(yellow);
cmap_blue=whiteToColorMap(blue);
cmap_magenta=whiteToColorMap(magenta);
sb = 0:2:200;
%RF
load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_17_RF-001_3\output\07_Sep_2024_ca_analysis.mat",'Place_cell')
load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\tuned_logicals.mat")

idx_A=tuned_logicals.tuned_log_filt_si{1,2}.allA;
tuning_curves_SI_1= Place_cell{1,1}.Spatial_tuning_curve';
tuning_curves_SI_1= tuning_curves_SI_1(idx_A,:);
[~,RF1_peak] = max(tuning_curves_SI_1,[],2);
[~,RF1_order] = sort(RF1_peak);

S1_RF = tuning_curves_SI_1(RF1_order,:);

%A sel
load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_02_Random-001_7\output\07_Sep_2024_ca_analysis.mat",'Place_cell');
load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\tuned_logicals.mat")

idx_A=tuned_logicals.tuned_log_filt_si{1,2}.onlyA;
tuning_curves_SI_1= Place_cell{1,4}.Spatial_tuning_curve';
tuning_curves_SI_1= tuning_curves_SI_1(idx_A,:);
[~,OCGOLA_peak] = max(tuning_curves_SI_1,[],2);
[~,OCGOLA_order] = sort(OCGOLA_peak);

S1_OCGOLA = tuning_curves_SI_1(OCGOLA_order,:);

%B sel
idx_B=tuned_logicals.tuned_log_filt_si{1,2}.onlyB;
tuning_curves_SI_1= Place_cell{1,5}.Spatial_tuning_curve';
tuning_curves_SI_1= tuning_curves_SI_1(idx_B,:);
[~,OCGOLB_peak] = max(tuning_curves_SI_1,[],2);
[~,OCGOLB_order] = sort(OCGOLB_peak);

S1_OCGOLB = tuning_curves_SI_1(OCGOLB_order,:);

figure;

% Get row counts
n1 = size(S1_RF,1);
n2 = size(S1_OCGOLA,1);
n3 = size(S1_OCGOLB,1);

% Total rows
ntot = n1 + n2 + n3;

% Vertical spacing parameters
bottom_margin = 0.07;
top_margin    = 0.05;
v_gap         = 0.03;

usable_height = 1 - bottom_margin - top_margin - 2*v_gap;

h1 = usable_height * (n1/ntot);
h2 = usable_height * (n2/ntot);
h3 = usable_height * (n3/ntot);

left = 0.12;
width = 0.75;

% --- RF ---
ax1 = axes('Position',[left, ...
    bottom_margin + h2 + h3 + 2*v_gap, ...
    width, h1]);

imagesc(sb, 1:n1, S1_RF);
colormap(ax1, cmap_yellow);
caxis([0 1]);
colorbar('westoutside');
title('RF');
ylabel('Neuron');

% --- A sel ---
ax2 = axes('Position',[left, ...
    bottom_margin + h3 + v_gap, ...
    width, h2]);

imagesc(sb, 1:n2, S1_OCGOLA);
colormap(ax2, cmap_blue);
caxis([0 1]);
colorbar('westoutside');
title('A-Selective');
ylabel('Neuron');
xline(sb(70),'k--','LineWidth',2);

% --- B sel ---
ax3 = axes('Position',[left, bottom_margin, width, h3]);

imagesc(sb, 1:n3, S1_OCGOLB);
colormap(ax3, cmap_magenta);
caxis([0 1]);
colorbar('westoutside');
title('B-Selective');
xlabel('Position (cm)');
ylabel('Neuron');
xline(sb(30),'k--','LineWidth',2);

set(findall(gcf,'-property','FontSize'),'FontSize',14);
set(gcf,'Renderer','painters');


%%
%RF, A sel, and B sel bar plots
% Compute means and SEMs
rf_mean   = mean(RF_cent.CentrDistr_si);
A_mean    = mean(OCGOL_cent.CentrDistr_si.onlyA);
B_mean    = mean(OCGOL_cent.CentrDistr_si.onlyB);

figure;

% --- RF ---
subplot(3,1,1); hold on
b = bar(pos, rf_mean, 'FaceColor', yellow, 'EdgeColor','none');
title('RF');
ylim([0 0.12]); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5);
xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)'); ylabel('Fraction of Place Cells');
box off

% --- A sel ---
subplot(3,1,2); hold on
b = bar(pos, A_mean, 'FaceColor', blue, 'EdgeColor','none');
title('A sel');
ylim([0 0.12]); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5);
xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)');
box off

% --- B sel ---
subplot(3,1,3); hold on
b = bar(pos, B_mean, 'FaceColor', magenta, 'EdgeColor','none');
title('B sel');
ylim([0 0.12]); xlim([0 200]);
xline(pos(6),'--','Color',magenta,'LineWidth',1.5);
xline(pos(14),'--','Color',blue,'LineWidth',1.5);
xlabel('Position (cm)');
box off

set(findall(gcf,'-property','FontSize'),'FontSize',14);
set(gcf,'Renderer','painters');

%%
%Centroid fraction cumulative plotting
test_rf=RF_cent.CentrDistr_si;
test_a=OCGOL_cent.CentrDistr_si.allA;
test_b=OCGOL_cent.CentrDistr_si.allB;
test_onlya=OCGOL_cent.CentrDistr_si.onlyA;
test_onlyb=OCGOL_cent.CentrDistr_si.onlyB;
%shadedErrorBar(pos,mean(OCGOL_cent.CentrDistr_si.onlyB),SEM_col(OCGOL_cent.CentrDistr_si.onlyB),'lineProps',{'Color',magenta, 'LineWidth',1.5});
% subplot(1,2,1)
% shadedErrorBar([1:20],mean(cumsum(test_rf, 2)),SEM_col(cumsum(test_rf, 2)),'lineProps',{'Color',yellow, 'LineWidth',1.5});
% hold on
% shadedErrorBar([1:20],mean(cumsum(test_a, 2)),SEM_col(cumsum(test_a, 2)),'lineProps',{'Color',blue, 'LineWidth',1.5});
% shadedErrorBar([1:20],mean(cumsum(test_b, 2)),SEM_col(cumsum(test_b, 2)),'lineProps',{'Color',magenta, 'LineWidth',1.5});
% xlabel('Spatial Bin'); ylabel('Cumualtive Fraction of Cells')
% title('Tuned Cells')
% 
% subplot(1,2,2)
% shadedErrorBar([1:20],mean(cumsum(test_rf, 2)),SEM_col(cumsum(test_rf, 2)),'lineProps',{'Color',yellow, 'LineWidth',1.5});
% hold on
% shadedErrorBar([1:20],mean(cumsum(test_onlya, 2)),SEM_col(cumsum(test_onlya, 2)),'lineProps',{'Color',blue, 'LineWidth',1.5});
% shadedErrorBar([1:20],mean(cumsum(test_onlyb, 2)),SEM_col(cumsum(test_onlyb, 2)),'lineProps',{'Color',magenta, 'LineWidth',1.5});
% xlabel('Spatial Bin'); ylabel('Cumualtive Fraction of Cells')
% title('Trial-Selective Cells')
sb = linspace(0, 200, 20);
figure
subplot(2,1,1)
shadedErrorBar(sb,mean(cumsum(test_rf, 2)),SEM_col(cumsum(test_rf, 2)),'lineProps',{'Color',yellow, 'LineWidth',1.5});
hold on
shadedErrorBar(sb,mean(cumsum(test_onlya, 2)),SEM_col(cumsum(test_onlya, 2)),'lineProps',{'Color',blue, 'LineWidth',1.5});
shadedErrorBar(sb,mean(cumsum(test_onlyb, 2)),SEM_col(cumsum(test_onlyb, 2)),'lineProps',{'Color',magenta, 'LineWidth',1.5});
xlabel('Position (cm)'); ylabel('Cumualtive Fraction of Cells')
title('Trial-Selective Cells')

centroid_mean=[RF_cent.Centroids_mean' OCGOL_cent.Centroids_mean.onlyA' OCGOL_cent.Centroids_mean.onlyB'];
subplot(2,1,2)
hold on
for i=1:size(centroid_mean,1)
    plot(xTickVals,centroid_mean(i,:),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(centroid_mean(:,1)),SEM_col(centroid_mean(:,1)),'LineWidth',1.5,'Color',yellow);
errorbar(2,mean(centroid_mean(:,2)),SEM_col(centroid_mean(:,2)),'LineWidth',1.5,'Color', blue);
errorbar(3,mean(centroid_mean(:,3)),SEM_col(centroid_mean(:,3)),'LineWidth',1.5,'Color', magenta);
scatter(1, mean(centroid_mean(:,1)), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(centroid_mean(:,2)), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(centroid_mean(:,3)), 's', 'filled', 'MarkerFaceColor', magenta)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
title('Mean Centroid')
set(findall(gcf,'-property','FontSize'),'FontSize',14);
set(gcf,'Renderer','painters');
%% Plotting active cells and fraction tuned (various criteria)

activeROI_paired=[RF.activeROI,OCGOL_A.activeROI,OCGOL_B.activeROI];
si_paired=[RF.siTuned,OCGOL_A.siTuned,OCGOL_B.siTuned];
ts_paired=[RF.tsTuned,OCGOL_A.tsTuned,OCGOL_B.tsTuned];
SiTs_paired=[RF.SiTsTuned,OCGOL_A.SiTsTuned,OCGOL_B.SiTsTuned];
SiorTS_paired=[RF.SiorTsTuned,OCGOL_A.SiorTsTuned,OCGOL_B.SiorTsTuned];
fracTuned_paired=SiorTS_paired./activeROI_paired; %SI or TS paired are counted
fracTuned_siandts_paired=SiTs_paired./activeROI_paired; %Must be meet both SI and TS criteria
fracTuned_si_paired=si_paired./activeROI_paired; %SI 
fracTuned_ts_paired=ts_paired./activeROI_paired; %TS

figure()
subplot(1,2,1)
hold on
errorbar(1,mean(activeROI_paired(:,1)),SEM_col(activeROI_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(activeROI_paired(:,2)),SEM_col(activeROI_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(activeROI_paired(:,3)),SEM_col(activeROI_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(activeROI_paired,1)
    plot(xTickVals,activeROI_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
title('Total Active')

subplot(1,2,2)
hold on
errorbar(1,mean(SiorTS_paired(:,1)),SEM_col(SiorTS_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(SiorTS_paired(:,2)),SEM_col(SiorTS_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(SiorTS_paired(:,3)),SEM_col(SiorTS_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(SiorTS_paired,1)
    plot(xTickVals,SiorTS_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
title('Number Tuned (SI | TS)')


figure()
subplot(1,4,1)
hold on
errorbar(1,mean(fracTuned_paired(:,1)),SEM_col(fracTuned_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(fracTuned_paired(:,2)),SEM_col(fracTuned_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(fracTuned_paired(:,3)),SEM_col(fracTuned_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(fracTuned_paired,1)
    plot(xTickVals,fracTuned_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 1])
title('Fraction Tuned (SI | TS)')

subplot(1,4,2)
hold on
errorbar(1,mean(fracTuned_siandts_paired(:,1)),SEM_col(fracTuned_siandts_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(fracTuned_siandts_paired(:,2)),SEM_col(fracTuned_siandts_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(fracTuned_siandts_paired(:,3)),SEM_col(fracTuned_siandts_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(fracTuned_siandts_paired,1)
    plot(xTickVals,fracTuned_siandts_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 1])
title('Fraction Tuned (SI & TS)')

subplot(1,4,3)
hold on
errorbar(1,mean(fracTuned_si_paired(:,1)),SEM_col(fracTuned_si_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(fracTuned_si_paired(:,2)),SEM_col(fracTuned_si_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(fracTuned_si_paired(:,3)),SEM_col(fracTuned_si_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(fracTuned_si_paired,1)
    plot(xTickVals,fracTuned_si_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 1])
title('Fraction Tuned (SI)')

subplot(1,4,4)
hold on
errorbar(1,mean(fracTuned_ts_paired(:,1)),SEM_col(fracTuned_ts_paired(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(fracTuned_ts_paired(:,2)),SEM_col(fracTuned_ts_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
errorbar(3,mean(fracTuned_ts_paired(:,3)),SEM_col(fracTuned_ts_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
for i=1:size(fracTuned_ts_paired,1)
    plot(xTickVals,fracTuned_ts_paired(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 1])
title('Fraction Tuned (TS)')
%%
%For plotting stacked bar graph with tuned and not tuned per condition (SI)
RF_untuned= RF.activeROI-RF.siTuned;
OCGOLA_untuned= OCGOL_A.activeROI-OCGOL_A.siTuned;
OCGOLB_untuned= OCGOL_B.activeROI-OCGOL_B.siTuned;
y=[mean(RF.siTuned),mean(RF_untuned); 
   mean(OCGOL_A.siTuned),mean(OCGOLA_untuned);
   mean(OCGOL_B.siTuned),mean(OCGOLB_untuned)];

sem=[SEM_col(RF.siTuned),SEM_col(RF_untuned); 
   SEM_col(OCGOL_A.siTuned),SEM_col(OCGOLA_untuned);
   SEM_col(OCGOL_B.siTuned),SEM_col(OCGOLB_untuned)];

% === Define colors ===
tuned_colors = [yellow;  % RF - mango
                blue;  % OCGOL-A - blue
                magenta]; % OCGOL-B - magenta

untuned_color = [0.7 0.7 0.7];  % Gray for untuned

% === Plot ===
figure;
bh = bar(y, 'stacked');  % bh(1): tuned, bh(2): untuned
hold on;

% Set per-group color for "tuned" bars
bh(1).FaceColor='flat'
bh(1).CData = tuned_colors;

% Set single color for "untuned" bars
bh(2).FaceColor = untuned_color;

% === Add error bars ===
for i = 1:size(y, 1)
    x = i;

    % Tuned
    y1 = y(i, 1);
    err1 = sem(i, 1);
    errorbar(x, y1, err1, 'k', 'LineStyle', 'none', 'LineWidth', 1.2);

    % Untuned
    y2 = y(i, 1) + y(i, 2);
    err2 = sem(i, 2);
    errorbar(x, y2, err2, 'k', 'LineStyle', 'none', 'LineWidth', 1.2);
end

% === Add mean fraction tuned on top of tuned bar segment ===
mean_frac = mean(fracTuned_si_paired, 1);  % 1x3 vector: [RF, A, B]

for i = 1:3
    tuned_height = y(i, 1);
    total_height = sum(y(i, :));

    % Vertical position just above the tuned segment
    y_pos = tuned_height / 2;

    % Display as percentage with 1 decimal
    text(i, y_pos, sprintf('%.1f%%', mean_frac(i)*100), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom', ...
        'FontSize', 12, 'FontWeight', 'bold');
end


% === Labels ===
xticks(1:3);
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'});
ylabel('Number of Cells');
legend({'Tuned', 'Untuned'}, 'Location', 'northwest');
box off;
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
exportgraphics(gcf, 'StackedBarTuned.pdf', 'ContentType', 'vector');

%writematrix([RF.activeROI OCGOL_A.activeROI OCGOL_B.activeROI], fullfile(savepath,'activeROI.csv'));
%writematrix(fracTuned_si_paired, fullfile(savepath,'fracTunedSI.csv'));
%% Collecting Place field width and count
nMice = length(matchedMice);

RF.pfwidth.ts=NaN(nMice,1);
RF.pfwidth.si=NaN(nMice,1);
RF.pfwidth.tsAll=cell(1,nMice);
RF.pfwidth.siAll=cell(1,nMice);
OCGOL_A.pfwidth.ts=NaN(nMice,1);
OCGOL_A.pfwidth.tsAll=cell(1,nMice);
OCGOL_B.pfwidth.ts=NaN(nMice,1);
OCGOL_B.pfwidth.tsAll=cell(1,nMice);
OCGOL_A.pfwidth.si=NaN(nMice,1);
OCGOL_A.pfwidth.siAll=cell(1,nMice);
OCGOL_B.pfwidth.si=NaN(nMice,1);
OCGOL_B.pfwidth.siAll=cell(1,nMice);

RF.pfcount.ts=NaN(nMice,3);
RF.pfcount.si=NaN(nMice,3);
OCGOL_A.pfcount.ts=NaN(nMice,3);
OCGOL_B.pfcount.ts=NaN(nMice,3);
OCGOL_A.pfcount.si=NaN(nMice,3);
OCGOL_B.pfcount.si=NaN(nMice,3);

match_RF_pfwidth= RF_pfwidth_files(idx_rf_cross);
for mouse=1:nMice
    load(match_RF_pfwidth{mouse})
    RF.pfwidth.ts(mouse)=mean(placeField_dist.all{1, 2}.A.ts.width_cm);
    RF.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.A.si.width_cm);
    RF.pfcount.ts(mouse,:)=placeField_dist.all{1, 2}.A.ts.field_count_total  ;
    RF.pfcount.si(mouse,:)=placeField_dist.all{1, 2}.A.si.field_count_total  ;
    RF.pfwidth.tsAll{mouse}=placeField_dist.all{1, 2}.A.ts.width_cm;
    RF.pfwidth.siAll{mouse}=placeField_dist.all{1, 2}.A.si.width_cm;
end

match_OCGOL_pfwidth= OCGOL_pfwidth_files(idx_ocg_cross);
for mouse=1:nMice
    load(match_OCGOL_pfwidth{mouse})
    OCGOL_A.pfwidth.ts(mouse)=mean(placeField_dist.all{1, 1}.A.ts.width_cm);
    OCGOL_B.pfwidth.ts(mouse)=mean(placeField_dist.all{1, 1}.B.ts.width_cm);
    OCGOL_A.pfwidth.si(mouse)=mean(placeField_dist.all{1, 1}.A.si.width_cm);
    OCGOL_B.pfwidth.si(mouse)=mean(placeField_dist.all{1, 1}.B.si.width_cm);
    OCGOL_A.pfcount.ts(mouse,:)= placeField_dist.all{1, 1}.A.ts.field_count_total;
    OCGOL_B.pfcount.ts(mouse,:)= placeField_dist.all{1, 1}.B.ts.field_count_total;  
    OCGOL_A.pfcount.si(mouse,:)= placeField_dist.all{1, 1}.A.si.field_count_total; 
    OCGOL_B.pfcount.si(mouse,:)= placeField_dist.all{1, 1}.B.si.field_count_total;
    OCGOL_A.pfwidth.tsAll{mouse}=placeField_dist.all{1, 1}.A.ts.width_cm;
    OCGOL_B.pfwidth.tsAll{mouse}=placeField_dist.all{1, 1}.B.ts.width_cm;
    OCGOL_A.pfwidth.siAll{mouse}=placeField_dist.all{1, 1}.A.si.width_cm;
    OCGOL_B.pfwidth.siAll{mouse}=placeField_dist.all{1, 1}.B.si.width_cm;
end

RF.pfcountFrac.ts=RF.pfcount.ts./sum(RF.pfcount.ts,2);
RF.pfcountFrac.si=RF.pfcount.si./sum(RF.pfcount.si,2);
OCGOL_A.pfcountFrac.ts=OCGOL_A.pfcount.ts./sum(OCGOL_A.pfcount.ts,2);
OCGOL_B.pfcountFrac.ts=OCGOL_B.pfcount.ts./sum(OCGOL_B.pfcount.ts,2);
OCGOL_A.pfcountFrac.si=OCGOL_A.pfcount.si./sum(OCGOL_A.pfcount.si,2);
OCGOL_B.pfcountFrac.si=OCGOL_B.pfcount.si./sum(OCGOL_B.pfcount.si,2);
%% Plotting place field width and count
pfwidth_ts=[RF.pfwidth.ts,OCGOL_A.pfwidth.ts ,OCGOL_B.pfwidth.ts];
pfwidth_si=[RF.pfwidth.si,OCGOL_A.pfwidth.si ,OCGOL_B.pfwidth.si];
%writematrix(pfwidth_si, fullfile(savepath,'pfWidth.csv'));

%figure('Renderer', 'painters', 'Position', [10 10 700 600])
figure;
subplot(1,3,1)
hold on
errorbar(1,mean(pfwidth_ts(:,1)),SEM_col(pfwidth_ts(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(pfwidth_ts(:,2)),SEM_col(pfwidth_ts(:,2)),'LineWidth',1.5,'Color',cmap_blue(12,:));
errorbar(3,mean(pfwidth_ts(:,3)),SEM_col(pfwidth_ts(:,3)),'LineWidth',1.5,'Color',cmap_red(12,:));
for i=1:size(pfwidth_ts,1)
    plot(xTickVals,pfwidth_ts(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
title('Place Field Width (TS)')
ylim([0 50])

subplot(1,3,2)
hold on
errorbar(1,mean(pfwidth_si(:,1)),SEM_col(pfwidth_si(:,1)),'LineWidth',1.5,'Color',magenta);
errorbar(2,mean(pfwidth_si(:,2)),SEM_col(pfwidth_si(:,2)),'LineWidth',1.5,'Color',cmap_blue(12,:));
errorbar(3,mean(pfwidth_si(:,3)),SEM_col(pfwidth_si(:,3)),'LineWidth',1.5,'Color',cmap_red(12,:));
for i=1:size(pfwidth_si,1)
    plot(xTickVals,pfwidth_si(i,:),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
title('Place Field Width (SI)')
ylim([0 50])

figure()
subplot(2,2,1)
hold on
shadedErrorBar(xTickVals,mean(RF.pfcount.ts),SEM_col(RF.pfcount.ts),'lineProps','m');
shadedErrorBar(xTickVals,mean(OCGOL_A.pfcount.ts),SEM_col(OCGOL_A.pfcount.ts),'lineProps','b');
shadedErrorBar(xTickVals,mean(OCGOL_B.pfcount.ts),SEM_col(OCGOL_B.pfcount.ts),'lineProps','g');
xticks(xTickVals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
title('Place Field (TS)')

subplot(2,2,2)
hold on
shadedErrorBar(xTickVals,mean(RF.pfcount.si),SEM_col(RF.pfcount.si),'lineProps','m');
shadedErrorBar(xTickVals,mean(OCGOL_A.pfcount.si),SEM_col(OCGOL_A.pfcount.si),'lineProps','b');
shadedErrorBar(xTickVals,mean(OCGOL_B.pfcount.si),SEM_col(OCGOL_B.pfcount.si),'lineProps','g');
xticks(xTickVals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
title('Place Field (SI)')

subplot(2,2,3)
hold on
shadedErrorBar(xTickVals,mean(RF.pfcountFrac.ts),SEM_col(RF.pfcountFrac.ts),'lineProps','m');
shadedErrorBar(xTickVals,mean(OCGOL_A.pfcountFrac.ts),SEM_col(OCGOL_A.pfcountFrac.ts),'lineProps','b');
shadedErrorBar(xTickVals,mean(OCGOL_B.pfcountFrac.ts),SEM_col(OCGOL_B.pfcountFrac.ts),'lineProps','g');
xticks(xTickVals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
title('Place Field Fraction (TS)')
ylim([0 1])

subplot(2,2,4)
hold on
shadedErrorBar(xTickVals,mean(RF.pfcountFrac.si),SEM_col(RF.pfcountFrac.si),'lineProps','m');
shadedErrorBar(xTickVals,mean(OCGOL_A.pfcountFrac.si),SEM_col(OCGOL_A.pfcountFrac.si),'lineProps','b');
shadedErrorBar(xTickVals,mean(OCGOL_B.pfcountFrac.si),SEM_col(OCGOL_B.pfcountFrac.si),'lineProps','g');
xticks(xTickVals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
title('Place Field Fraction (SI)')
ylim([0 1])
%% Place field width CDF
% === Settings ===
binWidth = 10;   % Bin size for CDF (e.g., 1 cm)
maxVal = 100;   % Adjust depending on your data range

x_bins = 0:binWidth:maxVal;

% === Helper function: compute CDFs ===
computeCDFMatrix = @(dataCell, bins) ...
    cell2mat(cellfun(@(x) histcounts(x, [bins, inf], 'Normalization', 'cdf'), ...
    dataCell, 'UniformOutput', false)');

% === Process each group ===
groups = {
    'RF',        RF.pfwidth.siAll,        yellow;   
    'OCGOL-A',   OCGOL_A.pfwidth.siAll,   blue;   
    'OCGOL-B',   OCGOL_B.pfwidth.siAll,   magenta;  
};

figure; subplot(1,4,1);hold on;
for i = 1:size(groups, 1)
    label = groups{i, 1};
    dataCell = groups{i, 2};
    color = groups{i, 3};

    % Compute matrix of CDFs (rows = sessions, cols = bins)
    cdf_mat = computeCDFMatrix(dataCell, x_bins);
    % Compute mean and SEM
    mean_cdf = mean(cdf_mat, 1);
    sem_cdf = std(cdf_mat, 0, 1) / sqrt(size(cdf_mat,1));

    % Plot with SEM band
    fill([x_bins, fliplr(x_bins)], ...
         [mean_cdf + sem_cdf, fliplr(mean_cdf - sem_cdf)], ...
         color, 'FaceAlpha', 0.2, 'EdgeColor', 'none',...
         'HandleVisibility','off');

    plot(x_bins, mean_cdf, 'Color', color, 'LineWidth', 2, 'DisplayName', label);
end

xlabel('PF Width (cm)');
ylabel('CDF');
legend('Location','southeast');
box on; grid on;
%% Plotting SI and TS score mean
si_paired=[RF.si_score,OCGOL_A.si_score,OCGOL_B.si_score];
ts_paired=[RF.ts_score,OCGOL_A.ts_score,OCGOL_B.ts_score];
%writematrix(si_paired, fullfile(savepath,'SIscore.csv'));

% subplot(1,4,2)
% hold on
% errorbar(1,mean(si_paired(:,1)),SEM_col(si_paired(:,1)),'LineWidth',1.5,'Color',magenta);
% errorbar(2,mean(si_paired(:,2)),SEM_col(si_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
% errorbar(3,mean(si_paired(:,3)),SEM_col(si_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
% for i=1:size(si_paired,1)
%     plot(xTickVals,si_paired(i,:),'Color',[0.5 0.5 0.5])
% end
% xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
% ylim([0 0.12])
% title('Spatial Information')
% subplot(1,2,2)
% hold on
% errorbar(1,mean(ts_paired(:,1)),SEM_col(ts_paired(:,1)),'LineWidth',1.5,'Color',magenta);
% errorbar(2,mean(ts_paired(:,2)),SEM_col(ts_paired(:,2)),'LineWidth',1.5,'Color', cmap_blue(12,:));
% errorbar(3,mean(ts_paired(:,3)),SEM_col(ts_paired(:,3)),'LineWidth',1.5,'Color', cmap_red(12,:));
% for i=1:size(ts_paired,1)
%     plot(xTickVals,ts_paired(i,:),'Color',[0.5 0.5 0.5])
% end
% ylim([0 1])
% title('Tuning Specificity')
% xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
%% CDF for SI score
% === Settings ===
binWidth = .01;   % Bin size for CDF 
maxVal = 0.2;   % Adjust depending on your data range

x_bins = 0:binWidth:maxVal;

% === Helper function: compute CDFs ===
computeCDFMatrix = @(dataCell, bins) ...
    cell2mat(cellfun(@(x) histcounts(x, [bins, inf], 'Normalization', 'cdf'), ...
    dataCell, 'UniformOutput', false)');

% === Process each group ===
groups = {
    'RF',        RF.si_scores,        yellow;   
    'OCGOL-A',   OCGOL_A.si_scores,   blue;   
    'OCGOL-B',   OCGOL_B.si_scores,   magenta;  
};

subplot(1,4,2);hold on;

for i = 1:size(groups, 1)
    label = groups{i, 1};
    dataCell = groups{i, 2};
    color = groups{i, 3};

    % Compute matrix of CDFs (rows = sessions, cols = bins)
    cdf_mat = computeCDFMatrix(dataCell, x_bins);

    % Compute mean and SEM
    mean_cdf = mean(cdf_mat, 1);
    sem_cdf = std(cdf_mat, 0, 1) / sqrt(size(cdf_mat,1));

    % Plot with SEM band
    fill([x_bins, fliplr(x_bins)], ...
         [mean_cdf + sem_cdf, fliplr(mean_cdf - sem_cdf)], ...
         color, 'FaceAlpha', 0.2, 'EdgeColor', 'none',...
         'HandleVisibility','off');

    plot(x_bins, mean_cdf, 'Color', color, 'LineWidth', 2, 'DisplayName', label);
end

xlabel('SI Score');
ylabel('CDF');
box on; grid on;
%% Plot tuning properties as a function of position

% results=friedman_stats(RF.sbSI, OCGOL_A.sbSI, OCGOL_B.sbSI,{'RF','A','B'},false);
% save(fullfile(savepath,'SIvPos_Friedman.mat'), 'results');
% writetable(results.pairwise_sig_table, fullfile(savepath,'SIvPos_Friedman.xlsx'))
subplot(1,4,3)
shadedErrorBar(pos,mean(RF.sbSI,'omitnan'),SEM_col_exNan(RF.sbSI),'lineProps',{'Color',yellow,'LineWidth',1.5});
hold on
shadedErrorBar(pos,mean(OCGOL_A.sbSI,'omitnan'),SEM_col_exNan(OCGOL_A.sbSI),'lineProps',{'Color',blue,'LineWidth',1.5});
shadedErrorBar(pos,mean(OCGOL_B.sbSI,'omitnan'),SEM_col_exNan(OCGOL_B.sbSI),'lineProps',{'Color',magenta,'LineWidth',1.5});
ylim([0 .1])
xlabel('Position'); ylabel('Spatial Information')
box off

A=[RF.sbSI' OCGOL_A.sbSI' OCGOL_B.sbSI'];
A(isnan(A)) = 0;
%writematrix(A, fullfile(savepath,'SIvsPos.csv'));
% subplot(1,2,2)
% shadedErrorBar(pos,mean(RF.sbTS,'omitnan'),SEM_col_exNan(RF.sbTS),'lineProps',{'Color',yellow,'LineWidth',1.5});
% hold on
% shadedErrorBar(pos,mean(OCGOL_A.sbTS,'omitnan'),SEM_col_exNan(OCGOL_A.sbTS),'lineProps',{'Color',blue,'LineWidth',1.5});
% shadedErrorBar(pos,mean(OCGOL_B.sbTS,'omitnan'),SEM_col_exNan(OCGOL_B.sbTS),'lineProps',{'Color',magenta,'LineWidth',1.5});
% ylim([0 1])
% xlabel('Spatial Bin (10 cm)')
% ylabel('Tuning Specificity')
% box off
%% Collecting recurrence
RF.recurr.ts=NaN(nMice,1);
RF.recurr.si=NaN(nMice,1);
OCGOL_A.recurr.ts=NaN(nMice,1);
OCGOL_B.recurr.ts=NaN(nMice,1);
OCGOL_A.recurr.si=NaN(nMice,1);
OCGOL_B.recurr.si=NaN(nMice,1);

match_RF_recurr = RF_recurr_files(idx_rf_cross);
for mouse=1:nMice
    load(match_RF_recurr{mouse})
    RF.recurr.ts(mouse)=recurr.ts.A(1,2);
    RF.recurr.si(mouse)=recurr.si.A(1,2);
end

match_OCGOL_recurr = OCGOL_recurr_files(idx_ocg_cross);
for mouse=1:nMice
    load(match_OCGOL_recurr{mouse})
    OCGOL_A.recurr.ts(mouse)=recurr.ts.A(1,2);
    OCGOL_B.recurr.ts(mouse)=recurr.ts.B(1,2);
    OCGOL_A.recurr.si(mouse)=recurr.si.A(1,2);
    OCGOL_B.recurr.si(mouse)=recurr.si.B(1,2);
end

recurr_si_paired = [RF.recurr.si,OCGOL_A.recurr.si, OCGOL_B.recurr.si];
recurr_ts_paired = [RF.recurr.ts,OCGOL_A.recurr.ts,OCGOL_B.recurr.ts];
%% Plotting recurrence

subplot(1,4,4)
hold on
for i=1:size(recurr_si_paired,1)
    plot(xTickVals,recurr_si_paired(i,:),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(recurr_si_paired(:,1)),SEM_col(recurr_si_paired(:,1)),'LineWidth',1.5,'Color',yellow);
errorbar(2,mean(recurr_si_paired(:,2)),SEM_col(recurr_si_paired(:,2)),'LineWidth',1.5,'Color',blue);
errorbar(3,mean(recurr_si_paired(:,3)),SEM_col(recurr_si_paired(:,3)),'LineWidth',1.5,'Color',magenta);

scatter(1, mean(recurr_si_paired(:,1)), 's', 'filled', 'MarkerFaceColor', yellow)
scatter(2, mean(recurr_si_paired(:,2)), 's', 'filled', 'MarkerFaceColor', blue)
scatter(3, mean(recurr_si_paired(:,3)), 's', 'filled', 'MarkerFaceColor', magenta)

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 1]); ylabel('Recurrence')
xlabel('Position (cm)')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');

%writematrix(recurr_si_paired, fullfile(savepath,'recurr.csv'));
% subplot(1,2,2)
% hold on
% errorbar(1,mean(recurr_ts_paired(:,1)),SEM_col(recurr_ts_paired(:,1)),'LineWidth',1.5,'Color',magenta);
% errorbar(2,mean(recurr_ts_paired(:,2)),SEM_col(recurr_ts_paired(:,2)),'LineWidth',1.5,'Color',cmap_blue(12,:));
% errorbar(3,mean(recurr_ts_paired(:,3)),SEM_col(recurr_ts_paired(:,3)),'LineWidth',1.5,'Color',cmap_red(12,:));
% for i=1:size(recurr_ts_paired,1)
%     plot(xTickVals,recurr_ts_paired(i,:),'Color',[0.5 0.5 0.5])
% end
% xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
% ylim([0 1])
% title('Recurrence (TS)')