%Save path for stats export
savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\6'; % Path to save directory

%Load in pre-processed psotion decoding
task = load("R:\basulabspace\MH\Decoding\DecodingErr_RFvOCG_20250904.mat");
%task = load("R:\basulabspace\MH\Decoding\DecodingErr_RFvOCG_ROIControl20251022.mat");
LECSil = load("R:\basulabspace\MH\Decoding_LECSilence\DecodingErr_LECSil_20250904.mat");
LECSil_noSplit = load("R:\basulabspace\MH\Decoding_LECSilence\PosTrial_DecodingErr_LECSil_20250915.mat");

%RF vs. OCGOL position decoding for all mice
% Get mouse names from one of the condition fields
mouseNames = fieldnames(task.RF);
nMice = numel(mouseNames);

% Initialize outputs
errorMatrix = zeros(nMice, 3);
errorAllBins = cell(nMice, 3);

for i = 1:nMice
    mouse = mouseNames{i};

    % Extract position error values
    errorMatrix(i, 1) = task.RF.(mouse).error(2);           % RF day 2
    errorMatrix(i, 2) = task.OCGOL_A.(mouse).error(1);      % OCGOL_A day 1
    errorMatrix(i, 3) = task.OCGOL_B.(mouse).error(1);      % OCGOL_B day 1

    % Extract position error_allBin arrays
    errorAllBins{i, 1} = task.RF.(mouse).error_allBin{2};        % RF day 2
    errorAllBins{i, 2} = task.OCGOL_A.(mouse).error_allBin{1};   % OCGOL_A day 1
    errorAllBins{i, 3} = task.OCGOL_B.(mouse).error_allBin{1};   % OCGOL_B day 1
end

%LEC Recall Silencing position decoding
% Get mouse names from one of the condition fields
mouseNames = fieldnames(LECSil.OCGOL_A);
nMice = numel(mouseNames);

% Initialize outputs
errorMatrix_LEC = zeros(nMice, 4);
errorAllBins_LEC = cell(nMice, 4);
TrialErrorMatrix_LEC = zeros(nMice, 6);
TrialErrorAllBins_LEC = cell(nMice, 2);

for i = 1:nMice
    mouse = mouseNames{i};
    
    % Use index offset depending on mouse
    if strcmp(mouse, 'MH115')
        idx = [1 2];  % Special case
    else
        idx = [2 3];  % Default case
    end

    % Position error and error_allBin
    for j = 1:2  % control, silence
        errorMatrix_LEC(i, j    ) = LECSil.OCGOL_A.(mouse).error(idx(j));
        errorMatrix_LEC(i, j + 2) = LECSil.OCGOL_B.(mouse).error(idx(j));
        
        errorAllBins_LEC{i, j    } = LECSil.OCGOL_A.(mouse).error_allBin{idx(j)};
        errorAllBins_LEC{i, j + 2} = LECSil.OCGOL_B.(mouse).error_allBin{idx(j)};
    end

    % Position error
    

    % Trial decoding values
    TrialErrorMatrix_LEC(i,1:2) = LECSil_noSplit.OCGOL.(mouse).decoding(idx);
    TrialErrorMatrix_LEC(i,3:4) = LECSil_noSplit.OCGOL.(mouse).decoding_A(idx);
    TrialErrorMatrix_LEC(i,5:6) = LECSil_noSplit.OCGOL.(mouse).decoding_B(idx);
    
    % Trial decoding allBin
    for j = 1:2
        TrialErrorAllBins_LEC{i,j} = LECSil_noSplit.OCGOL.(mouse).confusion_allBin{idx(j)};
    end
end

%% Plot colors
magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.97 0.58 0.11];
black=[0 0 0];

%Parameters
xTickVals = [1:7];
xTickLabels = {'Saline-A','CNO-A','Saline-B','CNO-B','OCGOL-A','OCGOL-B','RF'};
xLimits = [0 8];

%Decoding error
figure; 
subplot(1,4,4); hold on;
yline(mean(errorMatrix(:,1)),'--','LineWidth',1)
errorbar(7,mean(errorMatrix(:,1)),SEM_col(errorMatrix(:,1)),'LineWidth',2,'Color', yellow);
scatter(7,mean(errorMatrix(:,1)),'s','filled','MarkerFaceColor',yellow);
errorbar(5,mean(errorMatrix(:,2)),SEM_col(errorMatrix(:,2)),'LineWidth',2,'Color', blue);
scatter(5,mean(errorMatrix(:,2)),'s','filled','MarkerFaceColor',blue);
errorbar(6,mean(errorMatrix(:,3)),SEM_col(errorMatrix(:,3)),'LineWidth',2,'Color', magenta);
scatter(6,mean(errorMatrix(:,3)),'s','filled','MarkerFaceColor',magenta);

errorbar(1,mean(errorMatrix_LEC(:,1)),SEM_col(errorMatrix_LEC(:,1)),'LineWidth',2,'Color', blue);
scatter(1,mean(errorMatrix_LEC(:,1)),'s','filled','MarkerFaceColor',blue);
errorbar(2,mean(errorMatrix_LEC(:,2)),SEM_col(errorMatrix_LEC(:,2)),'LineWidth',2,'Color', blue + 0.50 * (1 - blue));
scatter(2,mean(errorMatrix_LEC(:,2)),'s','filled','MarkerFaceColor',blue + 0.50 * (1 - blue));
errorbar(3,mean(errorMatrix_LEC(:,3)),SEM_col(errorMatrix_LEC(:,3)),'LineWidth',2,'Color', magenta);
scatter(3,mean(errorMatrix_LEC(:,3)),'s','filled','MarkerFaceColor',magenta);
errorbar(4,mean(errorMatrix_LEC(:,4)),SEM_col(errorMatrix_LEC(:,4)),'LineWidth',2,'Color', magenta + 0.50 * (1 - magenta));
scatter(4,mean(errorMatrix_LEC(:,4)),'s','filled','MarkerFaceColor',magenta + 0.50 * (1 - magenta));

for i=1:size(errorMatrix,1)
    plot(xTickVals(5:7),errorMatrix(i,[2,3,1]),'Color',[0.5 0.5 0.5])
end

for i=1:size(errorMatrix_LEC,1) %A trials
    plot(xTickVals(1:2),errorMatrix_LEC(i,1:2),'Color',[0.5 0.5 0.5])
end

for i=1:size(errorMatrix_LEC,1) %B trials
    plot(xTickVals(3:4),errorMatrix_LEC(i,3:4),'Color',[0.5 0.5 0.5])
end
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 30]); ylabel('Pos Decoding Error (cm)')



% Error across all bins - for task demand
[nMice, nCols] = size(errorAllBins); 

% Preallocate a cell to store the error per spatial bin for all mice
RFvOCG_decodeAllBins = cell(1, nCols);

for col = 1:nCols % 1-RF, 2-OCGOLA, 3-OCGOLB
    currentCol = errorAllBins(:, col);  
    dataMatrix = NaN(nMice, 40);  
    
    for i = 1:nMice
        thisData = currentCol{i};
        thisData = thisData(:);  % Flatten in case it's not a row
        if numel(thisData) == 40
            dataMatrix(i, :) = thisData;
        else
            warning('Cell (%d,%d) does not contain 40 elements.', i, col);
        end
    end
    
    % Store result
    RFvOCG_decodeAllBins{col} = dataMatrix;
end

pos=1:5:200;
results=friedman_stats(RFvOCG_decodeAllBins{1}, RFvOCG_decodeAllBins{2}, RFvOCG_decodeAllBins{3},{'RF','A','B'},false);
%save(fullfile(savepath,'PosDecode_RFvOCG_AllCells_Friedman.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'PosDecode_RFvOCG_AllCells_Friedman.xlsx'))
%----For ROI control----------------------------
%save(fullfile(savepath,'PosDecode_RFvOCG_ROIControl_Friedman.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'PosDecode_RFvOCG_ROIControl_Friedman.xlsx'))
%----For ROI control----------------------------
subplot(1,4,3); hold on;
shadedErrorBar(pos,nanmean(RFvOCG_decodeAllBins{1}),SEM_col_exNan(RFvOCG_decodeAllBins{1}),'lineProps',{'Color',yellow,'LineWidth',1.5});
shadedErrorBar(pos,nanmean(RFvOCG_decodeAllBins{2}),SEM_col_exNan(RFvOCG_decodeAllBins{2}),'lineProps',{'Color',blue,'LineWidth',1.5});
shadedErrorBar(pos,nanmean(RFvOCG_decodeAllBins{3}),SEM_col_exNan(RFvOCG_decodeAllBins{3}),'lineProps',{'Color',magenta,'LineWidth',1.5});
xlabel('Position (cm)'); ylabel('Pos Decoding Error (cm)'); ylim([0 30])
xline(pos(12),'--','Color',magenta,'LineWidth',1.5)
xline(pos(28),'--','Color',blue,'LineWidth',1.5)
plotSignificanceBars(gca,pos,results)
%legend('RF','OCGOL-A','OCGOL-B')


% Error across all bins for silencing
[nMice, nCols] = size(errorAllBins_LEC); 

% Preallocate a cell to store the error per spatial bin for all mice
LECSil_decodeAllBins = cell(1, nCols);

for col = 1:nCols % 1-Saline A, 2-CNO A, 3-Saline B, 4-CNO B
    currentCol = errorAllBins_LEC(:, col);  
    dataMatrix = NaN(nMice, 40);  
    
    for i = 1:nMice
        thisData = currentCol{i};
        thisData = thisData(:);  % Flatten in case it's not a row
        if numel(thisData) == 40
            dataMatrix(i, :) = thisData;
        else
            warning('Cell (%d,%d) does not contain 40 elements.', i, col);
        end
    end
    
    % Store result
    LECSil_decodeAllBins{col} = dataMatrix;
end

results=friedman_stats(LECSil_decodeAllBins{1}, LECSil_decodeAllBins{2}, [],{'Saline','CNO'},false);
%save(fullfile(savepath,'PosDecode_A_LEC_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'PosDecode_A_LEC_Wilcoxon.xlsx'))
subplot(1,4,1); hold on;
shadedErrorBar(pos,nanmean(LECSil_decodeAllBins{1}),SEM_col_exNan(LECSil_decodeAllBins{1}),'lineProps',{'Color',blue, 'LineWidth',1.5});
shadedErrorBar(pos,nanmean(LECSil_decodeAllBins{2}),SEM_col_exNan(LECSil_decodeAllBins{2}),'lineProps',{'Color',blue + 0.50 * (1 - blue), 'LineWidth',1.5,'LineStyle','--'});
%legend('OCGOL-A: Saline','OCGOL-A: CNO')
xlabel('Position (cm)'); ylabel('Pos Decoding Error (cm)'); ylim([0 30]);
ylim([0 30])
xline(pos(12),'--','Color',magenta,'LineWidth',1.5)
xline(pos(28),'--','Color',blue,'LineWidth',1.5)
plotSignificanceBars(gca,pos,results)

results=friedman_stats(LECSil_decodeAllBins{3}, LECSil_decodeAllBins{4}, [],{'Saline','CNO'},false);
%save(fullfile(savepath,'PosDecode_B_LEC_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'PosDecode_B_LEC_Wilcoxon.xlsx'))
subplot(1,4,2); hold on;
shadedErrorBar(pos,nanmean(LECSil_decodeAllBins{3}),SEM_col_exNan(LECSil_decodeAllBins{3}),'lineProps',{'Color',magenta, 'LineWidth',1.5});
shadedErrorBar(pos,nanmean(LECSil_decodeAllBins{4}),SEM_col_exNan(LECSil_decodeAllBins{4}),'lineProps',{'Color',magenta + 0.50 * (1 - magenta), 'LineWidth',1.5,'LineStyle','--'});
%legend('OCGOL-B: Saline','OCGOL-B: CNO')
xlabel('Position (cm)'); ylabel('Pos Decoding Error (cm)'); ylim([0 30]);
xline(pos(12),'--','Color',magenta,'LineWidth',1.5)
xline(pos(28),'--','Color',blue,'LineWidth',1.5)
plotSignificanceBars(gca,pos,results)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')
%exportgraphics(gcf, 'Fig6_posDecode.pdf', 'ContentType', 'vector','Resolution',300);

%Export position decoding for stats
% writematrix([LECSil_decodeAllBins{1}' LECSil_decodeAllBins{2}'], fullfile(savepath,'A_posDecode_allSB_LEC.csv'));
% writematrix([LECSil_decodeAllBins{3}' LECSil_decodeAllBins{4}'], fullfile(savepath,'B_posDecode_allSB_LEC.csv'));
% writematrix([RFvOCG_decodeAllBins{1}' RFvOCG_decodeAllBins{2}' RFvOCG_decodeAllBins{3}'], fullfile(savepath,'posDecode_allSB_RFvOCG.csv'));
% writematrix(errorMatrix(:,[2,3,1]), fullfile(savepath,'posDecode_RFvOCG.csv'))
% writematrix(errorMatrix_LEC(:,[1,2]), fullfile(savepath,'A_posDecode_LEC.csv'))
% writematrix(errorMatrix_LEC(:,[3,4]), fullfile(savepath,'B_posDecode_LEC.csv'))

%writematrix(errorMatrix(:,[2,3,1]),
%fullfile(savepath,'posDecode_ROIcontrol_RFvOCG.csv'))  for roi control
%only
%% For generating silencing graphs with decoding of trial type 
% (training done with all first half laps - not separated by trial type)

%Parameters
xTickVals = [1:6];
xTickLabels = {[],[],'A-Saline','A-CNO','B-Saline','B-CNO'};
xLimits = [2 7];

%Decoding trial type error (single value)
figure; 
hold on

errorbar(3,1-mean(TrialErrorMatrix_LEC(:,3)),SEM_col(TrialErrorMatrix_LEC(:,3)),'LineWidth',2,'Color', blue);
errorbar(4,1-mean(TrialErrorMatrix_LEC(:,4)),SEM_col(TrialErrorMatrix_LEC(:,4)),'LineWidth',2,'Color', blue + 0.50 * (1 - blue));

errorbar(5,1-mean(TrialErrorMatrix_LEC(:,5)),SEM_col(TrialErrorMatrix_LEC(:,5)),'LineWidth',2,'Color', magenta);
errorbar(6,1-mean(TrialErrorMatrix_LEC(:,6)),SEM_col(TrialErrorMatrix_LEC(:,6)),'LineWidth',2,'Color', magenta + 0.50 * (1 - magenta));
legend('A-Saline','A-CNO','B-Saline','B-CNO','location','northwest')

for i=1:size(TrialErrorMatrix_LEC,1)
    plot(xTickVals(3:4),1-TrialErrorMatrix_LEC(i,3:4),'Color',[0.5 0.5 0.5],'HandleVisibility', 'off')
end

for i=1:size(TrialErrorMatrix_LEC,1)
    plot(xTickVals(5:6),1-TrialErrorMatrix_LEC(i,5:6),'Color',[0.5 0.5 0.5],'HandleVisibility', 'off')
end

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 0.5]); ylabel('Identification Error')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')

%%
% Error across all bins for silencing
[nMice, nCols] = size(TrialErrorAllBins_LEC); 

% Preallocate a cell to store the error per spatial bin for all mice
LECSil_decodeTrialAllBins = cell(1, nCols);

for col = 1:nCols % 1-Saline , 2-CNO 
    currentCol = TrialErrorAllBins_LEC(:, col);  
    dataMatrix = NaN(nMice, 80);  
    
    for i = 1:nMice
        thisData = currentCol{i};
        thisData = thisData(:);  % Flatten in case it's not a row
        if numel(thisData) == 80
            dataMatrix(i, :) = thisData;
        else
            warning('Cell (%d,%d) does not contain 40 elements.', i, col);
        end
    end
    
    % Store result
    LECSil_decodeTrialAllBins{col} = dataMatrix;
end
%% Plotting trial decoding vs. position
figure
results=friedman_stats(LECSil_decodeTrialAllBins{1}(:,1:40), LECSil_decodeTrialAllBins{2}(:,1:40), [],{'Saline','CNO'},false);
%save(fullfile(savepath,'TrialDecode_A_LEC_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'TrialDecode_A_LEC_Wilcoxon.xlsx'))
subplot(1,3,1); hold on;
shadedErrorBar(pos,1-nanmean(LECSil_decodeTrialAllBins{1}(:,1:40)),SEM_col_exNan(1-LECSil_decodeTrialAllBins{1}(:,1:40)),'lineProps',{'Color',blue, 'LineWidth',1.5});
shadedErrorBar(pos,1-nanmean(LECSil_decodeTrialAllBins{2}(:,1:40)),SEM_col_exNan(1-LECSil_decodeTrialAllBins{2}(:,1:40)),'lineProps',{'Color',blue + 0.50 * (1 - blue), 'LineWidth',1.5,'LineStyle','--'});
xlabel('Position (cm)'); ylabel('Trial Identification Error'); ylim([0 0.5]);
xline(pos(12),'--','Color',magenta,'LineWidth',1.5)
xline(pos(28),'--','Color',blue,'LineWidth',1.5)
plotSignificanceBars(gca,pos,results)

results=friedman_stats(LECSil_decodeTrialAllBins{1}(:,41:end), LECSil_decodeTrialAllBins{2}(:,41:end), [],{'Saline','CNO'},false);
%save(fullfile(savepath,'TrialDecode_B_LEC_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, fullfile(savepath,'TrialDecode_B_LEC_Wilcoxon.xlsx'))
subplot(1,3,2); hold on;
shadedErrorBar(pos,1-nanmean(LECSil_decodeTrialAllBins{1}(:,41:end)),SEM_col_exNan(1-LECSil_decodeTrialAllBins{1}(:,41:end)),'lineProps',{'Color',magenta, 'LineWidth',1.5});
shadedErrorBar(pos,1-nanmean(LECSil_decodeTrialAllBins{2}(:,41:end)),SEM_col_exNan(1-LECSil_decodeTrialAllBins{2}(:,41:end)),'lineProps',{'Color',magenta + 0.50 * (1 - magenta), 'LineWidth',1.5,'LineStyle','--'});
xlabel('Position (cm)'); ylabel('Trial Identification Error'); ylim([0 0.5]);
xline(pos(12),'--','Color',magenta,'LineWidth',1.5)
xline(pos(28),'--','Color',blue,'LineWidth',1.5)
plotSignificanceBars(gca,pos,results)

subplot(1,3,3); hold on;
%Parameters
xTickVals = [1:6];
xTickLabels = {[],[],'A-Saline','A-CNO','B-Saline','B-CNO'};
xLimits = [2 7];

errorbar(3,1-mean(TrialErrorMatrix_LEC(:,3)),SEM_col(1-TrialErrorMatrix_LEC(:,3)),'LineWidth',2,'Color', blue);
scatter(3,1-mean(TrialErrorMatrix_LEC(:,3)),'s','filled','MarkerFaceColor', blue)
errorbar(4,1-mean(TrialErrorMatrix_LEC(:,4)),SEM_col(1-TrialErrorMatrix_LEC(:,4)),'LineWidth',2,'Color', blue + 0.50 * (1 - blue));
scatter(4,1-mean(TrialErrorMatrix_LEC(:,4)),'s','filled','MarkerFaceColor', blue + 0.50 * (1 - blue))

errorbar(5,1-mean(TrialErrorMatrix_LEC(:,5)),SEM_col(1-TrialErrorMatrix_LEC(:,5)),'LineWidth',2,'Color', magenta);
scatter(5,1-mean(TrialErrorMatrix_LEC(:,5)),'s','filled','MarkerFaceColor', magenta)
errorbar(6,1-mean(TrialErrorMatrix_LEC(:,6)),SEM_col(1-TrialErrorMatrix_LEC(:,6)),'LineWidth',2,'Color', magenta + 0.50 * (1 - magenta));
scatter(6,1-mean(TrialErrorMatrix_LEC(:,6)),'s','filled','MarkerFaceColor', magenta + 0.50 * (1 - magenta))

for i=1:size(TrialErrorMatrix_LEC,1)
    plot(xTickVals(3:4),1-TrialErrorMatrix_LEC(i,3:4),'Color',[0.5 0.5 0.5],'HandleVisibility', 'off')
end

for i=1:size(TrialErrorMatrix_LEC,1)
    plot(xTickVals(5:6),1-TrialErrorMatrix_LEC(i,5:6),'Color',[0.5 0.5 0.5],'HandleVisibility', 'off')
end

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0 0.6]); ylabel('Identification Error')


set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')

%exportgraphics(gcf, 'Fig6_TrialDecode_allBin.pdf', 'ContentType', 'vector','Resolution',300);

%Export position decoding for stats
% writematrix([1-LECSil_decodeTrialAllBins{1}(:,1:40)', 1-LECSil_decodeTrialAllBins{2}(:,1:40)'], fullfile(savepath,'A_trialDecode_allSB_LEC.csv'));
% writematrix([1-LECSil_decodeTrialAllBins{1}(:,41:end)',1-LECSil_decodeTrialAllBins{2}(:,41:end)'], fullfile(savepath,'B_trialDecode_allSB_LEC.csv'));
% writematrix([1-TrialErrorMatrix_LEC(:,3), 1-TrialErrorMatrix_LEC(:,4)] , fullfile(savepath,'A_trialDecode_LEC.csv'))
% writematrix([1-TrialErrorMatrix_LEC(:,5), 1-TrialErrorMatrix_LEC(:,6)] , fullfile(savepath,'B_trialDecode_LEC.csv'))
%% Plotting all control vs. silencing confusion maps/decoding plots
baseDir = 'R:\basulabspace\MH\Decoding_LECSilence';
mouseFolders = dir(fullfile(baseDir, 'MH*'));
mouseNames = {};

% Filter out folders missing '1' subfolders or the required .mat files
for i = 1:length(mouseFolders)
    mousePath = fullfile(baseDir, mouseFolders(i).name);
    path1 = fullfile(mousePath, '1', 'matched_transients_all_ses.mat');
    if exist(path1, 'file') 
        mouseNames{end+1} = mouseFolders(i).name; 
    else
        fprintf('Skipping %s (missing 1.mat)\n', mouseFolders(i).name);
    end
end


for iMouse = 2 %1:length(mouseNames) 
    mouse = mouseNames{iMouse};

    % Folder '1' 
    dataPath1 = fullfile(baseDir, mouse, '1', 'matched_transients_all_ses.mat');
    if exist(dataPath1, 'file')
        load(dataPath1, 'matching_ROI_bin_transient_lap_data');
        these = matching_ROI_bin_transient_lap_data;
        % Adjust session range based on mouse name
        if strcmp(mouse, 'MH115')
            sessionRange = 1:2;
        else
            sessionRange = 2:3;
        end
        for i_ses = sessionRange;
            this = these{i_ses};
            N_BINS = 40;
            edgesPosition = linspace(0,1,N_BINS+1);
            centersPosition = center(edgesPosition);
            edgesSpeed = linspace(-5,30,N_BINS+1);
            centersSpeed = center(edgesSpeed);
            
            SM = 1;
            DT = nanmedian(diff(this.time));
            N_CELLS = size(this.transient_mat,1);
        
        
            cumulativeDistance = unwrap(this.position_norm*2*pi)/(2*pi);
            midDistance = cumulativeDistance(jzeroCrossing(cumulativeDistance-cumulativeDistance(end)/2));
        
            HALF = 1;
            if(HALF==1)
                valid1 = cumulativeDistance<midDistance;    
                valid2 = cumulativeDistance>=midDistance;    
            elseif(HALF==2)
                valid1 = cumulativeDistance>=midDistance;
                valid2 = cumulativeDistance<midDistance;    
            else
                valid1 = true(size(cumulativeDistance));
                valid2 = true(size(cumulativeDistance));
            end
        
            occA = DT*histcn(this.position_norm(this.run_state==1 & this.trialType==2 & valid1),edgesPosition);
            occA = jmm_smooth_1d_cor_circ(occA,SM);
            occA = occA(1:N_BINS);
        
            occB = DT*histcn(this.position_norm(this.run_state==1 & this.trialType==3 & valid1),edgesPosition);
            occB = jmm_smooth_1d_cor_circ(occB,SM);
            occB = occB(1:N_BINS);
        
            occA_speed = DT*histcn(this.speed(this.run_state==1 & this.trialType==2 & valid1),edgesSpeed);
            occA_speed = jmm_smooth_1d_cor_circ(occA_speed,SM);
            occA_speed = occA_speed(1:N_BINS);
        
            occB_speed = DT*histcn(this.speed(this.run_state==1 & this.trialType==3 & valid1),edgesSpeed);
            occB_speed = jmm_smooth_1d_cor_circ(occB_speed,SM);
            occB_speed = occB_speed(1:N_BINS);
            
            timeBin = 0.25;
            SM2 = ceil(timeBin/DT);
        
            timeEdges = this.time(1):timeBin:this.time(end)+timeBin;
            timeCenters = center(timeEdges);
            coarseRate = NaN(N_CELLS,length(timeEdges)-1);
            eventsA = NaN(N_CELLS,N_BINS);
            eventsB = NaN(N_CELLS,N_BINS);
            eventsA_speed = NaN(N_CELLS,N_BINS);
            eventsB_speed = NaN(N_CELLS,N_BINS);
            for i_cell = 1:N_CELLS
                eventBinaryAll = (this.transient_mat(i_cell,:).*(this.run_state==1 & valid2)'==1);
                eventBinaryA = (this.transient_mat(i_cell,:).*(this.run_state==1 & this.trialType==2 & valid1)'==1);
                eventBinaryB = (this.transient_mat(i_cell,:).*(this.run_state==1 & this.trialType==3 & valid1)'==1);
        
                eventPosA = this.position_norm(eventBinaryA);
                eventPosB = this.position_norm(eventBinaryB);
        
                eventSpeedA = this.speed(eventBinaryA);
                eventSpeedB = this.speed(eventBinaryB);
                
                eventA = histcn(eventPosA,edgesPosition);
                eventA = jmm_smooth_1d_cor_circ(eventA,SM);
                eventA = eventA(1:N_BINS);
                eventsA(i_cell,:) = eventA;
        
                eventB = histcn(eventPosB,edgesPosition);
                eventB = jmm_smooth_1d_cor_circ(eventB,SM);
                eventB = eventB(1:N_BINS);
                eventsB(i_cell,:) = eventB;
        
                eventA_speed = histcn(eventSpeedA,edgesSpeed);
                eventA_speed = jmm_smooth_1d_cor(eventA_speed,SM);
                eventA_speed = eventA_speed(1:N_BINS);
                eventsA_speed(i_cell,:) = eventA_speed;
        
                eventB_speed = histcn(eventSpeedB,edgesSpeed);
                eventB_speed = jmm_smooth_1d_cor(eventB_speed,SM);
                eventB_speed = eventB_speed(1:N_BINS);
                eventsB_speed(i_cell,:) = eventB_speed;
                
                smoothedEventRate = jmm_smooth_1d_cor(eventBinaryAll, 2*SM2)/timeBin;
                coarseRate(i_cell,:) = interp1(this.time,smoothedEventRate,timeCenters);
            end
        
            rateA = bsxfun(@rdivide, eventsA, occA);
            rateB = bsxfun(@rdivide, eventsB, occB);
            rateTogether = [rateA rateB];
            
            rateA_speed = bsxfun(@rdivide, eventsA_speed, occA_speed);
            rateB_speed = bsxfun(@rdivide, eventsB_speed, occB_speed);
            rateTogether_speed = [rateA_speed rateB_speed];
            %
            goodCells = nansum(rateTogether,2)>0;
            selectRateTogether = rateTogether(goodCells,:);
            selectRateTogether_speed = rateTogether_speed(goodCells,:);
            selectCoarseRate = coarseRate(goodCells,:);
            N_selectCells = sum(goodCells);
        
            instCorr = (zscore(selectRateTogether)'*zscore(selectCoarseRate))/(N_selectCells-1);
            instCorr_speed = (zscore(selectRateTogether_speed)'*zscore(selectCoarseRate))/(N_selectCells-1);
            [~, maxBin] = max(instCorr);
            [~, maxBin_speed] = max(instCorr_speed);
            
            confidence = max(instCorr) - quantile(instCorr,0.85);
            confidence_speed = max(instCorr_speed) - quantile(instCorr_speed,0.85);
            centersPosition2 = [centersPosition centersPosition+1];
            centersSpeed2 = [centersSpeed centersSpeed+35];
            predPos = centersPosition2(maxBin);
            predPos(confidence==0) = NaN;
            predSpeed = centersSpeed2(maxBin_speed);
            predSpeed(confidence_speed==0) = NaN;
            
            downsampledPosition = interp1(this.time, this.position_norm, timeCenters,'nearest');
            downsampledSpeed = interp1(this.time, this.speed, timeCenters,'nearest');
            downsampledRunState = interp1(this.time, 1*(this.run_state==1 & this.trialType>0), timeCenters,'nearest');
            downsampledPosition(downsampledRunState==0) = NaN;
            downsampledSpeed(downsampledRunState==0) = NaN;
            downsampledTrialType = interp1(this.time, this.trialType, timeCenters,'nearest');
            downsampledTrialType(downsampledRunState==0) = NaN;
        
            pp2 = predPos(downsampledRunState==1)*200;
            ps2 = predSpeed(downsampledRunState==1);
            ic2 = instCorr(:,downsampledRunState==1);
            ics2 = instCorr_speed(:,downsampledRunState==1);
            cf2 = confidence(downsampledRunState==1);
            cfs2 = confidence_speed(downsampledRunState==1);
            tt2 = downsampledTrialType(downsampledRunState==1);
            dp2 = (downsampledPosition(downsampledRunState==1) + (tt2-2))*200;
            ds2 = (downsampledSpeed(downsampledRunState==1) + (tt2-2)*35);
            t2 = timeBin*(1:length(pp2));
        
        figure(13);
        if strcmp(mouse, 'MH115')
             subplot(2,length(mouseNames),(i_ses+1 - 2) * length(mouseNames) + iMouse);
        else
            subplot(2,1,i_ses - 1);
            %subplot(2,length(mouseNames),(i_ses - 2) * length(mouseNames) + iMouse);
        end
        pp_indice = ~isnan(pp2); %indexes of predicted positions in second half
        pred_time_scaled = t2(pp_indice); %indexes of time during decoding
        pp2_secondhalf = pp2(pp_indice);
        idx_gt_200 = pp2(pp_indice) > 200; 
        idx_le_200 = pp2(pp_indice) <= 200;

        plot(pred_time_scaled-pred_time_scaled(1), dp2(pp_indice), '.','Color',[0.5 0.5 0.5]);
        hold on;
        if i_ses==sessionRange(1)
            plot(pred_time_scaled(idx_le_200)- pred_time_scaled(1), pp2_secondhalf(idx_le_200), '.','Color',blue);
            plot(pred_time_scaled(idx_gt_200)- pred_time_scaled(1), pp2_secondhalf(idx_gt_200), '.','Color',magenta);
            legend('Actual','Decoded A','Decoded B','Orientation','Horizontal','Location','northoutside');
        else
            plot(pred_time_scaled(idx_le_200)- pred_time_scaled(1), pp2_secondhalf(idx_le_200), '.','Color',blue + 0.50 * (1 - blue));
            plot(pred_time_scaled(idx_gt_200)- pred_time_scaled(1), pp2_secondhalf(idx_gt_200), '.','Color',magenta + 0.50 * (1 - magenta));
            legend('Actual','Decoded A','Decoded B','Orientation','Horizontal','Location','northoutside');
        end
        xlabel('Running Time (s)');
        ylabel('Position (cm)');
        axis tight;
        plot(xlim,200*[1 1],'k','HandleVisibility','off');
        set(gca,'ytick',50:50:400);
        set(gca,'yticklabel',{'50','100','150','200','50','100','150','200'});
        %title(sprintf('Mouse: %s  Session: %d', mouse, i_ses));
        set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
        set(gcf, 'Renderer', 'painters')
        
        figure(14);
        purple= [128, 0, 128] / 255;
        if strcmp(mouse, 'MH115')
            subplot(2,length(mouseNames),(i_ses+1 - 2) * length(mouseNames) + iMouse);
        else
            subplot(2,1,i_ses-1);
            %subplot(2,length(mouseNames),(i_ses - 2) * length(mouseNames) + iMouse);
        end
        b2 = linspace(0,400,2*N_BINS/2+1);
        b2 = [0 200 400.5];
        [N,~,~,L] = histcn([dp2(:) pp2(:)],b2,b2);        
        N = N';
        L(L==0) = NaN;
        N = bsxfun(@rdivide, N, sum(N));
        imagesc(center(b2),center(b2),(N));
        custom_colormap = gray(64);
        custom_colormap = custom_colormap(round(end/2):end, :);
        colormap(custom_colormap);
        set(gca,'ydir','normal');
        axis square;
        xlabel('Actual Position (cm)');
        ylabel('Decoded Position (cm)');
        set(gca,'xtick',100:100:400);
        set(gca,'xticklabel',{'100','200','100','200'});
        set(gca,'ytick',100:100:400);
        set(gca,'yticklabel',{'100','200','100','200'});
        hold on;
        plot(xlim,200*[1 1],'w');
        plot(200*[1 1],ylim,'w');
        caxis([0 1]);
        p = get(gca,'position');        
        colorbar;
        set(gca,'position',p+[-0.02 0 0 0]);
        if i_ses==sessionRange(1)
            plot(dp2+randn(size(dp2)),pp2+randn(size(dp2)),'o','Color','k','Markersize',3);
        else
            plot(dp2+randn(size(dp2)),pp2+randn(size(dp2)),'d','Color','k','Markersize',3);
        end
        
        AA = sum(dp2<200 & pp2<200);
        AB = sum(dp2<200 & pp2>=200);
        BA = sum(dp2>=200 & pp2<200);
        BB = sum(dp2>=200 & pp2>=200);
    
        F1_1 = 2*AA/(2*AA+AB+BA);
        F1_2 = 2*BB/(2*BB+AB+BA);
        F1_3 = (F1_1+F1_2)/2;
        F1_4 = (AA+BB)/(AA+AB+BA+BB);
        correctIncorrect = this.lap_data.performance.trialCorrect;
        perf = sum(correctIncorrect==1)/sum(correctIncorrect>=0);
        %title(sprintf('Session: %d\nPerf: %.02f', i_ses, perf));
        set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
        set(gcf, 'Renderer', 'painters')
        end
    else
    end
end

%% Plotting decoded position maps and scatter plots for a, b, and rf using only one trial type

%Not downsampled
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\2\matched_transients_all_ses.mat",1,2,1,blue)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\2\matched_transients_all_ses.mat",1,3,1,magenta)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\1\matched_transients_all_ses.mat",2,3,0,yellow)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');

%downsampled by ROIs
RF_match=load("R:\basulabspace\MH\Decoding\MH113\1\matched_transients_all_ses.mat");
RF_roiNum=size(RF_match.matching_ROI_bin_transient_lap_data{1,1}.transient_mat,1);
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\2\matched_transients_all_ses.mat",1,2,1,blue,RF_roiNum)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\2\matched_transients_all_ses.mat",1,3,1,magenta,RF_roiNum)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');
run_PosDecoding_vis("R:\basulabspace\MH\Decoding\MH113\1\matched_transients_all_ses.mat",2,3,0,yellow)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12,'FontName','Arial');

