function dataStruct = computeSpatialTuningStats(files, placeCellIndex)
% Computes spatial information and tuning specificity stats from Place_cell data.
% files: cell array of .mat file paths
% placeCellIndex: index of Place_cell to use (e.g., 1 for RF, 4/5 for OCGOL)
% Returns a struct with various fields filled in per mouse

    nFiles = length(files);
    
    dataStruct.si_score = NaN(nFiles, 1);
    dataStruct.ts_score = NaN(nFiles, 1);
    dataStruct.si_scores = cell(1, nFiles);
    dataStruct.ts_scores = cell(1, nFiles);
    
    dataStruct.activeROI = NaN(nFiles, 1);
    dataStruct.siTuned = NaN(nFiles, 1);
    dataStruct.tsTuned = NaN(nFiles, 1);
    dataStruct.SiTsTuned = NaN(nFiles, 1);
    dataStruct.SiorTsTuned = NaN(nFiles, 1);
    
    for i = 1:nFiles
        loaded = load(files{i}, 'Place_cell');
        pc = loaded.Place_cell{1, placeCellIndex};

        si_idx = pc.Spatial_Info.significant_ROI;
        ts_idx = pc.Tuning_Specificity.significant_ROI;

        bin = size(pc.Spatial_Info.Spatial_Info, 1);
        si_scores = pc.Spatial_Info.Spatial_Info(bin, si_idx);
        ts_scores = pc.Tuning_Specificity.tuning_specificity(ts_idx);

        dataStruct.si_scores{i} = si_scores;
        dataStruct.ts_scores{i} = ts_scores;

        dataStruct.si_score(i) = mean(si_scores);
        dataStruct.ts_score(i) = mean(ts_scores);

        activeROIs = length(si_idx) - sum(sum(pc.Spatial_Info.Run_onset_bin) == 0);
        dataStruct.activeROI(i) = activeROIs;
        dataStruct.siTuned(i) = sum(si_idx);
        dataStruct.tsTuned(i) = sum(ts_idx);
        dataStruct.SiTsTuned(i) = length(pc.Tuned_ROI);
        dataStruct.SiorTsTuned(i) = sum(ts_idx | si_idx);
    end
end