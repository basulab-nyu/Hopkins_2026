%% MH110 Example FOVs of RF vs OCGOL
MH110_rf=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\read_inputs\CNMF_output.mat");
MH110_ocgol=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\read_inputs\CNMF_output.mat");

MH110_rf_roi=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\removedROI\26_Oct_2023_selectedROIs.mat");
MH110_ocgol_roi=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\removedROI\07_Nov_2023_selectedROIs.mat");

MH110_rf_tuned=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat");
MH110_ocgol_tuned=load("R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\16_Aug_2024_ca_analysis.mat");
%% Getting ROI masks and identity of tuned cells
rf_keep=find(MH110_rf_roi.compSelect);
rf=MH110_rf.CNMF_output.A_keep(:,rf_keep);
rf_tuned=rf(:,MH110_rf_tuned.Place_cell{1, 1}.Tuned_ROI); 

ocgol_keep=find(MH110_ocgol_roi.compSelect);
ocgol=MH110_ocgol.CNMF_output.A_keep(:,ocgol_keep);
ocgol_tuned_A=ocgol(:,MH110_ocgol_tuned.Place_cell{1, 4}.Tuned_ROI); 
ocgol_tuned_B=ocgol(:,MH110_ocgol_tuned.Place_cell{1, 5}.Tuned_ROI); 
%% Plotting the FOVs and ROI masks
figure(2)
%plot first data 
ax1 = axes; 
im = imagesc(ax1,reshape((sum(rf,2)),[512,512])); 
im.AlphaData = 0.5; % change this value to change the background image transparency 
axis square; 
hold all; 
%plot second data 
ax2 = axes; 
im1 = imagesc(ax2,reshape((sum(rf_tuned,2)),[512,512])); 
im1.AlphaData = 0.5; % change this value to change the foreground image transparency 
axis square; 
%link axes 
linkaxes([ax1,ax2]) 
%%Hide the top axes 
ax2.Visible = 'off'; 
ax2.XTick = []; 
ax2.YTick = []; 
%add differenct colormap to different data if you wish 
colormap(ax1,'gray') 
colormap(ax2,'hot') 

figure(3)
ax1 = axes; 
im = imagesc(ax1,reshape((sum(ocgol,2)),[512,512])); 
im.AlphaData = 0.5; % change this value to change the background image transparency 
axis square; 
hold all; 
%plot second data 
ax2 = axes; 
im1 = imagesc(ax2,reshape((sum(ocgol_tuned_A,2)),[512,512])); 
im1.AlphaData = 0.5; % change this value to change the foreground image transparency 
axis square; 
%link axes 
linkaxes([ax1,ax2]) 
%%Hide the top axes 
ax2.Visible = 'off'; 
ax2.XTick = []; 
ax2.YTick = []; 
%add differenct colormap to different data if you wish 
colormap(ax1,'gray') 
colormap(ax2,'hot') 

figure(4)
ax1 = axes; 
im = imagesc(ax1,reshape((sum(ocgol,2)),[512,512])); 
im.AlphaData = 0.5; % change this value to change the background image transparency 
axis square; 
hold all; 
%plot second data 
ax2 = axes; 
im1 = imagesc(ax2,reshape((sum(ocgol_tuned_B,2)),[512,512])); 
im1.AlphaData = 0.5; % change this value to change the foreground image transparency 
axis square; 
%link axes 
linkaxes([ax1,ax2]) 
%%Hide the top axes 
ax2.Visible = 'off'; 
ax2.XTick = []; 
ax2.YTick = []; 
%add differenct colormap to different data if you wish 
colormap(ax1,'gray') 
colormap(ax2,'hot') 

%% Place field density calculation (currently does all mice)
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\cent_diff.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\cent_diff.mat'};

% Automatically extract mouse IDs from file paths
extractMouseID = @(filepath) regexp(filepath, 'MH\d{3}', 'match', 'once');

RF_mice = cellfun(extractMouseID, RF_files, 'UniformOutput', false);
OCGOL_mice = cellfun(extractMouseID, OCGOL_files, 'UniformOutput', false);

edges=[0:5:100];
RF.pfCentrDistr= NaN([length(RF_files),length(edges)-1]);
OCGOL.pfCentrDistr_A= NaN([length(OCGOL_files),length(edges)-1]);
OCGOL.pfCentrDistr_B= NaN([length(OCGOL_files),length(edges)-1]);


for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF.pfCentrDistr(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 2}{1, 1});
end


for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL.pfCentrDistr_A(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 1}{1, 4});
    OCGOL.pfCentrDistr_B(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 1}{1, 5});
end

% Plotting place field density TODO Rayleigh Test for Uniformity?
pos= 1:20;

subplot(1,3,1)
plot(mean(RF.pfCentrDistr),'Color',[0 0.5 0],'LineWidth',2)
hold on
plot(mean(OCGOL.pfCentrDistr_A),'Color',cmap_blue(12,:),'LineWidth',2)
ylim([0 0.12])

errorbar(pos,mean(RF.pfCentrDistr),SEM_col(RF.pfCentrDistr),'.','CapSize',10,'LineWidth',1.5,'Color',[0 0.5 0]);
errorbar(pos,mean(OCGOL.pfCentrDistr_A),SEM_col(OCGOL.pfCentrDistr_A),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_blue(12,:));

subplot(1,3,2)
plot(mean(RF.pfCentrDistr),'Color',[0 0.5 0],'LineWidth',2)
hold on
plot(mean(OCGOL.pfCentrDistr_B),'Color',cmap_red(12,:),'LineWidth',2)
ylim([0 0.12])
errorbar(pos,mean(RF.pfCentrDistr),SEM_col(RF.pfCentrDistr),'.','CapSize',10,'LineWidth',1.5,'Color',[0 0.5 0]);
errorbar(pos,mean(OCGOL.pfCentrDistr_B),SEM_col(OCGOL.pfCentrDistr_B),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_red(12,:));

subplot(1,3,3)
hold on
plot(mean(OCGOL.pfCentrDistr_A),'Color',cmap_blue(12,:),'LineWidth',2)
plot(mean(OCGOL.pfCentrDistr_B),'Color',cmap_red(12,:),'LineWidth',2)
ylim([0 0.12])
errorbar(pos,mean(OCGOL.pfCentrDistr_A),SEM_col(OCGOL.pfCentrDistr_A),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_blue(12,:));
errorbar(pos,mean(OCGOL.pfCentrDistr_B),SEM_col(OCGOL.pfCentrDistr_B),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_red(12,:));
%% RF D2 and OCGOl D1 place files
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\MH112_23_05_01-001_2\output\22_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\MH113_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\MH114_23_05_01-001_2\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\MH118_23_07_14_RF-001_2\output\09_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\MH122_2024_04_17_RF-001_3\output\06_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_17_RF-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\MH124_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\MH125_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\MH126_2024_04_17_RF-001_2\output\06_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\MH128_2024_04_18_3R-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\MH131_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\MH132_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_12_RF_3R-001_1\output\24_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_12_RF_3R-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_12_RF_3R-001_1\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_12_RF_3R-001_1\output\19_Jan_2025_ca_analysis.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\MH112_23_05_17_Random-001_3\output\23_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\MH113_23_05_23-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\MH114_23_05_24_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\MH115_23_08_07_Random-001_6\output\09_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\MH122_2024_05_01_Random-001_1\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_01_Random-001_6\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\MH124_2024_04_30_Random-001_6\output\08_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\MH126_2024_05_01_Random-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\MH127_2024_04_30_Random-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\MH128_2024_05_04_Random-001_2\output\10_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\MH134_2024_10_28_Random-001_4\output\16_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_28_Random-001_3\output\24_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_25_Random-001_7\output\27_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_27_Random-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_27_Random-001_3\output\16_Jan_2025_ca_analysis.mat'};

% Automatically extract mouse IDs from file paths
extractMouseID = @(filepath) regexp(filepath, 'MH\d{3}', 'match', 'once');

RF_mice = cellfun(extractMouseID, RF_files, 'UniformOutput', false);
OCGOL_mice = cellfun(extractMouseID, OCGOL_files, 'UniformOutput', false);

[matchedCells, idxInArray1, idxInArray2] = intersect(RF_mice, OCGOL_mice);
[nonMatchingInArray1, unique_idxInArray1] = setdiff(RF_mice, OCGOL_mice);
[nonMatchingInArray2, unique_idxInArray2] = setdiff(OCGOL_mice, RF_mice);

%% Event calcium traces with cutoff of 6 seconds from event onset
%Need to scale up to loop through all mouse directories
sampleTime=4/(1/30); %6 seconds of event in imaging time

RF.avgMouse_eventTrace= NaN([length(RF_files),sampleTime]);
RF.allROIMouse_eventTrace= cell(1,length(RF_files));
OCGOL_A.avgMouse_eventTrace= NaN([length(OCGOL_files),sampleTime]);
OCGOL_A.allROIMouse_eventTrace= cell(1,length(OCGOL_files));
OCGOL_B.avgMouse_eventTrace= NaN([length(OCGOL_files),sampleTime]);
OCGOL_B.allROIMouse_eventTrace= cell(1,length(OCGOL_files));

%RF
for i_mouse=1:length(RF_files)
    fprintf('Processing RF mouse %d/%d: %s\n', i_mouse, length(RF_files), RF_mice{i_mouse});
    rf=load(RF_files{i_mouse},'Events');
    [avgROI, avgMouse] = processMouseEventTrace(rf.Events.Run.properties.trace, sampleTime);
    RF.allROIMouse_eventTrace{i_mouse} = avgROI;
    RF.avgMouse_eventTrace(i_mouse, :) = avgMouse;
end

%OCGOL 
for i_mouse=1:length(OCGOL_files)
    fprintf('Processing OCGOL mouse %d/%d: %s\n', i_mouse, length(OCGOL_files), OCGOL_mice{i_mouse});
    ocgol=load(OCGOL_files{i_mouse},'Events','Events_split');
    %OCGOL A
    [avgROI_a, avgMouse_a] = processMouseEventTrace(ocgol.Events_split{1,4}.Run.properties.trace, sampleTime);
    OCGOL_A.allROIMouse_eventTrace{i_mouse} = avgROI_a;
    OCGOL_A.avgMouse_eventTrace(i_mouse, :) = avgMouse_a;

    %OCGOL B
    [avgROI_b, avgMouse_b] = processMouseEventTrace(ocgol.Events_split{1,5}.Run.properties.trace, sampleTime);
    OCGOL_B.allROIMouse_eventTrace{i_mouse} = avgROI_b;
    OCGOL_B.avgMouse_eventTrace(i_mouse, :) = avgMouse_b;
end
%SEM for average traces
err_RF=SEM_col_exNan(RF.avgMouse_eventTrace);
err_A=SEM_col_exNan(OCGOL_A.avgMouse_eventTrace);
err_B=SEM_col_exNan(OCGOL_B.avgMouse_eventTrace);
%% Plot average calcium traces for RF, OCGOL A, and OCGOL B
a=(1:sampleTime)/30;
figure;
hold on;
shadedErrorBar(a,mean(RF.avgMouse_eventTrace(:,1:120),1,'omitnan'),err_RF(1:120),'lineProps','m');
shadedErrorBar(a,mean(OCGOL_A.avgMouse_eventTrace(:,1:120),1,'omitnan'),err_A(1:120),'lineProps','b');
shadedErrorBar(a,mean(OCGOL_B.avgMouse_eventTrace(:,1:120),1,'omitnan'),err_B(1:120),'lineProps','r');
hold off;
legend show;
xlabel('Time (s)');
ylabel('df/f'); %TODO Confirm the units
title('Average Event Traces');
legend({'RF','OCGOL-A','OCGOL-B'})
ylim([0 0.8])

%% Spatial Information/Tuning Specificity
% Compute for RF
RF = computeSpatialTuningStats(RF_files, 1);

% Compute for OCGOLA
OCGOL_A = computeSpatialTuningStats(OCGOL_files, 4);

% Compute for OCGOLB
OCGOL_B = computeSpatialTuningStats(OCGOL_files, 5);
%% Plotting SI and TS
si_paired=[RF.si_score(idxInArray1),OCGOL_A.si_score(idxInArray2),OCGOL_B.si_score(idxInArray2)];
ts_paired=[RF.ts_score(idxInArray1),OCGOL_A.ts_score(idxInArray2),OCGOL_B.ts_score(idxInArray2)];

figure()
subplot(1,2,1)
hold on
errorbar(1,mean(si_paired(:,1)),SEM_col(si_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(si_paired(:,2)),SEM_col(si_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(si_paired(:,3)),SEM_col(si_paired(:,3)),'LineWidth',1.5);
for i=1:size(si_paired,1)
    plot([1 2 3],si_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 0.12])
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})
title('Spatial Information')
subplot(1,2,2)
hold on
errorbar(1,mean(ts_paired(:,1)),SEM_col(ts_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(ts_paired(:,2)),SEM_col(ts_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(ts_paired(:,3)),SEM_col(ts_paired(:,3)),'LineWidth',1.5);
for i=1:size(ts_paired,1)
    plot([1 2 3],ts_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 1])
title('Tuning Specificity')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})
%% Plotting active cells and fraction tuned (various criteria)
activeROI_paired=[RF.activeROI(idxInArray1),OCGOL_A.activeROI(idxInArray2),OCGOL_B.activeROI(idxInArray2)];
si_paired=[RF.siTuned(idxInArray1),OCGOL_A.siTuned(idxInArray2),OCGOL_B.siTuned(idxInArray2)];
ts_paired=[RF.tsTuned(idxInArray1),OCGOL_A.tsTuned(idxInArray2),OCGOL_B.tsTuned(idxInArray2)];
SiTs_paired=[RF.SiTsTuned(idxInArray1),OCGOL_A.SiTsTuned(idxInArray2),OCGOL_B.SiTsTuned(idxInArray2)];
SiorTS_paired=[RF.SiorTsTuned(idxInArray1),OCGOL_A.SiorTsTuned(idxInArray2),OCGOL_B.SiorTsTuned(idxInArray2)];
fracTuned_paired=SiorTS_paired./activeROI_paired; %SI or TS paired are counted
fracTuned_siandts_paired=SiTs_paired./activeROI_paired; %Must be meet both SI and TS criteria
fracTuned_si_paired=si_paired./activeROI_paired; %SI 
fracTuned_ts_paired=ts_paired./activeROI_paired; %TS

figure()
subplot(1,2,2)
hold on
errorbar(1,mean(activeROI_paired(:,1)),SEM_col(activeROI_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(activeROI_paired(:,2)),SEM_col(activeROI_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(activeROI_paired(:,3)),SEM_col(activeROI_paired(:,3)),'LineWidth',1.5);
for i=1:size(activeROI_paired,1)
    plot([1 2 3],activeROI_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})
title('Total Active')

subplot(1,2,2)
hold on
errorbar(1,mean(SiorTS_paired(:,1)),SEM_col(SiorTS_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(SiorTS_paired(:,2)),SEM_col(SiorTS_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(SiorTS_paired(:,3)),SEM_col(SiorTS_paired(:,3)),'LineWidth',1.5);
for i=1:size(SiorTS_paired,1)
    plot([1 2 3],SiorTS_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
title('Number Tuned (SI | TS)')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})

figure()
subplot(1,4,1)
hold on
errorbar(1,mean(fracTuned_paired(:,1)),SEM_col(fracTuned_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(fracTuned_paired(:,2)),SEM_col(fracTuned_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(fracTuned_paired(:,3)),SEM_col(fracTuned_paired(:,3)),'LineWidth',1.5);
for i=1:size(fracTuned_paired,1)
    plot([1 2 3],fracTuned_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 1])
title('Fraction Tuned (SI | TS)')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})

subplot(1,4,2)
hold on
errorbar(1,mean(fracTuned_siandts_paired(:,1)),SEM_col(fracTuned_siandts_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(fracTuned_siandts_paired(:,2)),SEM_col(fracTuned_siandts_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(fracTuned_siandts_paired(:,3)),SEM_col(fracTuned_siandts_paired(:,3)),'LineWidth',1.5);
for i=1:size(fracTuned_siandts_paired,1)
    plot([1 2 3],fracTuned_siandts_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 1])
title('Fraction Tuned (SI & TS)')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})

subplot(1,4,3)
hold on
errorbar(1,mean(fracTuned_si_paired(:,1)),SEM_col(fracTuned_si_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(fracTuned_si_paired(:,2)),SEM_col(fracTuned_si_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(fracTuned_si_paired(:,3)),SEM_col(fracTuned_si_paired(:,3)),'LineWidth',1.5);
for i=1:size(fracTuned_si_paired,1)
    plot([1 2 3],fracTuned_si_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 1])
title('Fraction Tuned (SI)')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})

subplot(1,4,4)
hold on
errorbar(1,mean(fracTuned_ts_paired(:,1)),SEM_col(fracTuned_ts_paired(:,1)),'LineWidth',1.5);
errorbar(2,mean(fracTuned_ts_paired(:,2)),SEM_col(fracTuned_ts_paired(:,2)),'LineWidth',1.5);
errorbar(3,mean(fracTuned_ts_paired(:,3)),SEM_col(fracTuned_ts_paired(:,3)),'LineWidth',1.5);
for i=1:size(fracTuned_ts_paired,1)
    plot([1 2 3],fracTuned_ts_paired(i,:),'Color',[0.5 0.5 0.5])
end
xlim([0 4])
ylim([0 1])
title('Fraction Tuned (TS)')
xticks([1 2 3])
xticklabels({'RF', 'OCGOL-A', 'OCGOL-B'})