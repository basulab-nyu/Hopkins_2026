function [OCGOL_A, OCGOL_B] = run_OCGSil_decoding_all_mice(baseDir) %Treats sessions as trials being split
% baseDir = 'R:\MH\Decoding_LECSilence';
% trialTypeToUse: 2 or 3

    mouseFolders = dir(fullfile(baseDir, 'MH*'));
    mouseNames = {};
    
    % Filter out folders missing '1' subfolders or the required .mat files
    for i = 1:length(mouseFolders)
        mousePath = fullfile(baseDir, mouseFolders(i).name);
        path1 = fullfile(mousePath, '1', 'matched_transients_all_ses.mat');
        if exist(path1, 'file') 
            mouseNames{end+1} = mouseFolders(i).name; %#ok<AGROW>
        else
            fprintf('Skipping %s (missing 1.mat)\n', mouseFolders(i).name);
        end
    end

    fprintf('Processing %d mice...\n', length(mouseNames));

    % Initialize output
    OCGOL_A = struct();  % For folder '1' with indice = 2
    OCGOL_B = struct();  % For folder '1' with indice = 3

    % Process each mouse
    for iMouse = 1:length(mouseNames)
        mouse = mouseNames{iMouse};
        fprintf('Running mouse %s\n', mouse);

        % Folder '1' (run twice with indice=2 and indice=3)
        dataPath1 = fullfile(baseDir, mouse, '1', 'matched_transients_all_ses.mat');
        if exist(dataPath1, 'file')
            OCGOL_A.(mouse) = run_PosDecoding(dataPath1, 2, 1);
            OCGOL_B.(mouse) = run_PosDecoding(dataPath1, 3, 1);
        end
    end

    fprintf('Saving structure.\n');
    
    % Define the filename
    filename = fullfile(baseDir, 'DecodingErr_LECSil_');
    date_string = datetime('now', 'Format', 'yyyyMMdd');
    filename = [filename, char(date_string), '.mat'];
   
    % Save the structures
    save(filename, 'OCGOL_A', 'OCGOL_B');
    

end
