%For RF2 and RF Silencing Supplemental Figure
%Only data for MH131, 132, 137, 138

%Colors
magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.97 0.58 0.11];
purple= (magenta + blue) / 2;
magenta_light = magenta + 0.50 * (1 - magenta);
blue_light = blue + 0.50 * (1 - blue);
purple_light= purple + 0.50 * (1 - purple);
yellow_light= yellow+ 0.50 * (1 - yellow);

%% Load in data for RF1, OCGOL w/w/o LEC, RF2 w/w/o LEC
mice={'MH131','MH132','MH137','MH138'};

MH131_rf1=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat');
MH132_rf1=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\PV_TC_corr.mat');
MH137_rf1=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat');
MH138_rf1=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat');

MH131_ocg=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH132_ocg=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH137_ocg=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH138_ocg=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');

MH131_rf2=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\BrvsRF_BrRFSes\crossSession_update\PV_TC_corr.mat');
MH132_rf2=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\BrvsRF_BrRFSes\crossSession_update\PV_TC_corr.mat');
MH137_rf2=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\BrvsRF_BrRFSes\crossSession_update\PV_TC_corr.mat');
MH138_rf2=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\BrvsRF_BrRFSes\crossSession_update\PV_TC_corr.mat');

%% Make PV matrices
%RF (column 1: rf1 vs. rf1, 2: rf2 vs. rf2, 3: rf2 saline vs. rf2 cno
RF.PV=NaN(length(mice),3);

for i=1:length(mice) %Collects column 1 (rf 1)
    mouse = mice{i};
    mouse_PV=eval([mouse,'_rf1','.PV_TC_corr.PVcorr_all_ses.A']);
    RF.PV(i,1)=mean(diag(mouse_PV{1,2}));
end

for i=1:length(mice) %Collects column 2 and 3 (rf 2 s vs. s, s vs. cno)
    mouse = mice{i};
    mouse_PV=eval([mouse,'_rf2','.PV_TC_corr.PVcorr_all_ses.A']);
    RF.PV(i,2)=mean(diag(mouse_PV{8,10}));
    RF.PV(i,3)=mean(diag(mouse_PV{10,12}));
end

%OCGOL (column 1: A (sal v.sal), 2: A (sal vs. cno), 3: B(sal v, sal), 4:
%B (sal v. cno)
OCGOL.PV=NaN(length(mice),4);
for i=1:length(mice) 
    mouse = mice{i};
    mouse_PV_A=eval([mouse,'_ocg','.PV_TC_corr.PVcorr_all_ses.A']);
    mouse_PV_B=eval([mouse,'_ocg','.PV_TC_corr.PVcorr_all_ses.B']);
    OCGOL.PV(i,1)=mean(diag(mouse_PV_A{1,2}));
    OCGOL.PV(i,2)=mean(diag(mouse_PV_A{2,3}));
    OCGOL.PV(i,3)=mean(diag(mouse_PV_B{1,2}));
    OCGOL.PV(i,4)=mean(diag(mouse_PV_B{2,3}));
end

%% Make TC matrices
%RF (column 1: rf1 vs. rf1, 2: rf2 vs. rf2, 3: rf2 saline vs. rf2 cno)
RF.TC=NaN(length(mice),3);

for i=1:length(mice) %Collects column 1 (rf 1)
    mouse = mice{i};
    mouse_TC=eval([mouse,'_rf1','.PV_TC_corr.TCcorr_all_ses.si.A']);
    RF.TC(i,1)=mean(diag(mouse_TC{1,2}));
end

for i=1:length(mice) %Collects column 2 and 3 (rf 2 s vs. s, s vs. cno)
    mouse = mice{i};
    mouse_TC=eval([mouse,'_rf2','.PV_TC_corr.TCcorr_all_ses.si.A']);
    RF.TC(i,2)=mean(diag(mouse_TC{8,10}));
    RF.TC(i,3)=mean(diag(mouse_TC{10,12}));
end

%OCGOL (column 1: A (sal v.sal), 2: A (sal vs. cno), 3: B(sal v, sal), 4:
%B (sal v. cno)
OCGOL.TC=NaN(length(mice),4);
for i=1:length(mice) 
    mouse = mice{i};
    mouse_TC_A=eval([mouse,'_ocg','.PV_TC_corr.TCcorr_all_ses.si.A']);
    mouse_TC_B=eval([mouse,'_ocg','.PV_TC_corr.TCcorr_all_ses.si.B']);
    OCGOL.TC(i,1)=mean(diag(mouse_TC_A{1,2}));
    OCGOL.TC(i,2)=mean(diag(mouse_TC_A{2,3}));
    OCGOL.TC(i,3)=mean(diag(mouse_TC_B{1,2}));
    OCGOL.TC(i,4)=mean(diag(mouse_TC_B{2,3}));
end
%% 
% savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\3\RF2_CNO_PV.csv'; % Full path to save file
% writematrix([RF.PV OCGOL.PV], savepath);
% savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\3\RF2_CNO_TC.csv'; % Full path to save file
% writematrix([RF.TC OCGOL.TC], savepath);
%% Plot PV and TC (RF only)
PV=[RF.PV OCGOL.PV];
TC=[RF.TC OCGOL.TC];

figure
subplot(1,2,1); hold on
for i=1:length(mice)
    plot(1:3,PV(i,1:3),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(PV(:,1)),SEM_col(PV(:,1)),'LineWidth',2,'Color',yellow);
errorbar(2,mean(PV(:,2)),SEM_col(PV(:,2)),'LineWidth',2,'Color', yellow);
errorbar(3,mean(PV(:,3)),SEM_col(PV(:,3)),'LineWidth',2,'Color', yellow_light);

scatter(1,mean(PV(:,1)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(2,mean(PV(:,2)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(3,mean(PV(:,3)),'s', 'filled', 'MarkerFaceColor', yellow_light)

xticks(1:3); xticklabels({'RF1','RF2 Saline','RF2 CNO'}); xtickangle(45)
xlim([0 4])
ylim([0.2 0.7]); ylabel('PV Correlation')

subplot(1,2,2); hold on
for i=1:length(mice)
    plot(1:3,TC(i,1:3),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(TC(:,1)),SEM_col(TC(:,1)),'LineWidth',2,'Color',yellow);
errorbar(2,mean(TC(:,2)),SEM_col(TC(:,2)),'LineWidth',2,'Color', yellow);
errorbar(3,mean(TC(:,3)),SEM_col(TC(:,3)),'LineWidth',2,'Color', yellow_light);

scatter(1,mean(TC(:,1)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(2,mean(TC(:,2)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(3,mean(TC(:,3)),'s', 'filled', 'MarkerFaceColor', yellow_light)

xticks(1:3); xticklabels({'RF1','RF2 Saline','RF2 CNO'}); xtickangle(45)
xlim([0 4])
ylim([0.2 0.7]); ylabel('TC Correlation')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');

%% RF and OCGOL
figure
subplot(1,2,1); hold on
for i=1:length(mice)
    plot(1:7,PV(i,:),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(PV(:,1)),SEM_col(PV(:,1)),'LineWidth',2,'Color',yellow);
errorbar(2,mean(PV(:,2)),SEM_col(PV(:,2)),'LineWidth',2,'Color', yellow);
errorbar(3,mean(PV(:,3)),SEM_col(PV(:,3)),'LineWidth',2,'Color', yellow_light);
errorbar(4,mean(PV(:,4)),SEM_col(PV(:,4)),'LineWidth',2,'Color', blue);
errorbar(5,mean(PV(:,5)),SEM_col(PV(:,5)),'LineWidth',2,'Color', blue_light);
errorbar(6,mean(PV(:,6)),SEM_col(PV(:,6)),'LineWidth',2,'Color', magenta);
errorbar(7,mean(PV(:,7)),SEM_col(PV(:,7)),'LineWidth',2,'Color', magenta_light);

scatter(1,mean(PV(:,1)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(2,mean(PV(:,2)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(3,mean(PV(:,3)),'s', 'filled', 'MarkerFaceColor', yellow_light)
scatter(4,mean(PV(:,4)),'s', 'filled', 'MarkerFaceColor', blue)
scatter(5,mean(PV(:,5)),'s', 'filled', 'MarkerFaceColor', blue_light)
scatter(6,mean(PV(:,6)),'s', 'filled', 'MarkerFaceColor', magenta)
scatter(7,mean(PV(:,7)),'s', 'filled', 'MarkerFaceColor', magenta_light)
xticks(1:7); xticklabels({'RF1','RF2 Saline','RF2 CNO','A Saline','A CNO','B Saline','B CNO'})
xlim([0 8])
ylim([0.2 0.8]); ylabel('PV Correlation')

subplot(1,2,2); hold on
for i=1:length(mice)
    plot(1:7,TC(i,:),'Color',[0.5 0.5 0.5])
end
errorbar(1,mean(TC(:,1)),SEM_col(TC(:,1)),'LineWidth',2,'Color',yellow);
errorbar(2,mean(TC(:,2)),SEM_col(TC(:,2)),'LineWidth',2,'Color', yellow);
errorbar(3,mean(TC(:,3)),SEM_col(TC(:,3)),'LineWidth',2,'Color', yellow_light);
errorbar(4,mean(TC(:,4)),SEM_col(TC(:,4)),'LineWidth',2,'Color', blue);
errorbar(5,mean(TC(:,5)),SEM_col(TC(:,5)),'LineWidth',2,'Color', blue_light);
errorbar(6,mean(TC(:,6)),SEM_col(TC(:,6)),'LineWidth',2,'Color', magenta);
errorbar(7,mean(TC(:,7)),SEM_col(TC(:,7)),'LineWidth',2,'Color', magenta_light);

scatter(1,mean(TC(:,1)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(2,mean(TC(:,2)),'s', 'filled', 'MarkerFaceColor', yellow)
scatter(3,mean(TC(:,3)),'s', 'filled', 'MarkerFaceColor', yellow_light)
scatter(4,mean(TC(:,4)),'s', 'filled', 'MarkerFaceColor', blue)
scatter(5,mean(TC(:,5)),'s', 'filled', 'MarkerFaceColor', blue_light)
scatter(6,mean(TC(:,6)),'s', 'filled', 'MarkerFaceColor', magenta)
scatter(7,mean(TC(:,7)),'s', 'filled', 'MarkerFaceColor', magenta_light)
xticks(1:7); xticklabels({'RF1','RF2 Saline','RF2 CNO','A Saline','A CNO','B Saline','B CNO'})
xlim([0 8])
ylim([0.2 0.8]); ylabel('TC Correlation')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');