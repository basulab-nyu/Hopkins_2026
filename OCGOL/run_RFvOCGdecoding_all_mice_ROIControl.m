function [RF, OCGOL_A, OCGOL_B] = run_RFvOCGdecoding_all_mice_ROIControl(baseDir)
% baseDir = 'R:\basulabspace\MH\Decoding';
% trialTypeToUse: 2 or 3

    mouseFolders = dir(fullfile(baseDir, 'MH*'));
    mouseNames = {};
    
    % Filter out folders missing either '1' or '2' subfolders or the required .mat files
    for i = 1:length(mouseFolders)
        mousePath = fullfile(baseDir, mouseFolders(i).name);
        path1 = fullfile(mousePath, '1', 'matched_transients_all_ses.mat');
        path2 = fullfile(mousePath, '2', 'matched_transients_all_ses.mat');
        if exist(path1, 'file') && exist(path2, 'file')
            mouseNames{end+1} = mouseFolders(i).name; %#ok<AGROW>
        else
            fprintf('Skipping %s (missing .mat in 1 or 2)\n', mouseFolders(i).name);
        end
    end

    fprintf('Processing %d mice...\n', length(mouseNames));

    % Initialize output
    RF = struct();       % For folder '1' with indice = 3
    OCGOL_A = struct();  % For folder '2' with indice = 2
    OCGOL_B = struct();  % For folder '2' with indice = 3

    % Process each mouse
    for iMouse = 1:length(mouseNames)
        mouse = mouseNames{iMouse};
        fprintf('Running mouse %s\n', mouse);

        % Get the number of ROIs in RF and OCGOL conditions
        dataPath1 = fullfile(baseDir, mouse, '1', 'matched_transients_all_ses.mat');
        dataPath2 = fullfile(baseDir, mouse, '2', 'matched_transients_all_ses.mat');
        
        RF_match= load(dataPath1, 'matching_ROI_bin_transient_lap_data');
        RF_numROI= size(RF_match.matching_ROI_bin_transient_lap_data{1,1}.transient_mat,1);
       
        OCGOL_match = load(dataPath2, 'matching_ROI_bin_transient_lap_data');
        OCGOL_numROI = size(OCGOL_match.matching_ROI_bin_transient_lap_data{1,1}.transient_mat, 1);

        % Folder '1' RF Condition (always uses indice=3)
        if exist(dataPath1, 'file')
            if RF_numROI > OCGOL_numROI
                RF.(mouse) = run_PosDecoding(dataPath1, 3, 0, OCGOL_numROI);
            else
                RF.(mouse) = run_PosDecoding(dataPath1, 3, 0);
            end
        end

        % Folder '2' OCGOL Condition (run twice with indice=2 and indice=3)
        if exist(dataPath2, 'file')
            if OCGOL_numROI > RF_numROI
                OCGOL_A.(mouse) = run_PosDecoding(dataPath2, 2, 1, RF_numROI);
                OCGOL_B.(mouse) = run_PosDecoding(dataPath2, 3, 1, RF_numROI);
            else
                OCGOL_A.(mouse) = run_PosDecoding(dataPath2, 2, 1);
                OCGOL_B.(mouse) = run_PosDecoding(dataPath2, 3, 1);
            end
        end
    end

    fprintf('Saving structure.\n');

    % Define the filename
    filename = fullfile(baseDir, 'DecodingErr_RFvOCG_ROIControl');
    date_string = datetime('now', 'Format', 'yyyyMMdd');
    filename = [filename, char(date_string), '.mat'];
   
    % Save the structures
    save(filename,'RF','OCGOL_A', 'OCGOL_B');

end