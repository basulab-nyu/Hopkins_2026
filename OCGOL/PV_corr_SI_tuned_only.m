function dataStruct = PVcorr_SI_tuned_only(matchedMice, PV_files, taskType)

% taskType:
% 1 = A trials only
% 2 = A and B trials

nMice = length(matchedMice);

%% Determine number of sessions from first mouse
tmp = load(PV_files{1});
nSessions = size(tmp.PV_TC_corr.PVcorr_all_ses_no_nan_STCs.A,1);

%% Loop through mice
for i = 1:nMice
    
    mouseName = matchedMice{i};
    
    load_PV = load(PV_files{i});    
    PV_TC_corr = load_PV.PV_TC_corr;
    
    %% ============================
    % Preallocate per mouse
    %% ============================
    
    dataStruct.(mouseName).meanPV.A = NaN(nSessions,nSessions);
    dataStruct.(mouseName).nNeurons.A = NaN(nSessions,nSessions);
    dataStruct.(mouseName).PVcorr.A = cell(nSessions,nSessions);
    dataStruct.(mouseName).meanPV_rel_d1.A = NaN(1,nSessions-1);
    
    if taskType == 2
        dataStruct.(mouseName).meanPV.B = NaN(nSessions,nSessions);
        dataStruct.(mouseName).nNeurons.B = NaN(nSessions,nSessions);
        dataStruct.(mouseName).PVcorr.B = cell(nSessions,nSessions);
        dataStruct.(mouseName).meanPV_rel_d1.B = NaN(1,nSessions-1);
    end
    
    %% ============================
    % Session comparisons
    %% ============================
    
    for ii = 1:nSessions
        for jj = 1:nSessions
            
            %% ============================
            % A TRIALS
            %% ============================
            
            match_A = PV_TC_corr.TCcorr_idx_match.si.A{ii,jj};              % tuned matched (original indices)
            all_match_A = PV_TC_corr.PV_corr_idx_match.A{ii,jj};            % all matched (original indices)
            
            if ~isempty(match_A) && ~isempty(all_match_A)
                
                % Find which rows in all_match_A correspond to match_A
                [~, idx_A] = ismember(match_A, all_match_A, 'rows');
                
                % Remove any non-matching rows (shouldn't happen, but safe)
                idx_A = idx_A(idx_A > 0);
                
                if ~isempty(idx_A)
                    
                    STC1 = PV_TC_corr.PVcorr_all_ses_no_nan_STCs.A{ii,jj}{1}(idx_A,:);
                    STC2 = PV_TC_corr.PVcorr_all_ses_no_nan_STCs.A{ii,jj}{2}(idx_A,:);
                    
                    corrMat = corr(STC1,STC2,'type','Pearson');
                    meanVal = nanmean(diag(corrMat));
                    
                    dataStruct.(mouseName).PVcorr.A{ii,jj} = corrMat;
                    
                else
                    meanVal = NaN;
                    dataStruct.(mouseName).PVcorr.A{ii,jj} = [];
                end
                
                dataStruct.(mouseName).nNeurons.A(ii,jj) = length(idx_A);
                
            else
                meanVal = NaN;
                dataStruct.(mouseName).nNeurons.A(ii,jj) = 0;
                dataStruct.(mouseName).PVcorr.A{ii,jj} = [];
            end
            
            dataStruct.(mouseName).meanPV.A(ii,jj) = meanVal;
            
            
            %% ============================
            % B TRIALS (optional)
            %% ============================
            
            if taskType == 2
                
                match_B = PV_TC_corr.TCcorr_idx_match.si.B{ii,jj};
                all_match_B = PV_TC_corr.PV_corr_idx_match.B{ii,jj}; 
                
                if ~isempty(match_B) && ~isempty(all_match_B)
                    
                    % Find which rows in all_match_A correspond to match_B
                    [~, idx_B] = ismember(match_B, all_match_B, 'rows');
                    
                    % Remove any non-matching rows (shouldn't happen, but safe)
                    idx_B = idx_B(idx_B > 0);
                    
                    if ~isempty(idx_B)
                        
                        STC1 = PV_TC_corr.PVcorr_all_ses_no_nan_STCs.B{ii,jj}{1}(idx_B,:);
                        STC2 = PV_TC_corr.PVcorr_all_ses_no_nan_STCs.B{ii,jj}{2}(idx_B,:);
                        
                        corrMat = corr(STC1,STC2,'type','Pearson');
                        meanVal = nanmean(diag(corrMat));
                        
                        dataStruct.(mouseName).PVcorr.B{ii,jj} = corrMat;
                        
                    else
                        meanVal = NaN;
                        dataStruct.(mouseName).PVcorr.B{ii,jj} = [];
                    end
                    
                    dataStruct.(mouseName).nNeurons.B(ii,jj) = length(idx_B);
                    
                else
                    meanVal = NaN;
                    dataStruct.(mouseName).nNeurons.B(ii,jj) = 0;
                    dataStruct.(mouseName).PVcorr.B{ii,jj} = [];
                end
                
                dataStruct.(mouseName).meanPV.B(ii,jj) = meanVal;
                
            end
            
        end
    end
    
    
    %% ============================
    % Relative to Day 1
    %% ============================
    
    for ss = 2:nSessions
        
        dataStruct.(mouseName).meanPV_rel_d1.A(ss-1) = ...
            dataStruct.(mouseName).meanPV.A(1,ss);
        
        if taskType == 2
            dataStruct.(mouseName).meanPV_rel_d1.B(ss-1) = ...
                dataStruct.(mouseName).meanPV.B(1,ss);
        end
        
    end
    
end

end
