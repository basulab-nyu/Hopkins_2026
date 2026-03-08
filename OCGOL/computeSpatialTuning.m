function dataStruct = computeSpatialTuning(matchedMice, ca_files, cent_files, trialType)
% Computes spatial information and tuning specificity stats from Place_cell data.
% matchedMice: cell array of names of mice with a matching RF and OCGOL
% session 
% ca_files: cell array of ca analysis .mat file names for matched mice
% cent_files: cell array of cent_diff .mat file names for matched mice that is from cross session
% analysis
% trialType: 1= RF, 4= A trials, 5= B trials
% Returns a struct with various fields filled in per mouse

edges = 0:5:100;
nMice = length(matchedMice);
dataStruct.pfCentrDistr = NaN(nMice,length(edges)-1);
dataStruct.pfCentrDistr_si = NaN(nMice,length(edges)-1);
dataStruct.pfCentrDistr_ts = NaN(nMice,length(edges)-1);
dataStruct.sbSI = NaN(nMice,length(edges)-1);
dataStruct.sbTS = NaN(nMice,length(edges)-1);


dataStruct.si_score = NaN(nMice, 1);
dataStruct.ts_score = NaN(nMice, 1);
dataStruct.si_scores = cell(1, nMice);
dataStruct.ts_scores = cell(1, nMice);

dataStruct.activeROI = NaN(nMice, 1);
dataStruct.siTuned = NaN(nMice, 1);
dataStruct.tsTuned = NaN(nMice, 1);
dataStruct.SiTsTuned = NaN(nMice, 1);
dataStruct.SiorTsTuned = NaN(nMice, 1);
    
for i = 1:nMice
        %Load in place cell score information
        loaded = load(ca_files{i}, 'Place_cell');
        pc = loaded.Place_cell{1, trialType};

        si_idx = pc.Spatial_Info.significant_ROI;
        ts_idx = pc.Tuning_Specificity.significant_ROI;

        bin = size(pc.Spatial_Info.Spatial_Info, 1);
        all_si_scores=pc.Spatial_Info.Spatial_Info(bin,:);
        all_ts_scores=pc.Tuning_Specificity.tuning_specificity;
        si_scores = pc.Spatial_Info.Spatial_Info(bin, si_idx);
        ts_scores = pc.Tuning_Specificity.tuning_specificity(ts_idx);

        dataStruct.si_scores{i} = si_scores;
        dataStruct.ts_scores{i} = ts_scores;
        
        %Calculate average tuning scores
        dataStruct.si_score(i) = mean(si_scores);
        dataStruct.ts_score(i) = mean(ts_scores);
        
        %Calculate number active cells and tuned cells (different criteria)
        %For activeROIs does not count ROIs that don't have any events during run
        activeROIs = length(si_idx) - sum(sum(pc.Spatial_Info.Run_onset_bin) == 0);
        dataStruct.activeROI(i) = activeROIs;
        dataStruct.siTuned(i) = sum(si_idx);
        dataStruct.tsTuned(i) = sum(ts_idx);
        dataStruct.SiTsTuned(i) = length(pc.Tuned_ROI);
        dataStruct.SiorTsTuned(i) = sum(ts_idx | si_idx);
        
        %Load in centroid data
        loaded_2 = load(cent_files{i}, 'cent_diff');
        if trialType==1
            centMatrix=loaded_2.cent_diff.all_sig_bin{1,2}{1,trialType}; %Centroids for all cells
            centMatrix_si= centMatrix(si_idx); %Centroids for SI tuned cells
            centMatrix_ts= centMatrix(ts_idx); %Centroids for TS tuned cells
        else 
            centMatrix=loaded_2.cent_diff.all_sig_bin{1,1}{1,trialType};
            centMatrix_si= centMatrix(si_idx);
            centMatrix_ts= centMatrix(ts_idx);
        end
        %centroid distribution for all cells
        empty_cells = cellfun(@isempty, centMatrix);
        nan_cells = cellfun(@(x) any(isnan(x)), centMatrix);
        valid_cells = centMatrix(~empty_cells & ~nan_cells);
        centers=cat(1, valid_cells{:})';
        centersDistr= histcounts(centers,edges)/length(centers);
        dataStruct.pfCentrDistr(i,:)=centersDistr;

        %centroid distribution for SI tuned cells
        empty_cells_si = cellfun(@isempty, centMatrix_si);
        nan_cells_si = cellfun(@(x) any(isnan(x)), centMatrix_si);
        valid_cells_si = centMatrix_si(~empty_cells_si & ~nan_cells_si);
        centers_si=cat(1, valid_cells_si{:})';      
        centersDistr_si= histcounts(centers_si,edges)/length(centers_si);
        dataStruct.pfCentrDistr_si(i,:)=centersDistr_si;

        %centroid distribution for TS tuned cells
        empty_cells_ts = cellfun(@isempty, centMatrix_ts);
        nan_cells_ts = cellfun(@(x) any(isnan(x)), centMatrix_ts);
        valid_cells_ts = centMatrix_ts(~empty_cells_ts & ~nan_cells_ts);
        centers_ts=cat(1, valid_cells_ts{:})';    
        centersDistr_ts= histcounts(centers_ts,edges)/length(centers_ts);
        dataStruct.pfCentrDistr_ts(i,:)=centersDistr_ts;

        % Initialize output vectors for spatial bin vs. score
        si_positions_bin = [];
        si_scores_bin = [];

        ts_positions_bin= [];
        ts_scores_bin = [];

        % Get the indexes of significant ROIs using logical indexing
        si_significant_idx = find(si_idx); 
        ts_significant_idx = find(ts_idx); 
        
        % Loop through significant ROI indexes (SI)
        for i_roi = 1:length(si_significant_idx)
            idx = si_significant_idx(i_roi); % Get the current significant ROI index
            current_positions = centMatrix{idx}'; % Get positions for this ROI
            current_score = all_si_scores(idx); % Get corresponding score
        
            % Append positions and scores
            si_positions_bin = [si_positions_bin, current_positions]; % Concatenate positions
            si_scores_bin = [si_scores_bin, repmat(current_score, 1, length(current_positions))]; % Repeat score
        end
        % Loop through significant ROI indexes (TS)
        for i_roi = 1:length(ts_significant_idx)
            idx = ts_significant_idx(i_roi); % Get the current significant ROI index
            current_positions = centMatrix{idx}'; % Get positions for this ROI
            current_score = all_ts_scores(idx); % Get corresponding score
        
            % Append positions and scores
            ts_positions_bin = [ts_positions_bin, current_positions]; % Concatenate positions
            ts_scores_bin = [ts_scores_bin, repmat(current_score, 1, length(current_positions))]; % Repeat score
        end

        % Calculate the average tuning scores for each bin (SI criteria)
        % Use histcounts to get the bin indices 
        [~, binIdx] = histc(si_positions_bin, edges);
        
        % Initialize an array to hold average scores for each bin
        averageScores = zeros(1, length(edges)-1);
        
        % Calculate average scores for each bin
        for i_bin = 1:length(averageScores)
            % Get the scores for the current bin
            binScores = si_scores_bin(binIdx == i_bin);
            if ~isempty(binScores)
                averageScores(i_bin) = mean(binScores); % Calculate the mean score
            else
                averageScores(i_bin) = NaN; % Assign NaN if no scores in the bin
            end
        end
        dataStruct.sbSI(i,:)=averageScores;
        
        % Calculate the average tuning scores for each bin (TS criteria)
        % Use histcounts to get the bin indices 
        [~, binIdx] = histc(ts_positions_bin, edges);
        
        % Initialize an array to hold average scores for each bin
        averageScores = zeros(1, length(edges)-1);
        
        % Calculate average scores for each bin
        for i_bin = 1:length(averageScores)
            % Get the scores for the current bin
            binScores = ts_scores_bin(binIdx == i_bin);
            if ~isempty(binScores)
                averageScores(i_bin) = mean(binScores); % Calculate the mean score
            else
                averageScores(i_bin) = NaN; % Assign NaN if no scores in the bin
            end
        end
        dataStruct.sbTS(i,:)=averageScores;
end