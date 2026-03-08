% COLORS
magenta = [0.8 0 0.6];
blue = [0 0.4 1];
purple= (magenta + blue) / 2;
magenta_light = magenta + 0.50 * (1 - magenta);
blue_light = blue + 0.50 * (1 - blue);
purple_light= purple + 0.50 * (1 - purple);
%% Tuning curves example from MH127 
OCG_tuning = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\filtered_match_ROI\19_Jun_2024_filtered_match_ROIs.mat');
OCG_sal=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_03_Random_Saline-001_6\output\10_Jun_2024_ca_analysis.mat','Place_cell')
OCG_cno=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_04_Random_CNO-001_7\output\10_Jun_2024_ca_analysis.mat','Place_cell')
%% OCGOL A Lap Maps
% Number of ROIs
idx=~isnan(OCG_tuning.ROI_assign_multi_filtered(:,2)) & ~isnan(OCG_tuning.ROI_assign_multi_filtered(:,3));
roi_indices=find(idx)
OCG_tuning.ROI_assign_multi_filtered=OCG_tuning.ROI_assign_multi_filtered(roi_indices,2:3)
nROIs = size(OCG_tuning.ROI_assign_multi_filtered,1);

% Define chunk size (20 ROIs per figure)
chunkSize = 20;

% Loop over ROIs in chunks
for startIdx = 1:chunkSize:nROIs
    endIdx = min(startIdx + chunkSize - 1, nROIs); % make sure we don't exceed bounds
    numThisChunk = endIdx - startIdx + 1;

    figure;

    % First row: session 1
    for i = 1:numThisChunk
        ROI = OCG_tuning.ROI_assign_multi_filtered(startIdx + i - 1, 1);
        subplot(2, chunkSize, i); % row 1
        imagesc(OCG_sal.Place_cell{1,4}.dF_lap_map_ROI{ROI});
        caxis([0 2]);
        title(['ROI ' num2str(ROI)]);
    end

    % Second row: session 2
    for i = 1:numThisChunk
        ROI = OCG_tuning.ROI_assign_multi_filtered(startIdx + i - 1, 2);
        subplot(2, chunkSize, i + chunkSize); % row 2
        imagesc(OCG_cno.Place_cell{1,4}.dF_lap_map_ROI{ROI});
        caxis([0 2]);
        title(['ROI ' num2str(ROI)]);
    end
end
%% OCGOL B Lap Maps
% Number of ROIs
nROIs = size(OCG_tuning.ROI_assign_multi_filtered,1);

% Define chunk size (20 ROIs per figure)
chunkSize = 20;

% Loop over ROIs in chunks
for startIdx = 1:chunkSize:nROIs
    endIdx = min(startIdx + chunkSize - 1, nROIs); % make sure we don't exceed bounds
    numThisChunk = endIdx - startIdx + 1;

    figure;

    % First row: session 1
    for i = 1:numThisChunk
        ROI = OCG_tuning.ROI_assign_multi_filtered(startIdx + i - 1, 1);
        subplot(2, chunkSize, i); % row 1
        imagesc(OCG_sal.Place_cell{1,5}.dF_lap_map_ROI{ROI});
        caxis([0 2]);
        title(['ROI ' num2str(ROI)]);
    end

    % Second row: session 2
    for i = 1:numThisChunk
        ROI = OCG_tuning.ROI_assign_multi_filtered(startIdx + i - 1, 2);
        subplot(2, chunkSize, i + chunkSize); % row 2
        imagesc(OCG_cno.Place_cell{1,5}.dF_lap_map_ROI{ROI});
        caxis([0 2]);
        title(['ROI ' num2str(ROI)]);
    end
end

%%
figure;

roi_1= 213;
roi_2= 303;
% Subplot 1: A-Sal
subplot(2,2,1);
imagesc(OCG_sal.Place_cell{1,4}.dF_lap_map_ROI{roi_1});
caxis([0 2]);
hold on;
yyaxis right;
curve = OCG_sal.Place_cell{1,4}.Spatial_Info.mean_dF_map_smooth{1,8}(:,roi_1);
plot(normalize(curve, 'range'), 'r', 'LineWidth', 2.5,'Color',blue);
ylim([0 1]);
xticks([1 50 100]);
xticklabels({'0', '100', '200'});
ax = gca;
ax.YColor = 'none';     
ax.YTick = [];
ax.YLabel.String = '';
yyaxis left;
ylabel('Lap'); title('A Saline')

% Subplot 2: A-CNO
subplot(2,2,3);
imagesc(OCG_cno.Place_cell{1,4}.dF_lap_map_ROI{roi_2});
caxis([0 2]);
hold on;
yyaxis right;
curve = OCG_cno.Place_cell{1,4}.Spatial_Info.mean_dF_map_smooth{1,8}(:,roi_2);
plot(normalize(curve, 'range'), 'r', 'LineWidth', 2.5,'Color',blue_light);
ylim([0 1]);
xticks([1 50 100]);
xticklabels({'0', '100', '200'});
xlabel('Position')
ax = gca;
ax.YColor = 'none';     
ax.YTick = [];
ax.YLabel.String = '';
yyaxis left; title('A CNO')

roi_1= 180;
roi_2= 142;

% Subplot 3: B-Sal
subplot(2,2,2);
imagesc(OCG_sal.Place_cell{1,5}.dF_lap_map_ROI{roi_1});
caxis([0 2]);
hold on;
yyaxis right;
curve = OCG_sal.Place_cell{1,5}.Spatial_Info.mean_dF_map_smooth{1,8}(:,roi_1);
plot(normalize(curve, 'range'), 'r', 'LineWidth', 2.5,'Color',magenta);
ylim([0 1]);
xticks([1 50 100]);
xticklabels({'0', '100', '200'});
ax = gca;
ax.YColor = 'none';     
ax.YTick = [];
ax.YLabel.String = '';
yyaxis left;
ylabel('Lap'); title('B Saline')

% Subplot 4: B-CNO
subplot(2,2,4);
imagesc(OCG_cno.Place_cell{1,5}.dF_lap_map_ROI{roi_2});
caxis([0 2]);
hold on;
yyaxis right;
curve = OCG_cno.Place_cell{1,5}.Spatial_Info.mean_dF_map_smooth{1,8}(:,roi_2);
plot(normalize(curve, 'range'), 'r', 'LineWidth', 2.5,'Color',magenta_light);
ylim([0 1]);
xticks([1 50 100]);
xticklabels({'0', '100', '200'});
ax = gca;
ax.YColor = 'none';     
ax.YTick = [];
ax.YLabel.String = '';
yyaxis left; title('B CNO')

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
exportgraphics(gcf, 'TuningCurves.pdf', 'ContentType', 'vector', 'Resolution', 300);

%% Saline/CNO directories (all mice are matched) - exceptions for crossupdate if missing first saline session
Saline_OCGOL_ca_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_29_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_26_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_27_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_10_Random_Saline-001_1\output\28_Nov_2023_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_04_Random_Saline-001_4\output\18_Jun_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_04_Random-001_3\output\11_Jun_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_03_Random_Saline-001_6\output\10_Jun_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_07_Random_Saline-001_5\output\19_Jun_2024_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\MH131_2024_10_30_Random_Saline-001_6\output\14_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\MH132_2024_10_30_Random_Saline-001_5\output\30_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\MH137_2024_10_30_Saline-001_6\output\25_Jan_2025_ca_analysis.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\MH138_2024_10_30_Saline-001_6\output\17_Jan_2025_ca_analysis.mat'};

CNO_OCGOL_ca_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_30_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_27_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_28_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_11_Random_CNO-001_2\output\29_Nov_2023_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_05_Random_CNO-001_5\output\18_Jun_2024_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_05_Random_CNO-001_4\output\11_Jun_2024_ca_analysis.mat',... 
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_04_Random_CNO-001_7\output\10_Jun_2024_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_08_Random_CNO-001_6\output\19_Jun_2024_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\MH131_2024_10_31_CNO-001_3\output\30_Jan_2025_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\MH132_2024_10_31_CNO-001_6\output\15_Jan_2025_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\MH137_2024_10_31_Random_CNO-001_7\output\25_Jan_2025_ca_analysis.mat',...
     'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\MH138_2024_10_31_Random_CNO-001_7\output\17_Jan_2025_ca_analysis.mat'};

crossUpdate_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\crossSession_update',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\crossSession_update'};

%Centroid files
OCGOL_centroid_files= cell(size(crossUpdate_files)); 
for i = 1:length(crossUpdate_files)
    OCGOL_centroid_files{i} = fullfile(crossUpdate_files{i}, 'cent_diff.mat');
end

%Recurrence files
OCGOL_recurr_files= cell(size(crossUpdate_files));  
for i = 1:length(crossUpdate_files)
    OCGOL_recurr_files{i} = fullfile(crossUpdate_files{i}, 'recurrence.mat');
end

%Place field width files
OCGOL_pfwidth_files= cell(size(crossUpdate_files)); 
for i = 1:length(crossUpdate_files)
    OCGOL_pfwidth_files{i} = fullfile(crossUpdate_files{i}, 'placeField_dist.mat');
end

%Tuned subclasses (A sel, B sel, AB)
OCGOL_classType_files= cell(size(crossUpdate_files)); 
for i = 1:length(crossUpdate_files)
    OCGOL_classType_files{i} = fullfile(crossUpdate_files{i}, 'tuned_logicals.mat');
end

extractMouseID = @(fp) regexp(fp, 'MH\d{3}', 'match', 'once');
OCGOL_mice_cross = cellfun(extractMouseID, crossUpdate_files, 'UniformOutput', false);
savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\4'; % Path to save directory
%% Calculations with calcium dynamic data
% Parameters
sampleTime = 4 * 30;  % 4 seconds at 30 Hz

Sal_OCGOL_A= processCaDynamics(OCGOL_mice_cross,Saline_OCGOL_ca_files,4,sampleTime);
Sal_OCGOL_B= processCaDynamics(OCGOL_mice_cross,Saline_OCGOL_ca_files,5,sampleTime);
CNO_OCGOL_A= processCaDynamics(OCGOL_mice_cross,CNO_OCGOL_ca_files,4,sampleTime);
CNO_OCGOL_B= processCaDynamics(OCGOL_mice_cross,CNO_OCGOL_ca_files,5,sampleTime);

%% Plot average calcium traces for OCGOL A and B (Saline and CNO)
err_A_sal = SEM_col_exNan(Sal_OCGOL_A.CaDynamic.avgMouse_eventTrace);
err_A_CNO = SEM_col_exNan(CNO_OCGOL_A.CaDynamic.avgMouse_eventTrace);
err_B_sal = SEM_col_exNan(Sal_OCGOL_B.CaDynamic.avgMouse_eventTrace);
err_B_CNO= SEM_col_exNan(CNO_OCGOL_B.CaDynamic.avgMouse_eventTrace);

a = (1:sampleTime)/30;

figure;
t = tiledlayout(1, 5, 'TileSpacing', 'compact', 'Padding', 'compact'); % Control layout tightly

% === Avg Event Trace ===
nexttile(1);
hold on;
shadedErrorBar(a, mean(Sal_OCGOL_A.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_A_sal(1:length(a)), ...
    'lineProps', {'Color', blue, 'LineWidth', 1.5});
shadedErrorBar(a, mean(CNO_OCGOL_A.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_A_CNO(1:length(a)), ...
    'lineProps', {'Color', blue_light, 'LineWidth', 1.5,'LineStyle','--'});
hold off;
xlabel('Time (s)'); ylabel('df/f'); ylim([0.1 0.65])
% Add legend outside the tiled layout
lg = legend({'A-Saline','B-Saline'}, 'Location', 'northwest');
lg.Layout.Tile = 'west';  


nexttile(2);
hold on;
shadedErrorBar(a, mean(Sal_OCGOL_B.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_B_sal(1:length(a)), ...
    'lineProps', {'Color', magenta, 'LineWidth', 1.5});
shadedErrorBar(a, mean(CNO_OCGOL_B.CaDynamic.avgMouse_eventTrace(:,1:length(a)), 1, 'omitnan'), err_B_CNO(1:length(a)), ...
    'lineProps', {'Color', magenta_light, 'LineWidth', 1.5,'LineStyle','--'});
hold off;
xlabel('Time (s)'); ylabel('df/f'); ylim([0.1 0.65])
% Add legend outside the tiled layout
lg = legend({'B-Saline','B-CNO'}, 'Location', 'northwest');
lg.Layout.Tile = 'west';  

% === Shared axis settings ===
xTickVals = [1 2 3 4];
xTickLabels = {'A-Saline','A-CNO','B-Saline','B-CNO'};
xLimits = [0 5];

% === AUC ===
nexttile(3);
hold on;
for i = 1:length(crossUpdate_files)
    plot(xTickVals, [Sal_OCGOL_A.CaDynamic.eventAUC_mean(i), CNO_OCGOL_A.CaDynamic.eventAUC_mean(i), Sal_OCGOL_B.CaDynamic.eventAUC_mean(i),...
        CNO_OCGOL_B.CaDynamic.eventAUC_mean(i)],'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(Sal_OCGOL_A.CaDynamic.eventAUC_mean), SEM_col(Sal_OCGOL_A.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', blue);
errorbar(2, mean(CNO_OCGOL_A.CaDynamic.eventAUC_mean), SEM_col(CNO_OCGOL_A.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', blue_light);
errorbar(3, mean(Sal_OCGOL_B.CaDynamic.eventAUC_mean), SEM_col(Sal_OCGOL_B.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', magenta);
errorbar(4, mean(CNO_OCGOL_B.CaDynamic.eventAUC_mean), SEM_col(CNO_OCGOL_B.CaDynamic.eventAUC_mean), 'LineWidth', 2, 'Color', magenta_light);

scatter(1, mean(Sal_OCGOL_A.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(CNO_OCGOL_A.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(Sal_OCGOL_B.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(CNO_OCGOL_B.CaDynamic.eventAUC_mean), 's', 'filled', 'MarkerFaceColor', magenta_light)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([0.5 1.8]); ylabel('AUC');

% === Amplitude ===
nexttile(4);
hold on;
for i = 1:length(crossUpdate_files)
    plot(xTickVals, [Sal_OCGOL_A.CaDynamic.amp_mean(i), CNO_OCGOL_A.CaDynamic.amp_mean(i), Sal_OCGOL_B.CaDynamic.amp_mean(i),...
        CNO_OCGOL_B.CaDynamic.amp_mean(i)],'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(Sal_OCGOL_A.CaDynamic.amp_mean), SEM_col(Sal_OCGOL_A.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', blue);
errorbar(2, mean(CNO_OCGOL_A.CaDynamic.amp_mean), SEM_col(CNO_OCGOL_A.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', blue_light);
errorbar(3, mean(Sal_OCGOL_B.CaDynamic.amp_mean), SEM_col(Sal_OCGOL_B.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', magenta);
errorbar(4, mean(CNO_OCGOL_B.CaDynamic.amp_mean), SEM_col(CNO_OCGOL_B.CaDynamic.amp_mean), 'LineWidth', 2, 'Color', magenta_light);

scatter(1, mean(Sal_OCGOL_A.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(CNO_OCGOL_A.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(Sal_OCGOL_B.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(CNO_OCGOL_B.CaDynamic.amp_mean), 's', 'filled', 'MarkerFaceColor', magenta_light)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Amplitude');

% === Duration ===
nexttile(5);
hold on
for i = 1:length(crossUpdate_files)
    plot(xTickVals, [Sal_OCGOL_A.CaDynamic.dur_mean(i), CNO_OCGOL_A.CaDynamic.dur_mean(i), Sal_OCGOL_B.CaDynamic.dur_mean(i),...
        CNO_OCGOL_B.CaDynamic.dur_mean(i)],'Color', [0.5 0.5 0.5]);
end
errorbar(1, mean(Sal_OCGOL_A.CaDynamic.dur_mean), SEM_col(Sal_OCGOL_A.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', blue);
errorbar(2, mean(CNO_OCGOL_A.CaDynamic.dur_mean), SEM_col(CNO_OCGOL_A.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', blue_light);
errorbar(3, mean(Sal_OCGOL_B.CaDynamic.dur_mean), SEM_col(Sal_OCGOL_B.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', magenta);
errorbar(4, mean(CNO_OCGOL_B.CaDynamic.dur_mean), SEM_col(CNO_OCGOL_B.CaDynamic.dur_mean), 'LineWidth', 2, 'Color', magenta_light);

scatter(1, mean(Sal_OCGOL_A.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(CNO_OCGOL_A.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(Sal_OCGOL_B.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(CNO_OCGOL_B.CaDynamic.dur_mean), 's', 'filled', 'MarkerFaceColor', magenta_light)
xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylabel('Duration (s)');

% === General Settings ===
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');

%% Plotting event rate for silencing
figure;
subplot(1,2,1);hold on
for i=1:length(crossUpdate_files)
    plot(xTickVals(1:2),[Sal_OCGOL_A.CaDynamic.event_rate_mean(i), CNO_OCGOL_A.CaDynamic.event_rate_mean(i)],...
    'Color',[0.5 0.5 0.5]);
end

for i=1:length(crossUpdate_files)
    plot(xTickVals(3:4),[Sal_OCGOL_B.CaDynamic.event_rate_mean(i), CNO_OCGOL_B.CaDynamic.event_rate_mean(i)],...
    'Color',[0.5 0.5 0.5]);
end

errorbar(1,mean(Sal_OCGOL_A.CaDynamic.event_rate_mean),SEM_col(Sal_OCGOL_A.CaDynamic.event_rate_mean),'LineWidth',2.5,'Color',blue);
errorbar(2,mean(CNO_OCGOL_A.CaDynamic.event_rate_mean),SEM_col(CNO_OCGOL_A.CaDynamic.event_rate_mean),'LineWidth',2.5,'Color',blue_light);
errorbar(3,mean(Sal_OCGOL_B.CaDynamic.event_rate_mean),SEM_col(Sal_OCGOL_B.CaDynamic.event_rate_mean),'LineWidth',2.5,'Color',magenta);
errorbar(4,mean(CNO_OCGOL_B.CaDynamic.event_rate_mean),SEM_col(CNO_OCGOL_B.CaDynamic.event_rate_mean),'LineWidth',2.5,'Color',magenta_light);

scatter(1, mean(Sal_OCGOL_A.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(CNO_OCGOL_A.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(Sal_OCGOL_B.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(CNO_OCGOL_B.CaDynamic.event_rate_mean), 's', 'filled', 'MarkerFaceColor', magenta_light)

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([1 5]); ylabel('Event/min')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
exportgraphics(gcf, 'EventRate.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export event rate for stats
% writematrix([Sal_OCGOL_A.CaDynamic.event_rate_mean CNO_OCGOL_A.CaDynamic.event_rate_mean] , fullfile(savepath,'A_eventRate.csv'));
% writematrix([Sal_OCGOL_B.CaDynamic.event_rate_mean CNO_OCGOL_B.CaDynamic.event_rate_mean] , fullfile(savepath,'B_eventRate.csv'));
%% Load and process centroid and caanalysis data 

% Compute for OCGOLA -Saline
Sal_OCGOL_A = computeSpatialTuning_sil(OCGOL_mice_cross,Saline_OCGOL_ca_files,OCGOL_centroid_files,4,2);

% Compute for OCGOLA -CNO
CNO_OCGOL_A = computeSpatialTuning_sil(OCGOL_mice_cross,CNO_OCGOL_ca_files,OCGOL_centroid_files,4,3);

% Compute for OCGOLB
Sal_OCGOL_B = computeSpatialTuning_sil(OCGOL_mice_cross,Saline_OCGOL_ca_files,OCGOL_centroid_files,5,2);

% Compute for OCGOLB - CNO
CNO_OCGOL_B = computeSpatialTuning_sil(OCGOL_mice_cross,CNO_OCGOL_ca_files,OCGOL_centroid_files,5,3);

%% Collecting Place field width and count
%TODO add a variable for collecting place field width of all cells for
%later A sel, B sel, AB breakdown
nMice = length(crossUpdate_files);

Sal_OCGOL_A.pfwidth.si=NaN(nMice,1);
Sal_OCGOL_A.pfwidth.siAll=cell(1,nMice);
Sal_OCGOL_B.pfwidth.si=NaN(nMice,1);
Sal_OCGOL_B.pfwidth.siAll=cell(1,nMice);
CNO_OCGOL_A.pfwidth.si=NaN(nMice,1);
CNO_OCGOL_A.pfwidth.siAll=cell(1,nMice);
CNO_OCGOL_B.pfwidth.si=NaN(nMice,1);
CNO_OCGOL_B.pfwidth.siAll=cell(1,nMice);

Sal_OCGOL_A.pfcount.si=NaN(nMice,3);
Sal_OCGOL_B.pfcount.si=NaN(nMice,3);
CNO_OCGOL_A.pfcount.si=NaN(nMice,3);
CNO_OCGOL_B.pfcount.si=NaN(nMice,3);

%For saline day
for mouse=1:nMice
    load(OCGOL_pfwidth_files{mouse})
    if length(placeField_dist.all)<4 %For MH115 exception
        Sal_OCGOL_A.pfwidth.si(mouse)=mean(placeField_dist.all{1, 1}.A.si.width_cm);
        Sal_OCGOL_B.pfwidth.si(mouse)=mean(placeField_dist.all{1, 1}.B.si.width_cm);
        Sal_OCGOL_A.pfcount.si(mouse,:)= placeField_dist.all{1, 1}.A.si.field_count_total; 
        Sal_OCGOL_B.pfcount.si(mouse,:)= placeField_dist.all{1, 1}.B.si.field_count_total; 
        Sal_OCGOL_A.pfwidth.siAll{mouse}=placeField_dist.all{1, 1}.A.si.width_cm;
        Sal_OCGOL_B.pfwidth.siAll{mouse}=placeField_dist.all{1, 1}.B.si.width_cm;
    elseif length(placeField_dist.all)>=4
        Sal_OCGOL_A.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.A.si.width_cm);
        Sal_OCGOL_B.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.B.si.width_cm);
        Sal_OCGOL_A.pfcount.si(mouse,:)= placeField_dist.all{1, 2}.A.si.field_count_total; 
        Sal_OCGOL_B.pfcount.si(mouse,:)= placeField_dist.all{1, 2}.B.si.field_count_total; 
        Sal_OCGOL_A.pfwidth.siAll{mouse}=placeField_dist.all{1, 2}.A.si.width_cm;
        Sal_OCGOL_B.pfwidth.siAll{mouse}=placeField_dist.all{1, 2}.B.si.width_cm;
    end
end

Sal_OCGOL_A.pfcountFrac.si=Sal_OCGOL_A.pfcount.si./sum(Sal_OCGOL_A.pfcount.si,2);
Sal_OCGOL_B.pfcountFrac.si=Sal_OCGOL_B.pfcount.si./sum(Sal_OCGOL_B.pfcount.si,2);

%For CNO day
for mouse=1:nMice
    load(OCGOL_pfwidth_files{mouse})
    if length(placeField_dist.all)<4 %For MH115 exception
        CNO_OCGOL_A.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.A.si.width_cm);
        CNO_OCGOL_B.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.B.si.width_cm);
        CNO_OCGOL_A.pfcount.si(mouse,:)= placeField_dist.all{1, 2}.A.si.field_count_total; 
        CNO_OCGOL_B.pfcount.si(mouse,:)= placeField_dist.all{1, 2}.B.si.field_count_total; 
        CNO_OCGOL_A.pfwidth.siAll{mouse}=placeField_dist.all{1, 2}.A.si.width_cm;
        CNO_OCGOL_B.pfwidth.siAll{mouse}=placeField_dist.all{1, 2}.B.si.width_cm;
    elseif length(placeField_dist.all)>=4
        CNO_OCGOL_A.pfwidth.si(mouse)=mean(placeField_dist.all{1, 3}.A.si.width_cm);
        CNO_OCGOL_B.pfwidth.si(mouse)=mean(placeField_dist.all{1, 3}.B.si.width_cm);
        CNO_OCGOL_A.pfcount.si(mouse,:)= placeField_dist.all{1, 3}.A.si.field_count_total; 
        CNO_OCGOL_B.pfcount.si(mouse,:)= placeField_dist.all{1, 3}.B.si.field_count_total; 
        CNO_OCGOL_A.pfwidth.siAll{mouse}=placeField_dist.all{1, 3}.A.si.width_cm;
        CNO_OCGOL_B.pfwidth.siAll{mouse}=placeField_dist.all{1, 3}.B.si.width_cm;
    end
end

CNO_OCGOL_A.pfcountFrac.si=CNO_OCGOL_A.pfcount.si./sum(CNO_OCGOL_A.pfcount.si,2);
CNO_OCGOL_B.pfcountFrac.si=CNO_OCGOL_B.pfcount.si./sum(CNO_OCGOL_B.pfcount.si,2);
%% Plotting place field width and count
pfwidth_si=[Sal_OCGOL_A.pfwidth.si, CNO_OCGOL_A.pfwidth.si, Sal_OCGOL_B.pfwidth.si, CNO_OCGOL_B.pfwidth.si];
pf_xvals = [1 2 3];
%figure('Renderer', 'painters', 'Position', [10 10 700 600])
figure;
subplot(1,2,1)
hold on
for i=1:size(pfwidth_si,1)
    plot(xTickVals(1:2),pfwidth_si(i,1:2),'Color',[0.5 0.5 0.5])
end
for i=1:size(pfwidth_si,1)
    plot(xTickVals(3:4),pfwidth_si(i,3:4),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(pfwidth_si(:,1)),SEM_col(pfwidth_si(:,1)),'LineWidth',2,'Color',blue);
errorbar(2,mean(pfwidth_si(:,2)),SEM_col(pfwidth_si(:,2)),'LineWidth',2,'Color',blue_light);
errorbar(3,mean(pfwidth_si(:,3)),SEM_col(pfwidth_si(:,3)),'LineWidth',2,'Color',magenta);
errorbar(4,mean(pfwidth_si(:,4)),SEM_col(pfwidth_si(:,4)),'LineWidth',2,'Color',magenta_light);

scatter(1, mean(pfwidth_si(:,1)), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(pfwidth_si(:,2)), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(pfwidth_si(:,3)), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(pfwidth_si(:,4)), 's', 'filled', 'MarkerFaceColor', magenta_light)

xticks(xTickVals); xticklabels(xTickLabels); xtickangle(45); xlim(xLimits)
ylim([20 50])
ylabel('PF Width (cm)')

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'PFWidth.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export pf width for stats
% writematrix([pfwidth_si(:,1) pfwidth_si(:,2)] , fullfile(savepath,'A_pfwidth.csv'));
% writematrix([pfwidth_si(:,3) pfwidth_si(:,4)] , fullfile(savepath,'B_pfwdith.csv'));

% subplot(1,3,2)
% hold on
% shadedErrorBar(pf_xvals,mean(Sal_OCGOL_A.pfcount.si),SEM_col(Sal_OCGOL_A.pfcount.si),'lineProps',{'Color', blue, 'LineWidth', 1.5});
% shadedErrorBar(pf_xvals,mean(CNO_OCGOL_A.pfcount.si),SEM_col(CNO_OCGOL_A.pfcount.si),'lineProps',{'Color', blue_light, 'LineWidth', 1.5,'LineStyle','--'});
% shadedErrorBar(pf_xvals,mean(Sal_OCGOL_B.pfcount.si),SEM_col(Sal_OCGOL_B.pfcount.si),'lineProps',{'Color', magenta, 'LineWidth', 1.5});
% shadedErrorBar(pf_xvals,mean(CNO_OCGOL_B.pfcount.si),SEM_col(CNO_OCGOL_B.pfcount.si),'lineProps',{'Color', magenta_light, 'LineWidth', 1.5,'LineStyle','--'});
% xticks(pf_xvals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
% title('Place Field (SI)')
% 
% subplot(1,3,3)
% hold on
% shadedErrorBar(pf_xvals,mean(Sal_OCGOL_A.pfcountFrac.si),SEM_col(Sal_OCGOL_A.pfcountFrac.si),'lineProps',{'Color', blue, 'LineWidth', 1.5});
% shadedErrorBar(pf_xvals,mean(CNO_OCGOL_A.pfcountFrac.si),SEM_col(CNO_OCGOL_A.pfcountFrac.si),'lineProps',{'Color', blue_light, 'LineWidth', 1.5,'LineStyle','--'});
% shadedErrorBar(pf_xvals,mean(Sal_OCGOL_B.pfcountFrac.si),SEM_col(Sal_OCGOL_B.pfcountFrac.si),'lineProps',{'Color', magenta, 'LineWidth', 1.5});
% shadedErrorBar(pf_xvals,mean(CNO_OCGOL_B.pfcountFrac.si),SEM_col(CNO_OCGOL_B.pfcountFrac.si),'lineProps',{'Color', magenta_light, 'LineWidth', 1.5,'LineStyle','--'});
% xticks(pf_xvals); xticklabels({'1','2','3'}); xtickangle(45); xlim(xLimits)
% title('Place Field Fraction (SI)')
% ylim([0 1])

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
groups = {'OCGOL-A-Sal', Sal_OCGOL_A.pfwidth.siAll, blue;   
    'OCGOL-A-CNO',   CNO_OCGOL_A.pfwidth.siAll,   blue_light;   
    'OCGOL-B-Sal',   Sal_OCGOL_B.pfwidth.siAll,   magenta;  
    'OCGOL-B-CNO',   CNO_OCGOL_B.pfwidth.siAll,   magenta_light;  
};

figure; hold on
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

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
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
    'OCGOL-A-Sal',        Sal_OCGOL_A.si_scores,        blue;  
    'OCGOL-A-CNO',   CNO_OCGOL_A.si_scores,   blue_light;  
    'OCGOL-B-Sal',   Sal_OCGOL_B.si_scores,   magenta;   
    'OCGOL-B-CNO',   CNO_OCGOL_B.si_scores,   magenta_light;  
};

figure;hold on;

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
pos= linspace(0, 200, 20);
subplot(1,4,3)
shadedErrorBar(pos,mean(Sal_OCGOL_A.sbSI,'omitnan'),SEM_col_exNan(Sal_OCGOL_A.sbSI),'lineProps',{'Color',blue,'LineWidth',1.5});
hold on
shadedErrorBar(pos,mean(CNO_OCGOL_A.sbSI,'omitnan'),SEM_col_exNan(CNO_OCGOL_A.sbSI),'lineProps',{'Color',blue_light,'LineWidth',1.5,'LineStyle','--'});
shadedErrorBar(pos,mean(Sal_OCGOL_B.sbSI,'omitnan'),SEM_col_exNan(Sal_OCGOL_B.sbSI),'lineProps',{'Color',magenta,'LineWidth',1.5});
shadedErrorBar(pos,mean(CNO_OCGOL_B.sbSI,'omitnan'),SEM_col_exNan(CNO_OCGOL_B.sbSI),'lineProps',{'Color',magenta_light,'LineWidth',1.5,'LineStyle','--'});
ylim([0 .1])
xlabel('Position'); ylabel('Spatial Information')
box off
%% Collect SI score by cell type (A sel, B sel, AB)
nMice = length(crossUpdate_files);

Sal_OCGOL_A.classType.Asel.siScoreAvg=NaN(nMice,1);
Sal_OCGOL_A.classType.Asel.siScoreAll=cell(1,nMice);
Sal_OCGOL_B.classType.Bsel.siScoreAvg=NaN(nMice,1);
Sal_OCGOL_B.classType.Bsel.siScoreAll=cell(1,nMice);
Sal_OCGOL_A.classType.AB.siScoreAvg=NaN(nMice,1);
Sal_OCGOL_A.classType.AB.siScoreAll=cell(1,nMice);
Sal_OCGOL_B.classType.AB.siScoreAvg=NaN(nMice,1);
Sal_OCGOL_B.classType.AB.siScoreAll=cell(1,nMice);

CNO_OCGOL_A.classType.Asel.siScoreAvg=NaN(nMice,1);
CNO_OCGOL_A.classType.Asel.siScoreAll=cell(1,nMice);
CNO_OCGOL_B.classType.Bsel.siScoreAvg=NaN(nMice,1);
CNO_OCGOL_B.classType.Bsel.siScoreAll=cell(1,nMice);
CNO_OCGOL_A.classType.AB.siScoreAvg=NaN(nMice,1);
CNO_OCGOL_A.classType.AB.siScoreAll=cell(1,nMice);
CNO_OCGOL_B.classType.AB.siScoreAvg=NaN(nMice,1);
CNO_OCGOL_B.classType.AB.siScoreAll=cell(1,nMice);

%For saline day %TODO working on updating these first before pf width
for mouse=1:nMice
    load(OCGOL_classType_files{mouse})
    if length(tuned_logicals.tuned_log_filt_si)<4 %For MH115 exception
        Sal_OCGOL_A.classType.Asel.siScoreAvg(mouse)= mean(Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.onlyA));
        Sal_OCGOL_A.classType.Asel.siScoreAll{mouse}= Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.onlyA);
        Sal_OCGOL_B.classType.Bsel.siScoreAvg(mouse)= mean(Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.onlyB));
        Sal_OCGOL_B.classType.Bsel.siScoreAll{mouse}= Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.onlyB);
        Sal_OCGOL_A.classType.AB.siScoreAvg(mouse)= mean(Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.AB));
        Sal_OCGOL_A.classType.AB.siScoreAll{mouse}= Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.AB);
        Sal_OCGOL_B.classType.AB.siScoreAvg(mouse)= mean(Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.AB));
        Sal_OCGOL_B.classType.AB.siScoreAll{mouse}= Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,1}.AB);

    elseif length(placeField_dist.all)>=4
        Sal_OCGOL_A.classType.Asel.siScoreAvg(mouse)= mean(Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyA));
        Sal_OCGOL_A.classType.Asel.siScoreAll{mouse}= Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyA);
        Sal_OCGOL_B.classType.Bsel.siScoreAvg(mouse)= mean(Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyB));
        Sal_OCGOL_B.classType.Bsel.siScoreAll{mouse}= Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyB);
        Sal_OCGOL_A.classType.AB.siScoreAvg(mouse)= mean(Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB));
        Sal_OCGOL_A.classType.AB.siScoreAll{mouse}= Sal_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB);
        Sal_OCGOL_B.classType.AB.siScoreAvg(mouse)= mean(Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB));
        Sal_OCGOL_B.classType.AB.siScoreAll{mouse}= Sal_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB);
    end
end

%For CNO day
for mouse=1:nMice
    load(OCGOL_classType_files{mouse})
    if length(tuned_logicals.tuned_log_filt_si)<4 %For MH115 exception
        CNO_OCGOL_A.classType.Asel.siScoreAvg(mouse)= mean(CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyA));
        CNO_OCGOL_A.classType.Asel.siScoreAll{mouse}= CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyA);
        CNO_OCGOL_B.classType.Bsel.siScoreAvg(mouse)= mean(CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyB));
        CNO_OCGOL_B.classType.Bsel.siScoreAll{mouse}= CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.onlyB);
        CNO_OCGOL_A.classType.AB.siScoreAvg(mouse)= mean(CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB));
        CNO_OCGOL_A.classType.AB.siScoreAll{mouse}= CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB);
        CNO_OCGOL_B.classType.AB.siScoreAvg(mouse)= mean(CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB));
        CNO_OCGOL_B.classType.AB.siScoreAll{mouse}= CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,2}.AB);

    elseif length(placeField_dist.all)>=4
        CNO_OCGOL_A.classType.Asel.siScoreAvg(mouse)= mean(CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.onlyA));
        CNO_OCGOL_A.classType.Asel.siScoreAll{mouse}= CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.onlyA);
        CNO_OCGOL_B.classType.Bsel.siScoreAvg(mouse)= mean(CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.onlyB));
        CNO_OCGOL_B.classType.Bsel.siScoreAll{mouse}= CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.onlyB);
        CNO_OCGOL_A.classType.AB.siScoreAvg(mouse)= mean(CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.AB));
        CNO_OCGOL_A.classType.AB.siScoreAll{mouse}= CNO_OCGOL_A.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.AB);
        CNO_OCGOL_B.classType.AB.siScoreAvg(mouse)= mean(CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.AB));
        CNO_OCGOL_B.classType.AB.siScoreAll{mouse}= CNO_OCGOL_B.si_scores_all{mouse}(tuned_logicals.tuned_log_filt_si{1,3}.AB);
    end
end
%% Plot SI score by cell type (A sel, B sel, AB)
A_sel = [Sal_OCGOL_A.classType.Asel.siScoreAvg, CNO_OCGOL_A.classType.Asel.siScoreAvg];
B_sel = [Sal_OCGOL_B.classType.Bsel.siScoreAvg, CNO_OCGOL_B.classType.Bsel.siScoreAvg];
AB_A = [Sal_OCGOL_A.classType.AB.siScoreAvg, CNO_OCGOL_A.classType.AB.siScoreAvg];
AB_B = [Sal_OCGOL_B.classType.AB.siScoreAvg, CNO_OCGOL_B.classType.AB.siScoreAvg];

figure;
subplot(1,2,1);hold on
barWidth = 0.6;
bar(1, mean(A_sel(:,1)), 'FaceColor', blue)
bar(2, mean(A_sel(:,2)), 'FaceColor', blue_light)
bar(3, mean(B_sel(:,1)), 'FaceColor', magenta)
bar(4, mean(B_sel(:,2)), 'FaceColor', magenta_light)
bar(5, mean(AB_A(:,1)), 'FaceColor', purple)
bar(6, mean(AB_A(:,2)), 'FaceColor', purple_light)
bar(7, mean(AB_B(:,1)), 'FaceColor', purple)
bar(8, mean(AB_B(:,2)), 'FaceColor', purple_light)

errorbar(1,mean(A_sel(:,1)),SEM_col(A_sel(:,1)),'k','LineWidth',2);
errorbar(2,mean(A_sel(:,2)),SEM_col(A_sel(:,2)),'k','LineWidth',2);
errorbar(3,mean(B_sel(:,1)),SEM_col(B_sel(:,1)),'k','LineWidth',2);
errorbar(4,mean(B_sel(:,2)),SEM_col(B_sel(:,2)),'k','LineWidth',2);
errorbar(5,mean(AB_A(:,1)),SEM_col(AB_A(:,1)),'k','LineWidth',2);
errorbar(6,mean(AB_A(:,2)),SEM_col(AB_A(:,2)),'k','LineWidth',2);
errorbar(7,mean(AB_B(:,1)),SEM_col(AB_B(:,1)),'k','LineWidth',2);
errorbar(8,mean(AB_B(:,2)),SEM_col(AB_B(:,2)),'k','LineWidth',2);

for i=1:size(A_sel,1)
    plot([1,2],A_sel(i,:),'Color',[0.5 0.5 0.5])
end
for i=1:size(B_sel,1)
    plot([3,4],B_sel(i,:),'Color',[0.5 0.5 0.5])
end
for i=1:size(AB_A,1)
    plot([5,6],AB_A(i,:),'Color',[0.5 0.5 0.5])
end
for i=1:size(AB_B,1)
    plot([7,8],AB_B(i,:),'Color',[0.5 0.5 0.5])
end

xlim([0 9]); 
xTickVals = [1 2 3 4 5 6 7 8];
xTickLabels = {'A Sel-Saline','A Sel-CNO','B Sel-Saline','B Sel-CNO','AB-A-Saline','AB-A-CNO','AB-B-Saline','AB-B-CNO'};

xticks(xTickVals); 
xticklabels(xTickLabels);

ylabel('SI Score')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
exportgraphics(gcf, 'SIscores.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export SI scores by class for stats
% writematrix(A_sel, fullfile(savepath,'SI_ASel.csv'));
% writematrix(B_sel, fullfile(savepath,'SI_BSel.csv'));
% writematrix(AB_A, fullfile(savepath,'SI_AB_ATrial.csv'));
% writematrix(AB_B, fullfile(savepath,'SI_AB_BTrial.csv'));

%% PV/TC Files 
%TODO integrate LEC_silence_plotsV2 for the rest of this figure
% OCGOL_pfwidth_files= cell(size(crossUpdate_files)); 
% for i = 1:length(crossUpdate_files)
%     OCGOL_pfwidth_files{i} = fullfile(crossUpdate_files{i}, 'PV_TC_corr.mat');
% end
%% Centroid shifts of tuned cells that are tuned consecutive days in each trial
% Initialize master results structure for silencing day-------------------

OCGOL_Sil_shift = struct();

for i = 1:numel(crossUpdate_files)
    pathName = crossUpdate_files{i};

    % --- Extract mouse ID (e.g., "MH110") from path ---
    tokens = regexp(pathName, '(MH\d+)', 'match');
    if ~isempty(tokens)
        mouseID = tokens{1};
    else
        mouseID = sprintf('Mouse_%02d', i); % fallback name if regex fails
    end

    if strcmp(mouseID, 'MH115') %skipping MH115 because missing control day
        fprintf('Skipping %s (%d of %d)...\n', mouseID, i, numel(crossUpdate_files));
        continue; % skip to next iteration
    end

    fprintf('Processing %s (%d of %d)...\n', mouseID, i, numel(crossUpdate_files));

    try
        % --- Run your centroid shift function ---
        [theta, unit_vectors, circular_mean_rad, circular_mean_cm] = centroid_shift_silence(pathName);

        % --- Store outputs in structure ---
        OCGOL_Sil_shift.(mouseID).path = pathName;
        OCGOL_Sil_shift.(mouseID).theta = theta;
        OCGOL_Sil_shift.(mouseID).unit_vectors = unit_vectors;
        OCGOL_Sil_shift.(mouseID).circular_mean_rad = circular_mean_rad;
        OCGOL_Sil_shift.(mouseID).circular_mean_cm = circular_mean_cm;

    catch ME
        warning('Error processing %s: %s', mouseID, ME.message);
        OCGOL_Sil_shift.(mouseID).error = ME.message;
    end
end

% Initialize master results structure for control day-------------------
OCGOL_Control_shift = struct();

for i = 1:numel(crossUpdate_files)
    pathName = crossUpdate_files{i};

    % --- Extract mouse ID (e.g., "MH110") from path ---
    tokens = regexp(pathName, '(MH\d+)', 'match');
    if ~isempty(tokens)
        mouseID = tokens{1};
    else
        mouseID = sprintf('Mouse_%02d', i); % fallback name if regex fails
    end
    
    if strcmp(mouseID, 'MH115') %skipping MH115 because missing control day
        fprintf('Skipping %s (%d of %d)...\n', mouseID, i, numel(crossUpdate_files));
        continue; % skip to next iteration
    end
    fprintf('Processing %s (%d of %d)...\n', mouseID, i, numel(crossUpdate_files));

    try
        % --- Run your centroid shift function ---
        [theta, unit_vectors, circular_mean_rad, circular_mean_cm] = centroid_shift_control(pathName);

        % --- Store outputs in structure ---
        OCGOL_Control_shift.(mouseID).path = pathName;
        OCGOL_Control_shift.(mouseID).theta = theta;
        OCGOL_Control_shift.(mouseID).unit_vectors = unit_vectors;
        OCGOL_Control_shift.(mouseID).circular_mean_rad = circular_mean_rad;
        OCGOL_Control_shift.(mouseID).circular_mean_cm = circular_mean_cm;

    catch ME
        warning('Error processing %s: %s', mouseID, ME.message);
        OCGOL_Control_shift.(mouseID).error = ME.message;
    end
end
%% Plot centroid shift
%Control sessions
mouseIDs = fieldnames(OCGOL_Control_shift);

Sal_OCGOL_A.centShift = []; % collect all circular_mean_cm values
Sal_OCGOL_B.centShift = [];

for i = 1:numel(mouseIDs)
    if isfield(OCGOL_Control_shift.(mouseIDs{i}), 'circular_mean_cm')
        Sal_OCGOL_A.centShift(end+1) = OCGOL_Control_shift.(mouseIDs{i}).circular_mean_cm{4};
    end
end

for i = 1:numel(mouseIDs)
    if isfield(OCGOL_Control_shift.(mouseIDs{i}), 'circular_mean_cm')
        Sal_OCGOL_B.centShift(end+1) = OCGOL_Control_shift.(mouseIDs{i}).circular_mean_cm{5};
    end
end
%--------------------------------------------------------------------------
%control vs silence sessions
mouseIDs = fieldnames(OCGOL_Sil_shift);

CNO_OCGOL_A.centShift = []; % collect all circular_mean_cm values
CNO_OCGOL_B.centShift = []; 

for i = 1:numel(mouseIDs)
    if isfield(OCGOL_Sil_shift.(mouseIDs{i}), 'circular_mean_cm')
        CNO_OCGOL_A.centShift(end+1) = OCGOL_Sil_shift.(mouseIDs{i}).circular_mean_cm{4};
    end
end

for i = 1:numel(mouseIDs)
    if isfield(OCGOL_Sil_shift.(mouseIDs{i}), 'circular_mean_cm')
        CNO_OCGOL_B.centShift(end+1) = OCGOL_Sil_shift.(mouseIDs{i}).circular_mean_cm{5};
    end
end

A_centShift=[Sal_OCGOL_A.centShift' CNO_OCGOL_A.centShift'];
B_centShift=[Sal_OCGOL_B.centShift' CNO_OCGOL_B.centShift'];

figure;
hold on
for i=1:size(A_centShift,1)
    plot([1 2],A_centShift(i,:),'Color',[0.5 0.5 0.5])
end
for i=1:size(B_centShift,1)
    plot([3 4],B_centShift(i,:),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(A_centShift(:,1)),SEM_col(A_centShift(:,1)),'LineWidth',2,'Color',blue);
errorbar(2,mean(A_centShift(:,2)),SEM_col(A_centShift(:,2)),'LineWidth',2,'Color',blue_light);
errorbar(3,mean(B_centShift(:,1)),SEM_col(B_centShift(:,1)),'LineWidth',2,'Color',magenta);
errorbar(4,mean(B_centShift(:,2)),SEM_col(B_centShift(:,2)),'LineWidth',2,'Color',magenta_light);

scatter(1, mean(A_centShift(:,1)), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(A_centShift(:,2)), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, mean(B_centShift(:,1)), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, mean(B_centShift(:,2)), 's', 'filled', 'MarkerFaceColor', magenta_light)

xticks([1 2 3 4]); xticklabels({'A-Saline','A-CNO','B-Saline','B-CNO'}); xtickangle(45); xlim([0 5])
ylabel('Centroid Shift (cm)')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
exportgraphics(gcf, 'centShift.pdf', 'ContentType', 'vector', 'Resolution', 300);


