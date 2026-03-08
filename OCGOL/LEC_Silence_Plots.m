%% PV same day
MH110 = load('R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update\PV_TC_corr.mat');
MH113 = load('R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update\PV_TC_corr.mat');
MH114 = load('R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes\PV_TC_corr.mat');
MH115 = load('R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update\PV_TC_corr.mat'); 

MH126=load('R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update\PV_TC_corr.mat');
MH127=load('R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\PV_TC_corr.mat');
MH122=load('R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update\PV_TC_corr.mat');
MH128=load('R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update\PV_TC_corr.mat');

MH131=load('R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH132=load('R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
%MH136=
%MH137=
MH138=load('R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
%%
cmap_green=cbrewer('seq','Greens',16);
cmap_blue=cbrewer('seq', 'Blues', 16);
cmap_red=cbrewer('seq', 'Reds', 16);
cmap_purple=cbrewer('seq','Purples',16);
%%
%TC same day (all cells?)
MH110_TCsame = [nanmean(MH110.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH110.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH110.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH110.PV_TC_corr.TC_same_day_diag{1, 4})];  
MH113_TCsame = [nanmean(MH113.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH113.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH113.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH113.PV_TC_corr.TC_same_day_diag{1, 4})];  
MH114_TCsame = [nanmean(MH114.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH114.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH114.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH114.PV_TC_corr.TC_same_day_diag{1, 4})];  
MH115_TCsame = [NaN nanmean(MH115.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH115.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH115.PV_TC_corr.TC_same_day_diag{1, 3})];  
MH126_TCsame = [nanmean(MH126.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH126.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH126.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH126.PV_TC_corr.TC_same_day_diag{1, 4})];  
MH127_TCsame = [nanmean(MH127.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH127.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH127.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH127.PV_TC_corr.TC_same_day_diag{1, 4})];  
MH122_TCsame = [nanmean(MH122.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH122.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH122.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH122.PV_TC_corr.TC_same_day_diag{1, 4})]; 
MH128_TCsame = [nanmean(MH128.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH128.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH128.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH128.PV_TC_corr.TC_same_day_diag{1, 4})];
MH131_TCsame = [nanmean(MH131.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH131.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH131.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH131.PV_TC_corr.TC_same_day_diag{1, 4})];
MH132_TCsame = [nanmean(MH132.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH132.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH132.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH132.PV_TC_corr.TC_same_day_diag{1, 4})];
MH138_TCsame = [nanmean(MH138.PV_TC_corr.TC_same_day_diag{1, 1}) nanmean(MH138.PV_TC_corr.TC_same_day_diag{1, 2}) nanmean(MH138.PV_TC_corr.TC_same_day_diag{1, 3}) nanmean(MH138.PV_TC_corr.TC_same_day_diag{1, 4})];
%Normalized TC same day
MH110_TCsame_norm= MH110_TCsame./MH110_TCsame(2);
MH113_TCsame_norm= MH113_TCsame./MH113_TCsame(2);
MH114_TCsame_norm= MH114_TCsame./MH114_TCsame(2);
MH115_TCsame_norm= MH115_TCsame./MH115_TCsame(2);
MH126_TCsame_norm= MH126_TCsame./MH126_TCsame(2);
MH127_TCsame_norm= MH127_TCsame./MH127_TCsame(2);
MH122_TCsame_norm= MH122_TCsame./MH122_TCsame(2);
MH128_TCsame_norm= MH128_TCsame./MH128_TCsame(2);
MH131_TCsame_norm= MH131_TCsame./MH131_TCsame(2);
MH132_TCsame_norm= MH132_TCsame./MH132_TCsame(2);
MH138_TCsame_norm= MH138_TCsame./MH138_TCsame(2);

ss=[1 2 3 4];
ssx = [2 3 4];

subplot(1,2,1)
plot(ss, MH110_TCsame_norm,'-s','LineWidth',1.5)
hold on
plot(ss, MH113_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH114_TCsame_norm,'-s','LineWidth',1.5)
plot(ssx, MH115_TCsame_norm(2:end),'-s','LineWidth',1.5)
plot(ss, MH126_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH127_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH122_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH128_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH131_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH132_TCsame_norm,'-s','LineWidth',1.5)
plot(ss, MH138_TCsame_norm,'-s','LineWidth',1.5)
p = patch('vertices', [2.75, 0; 2.75, 1.3; 3.25, 0; 3.25 1.3], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylim([0 1.3])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128','Location','southeast')
title('TC Same Day (Individual)')
set(gca,'xtick',[1:4])
box off

subplot(1,2,2)
TC_same_norm = vertcat(MH110_TCsame_norm,MH113_TCsame_norm,MH114_TCsame_norm,MH115_TCsame_norm,MH126_TCsame_norm,MH127_TCsame_norm,MH122_TCsame_norm,MH128_TCsame_norm,MH131_TCsame_norm, MH132_TCsame_norm,MH138_TCsame_norm);
TC_same_norm_SEM = nanstd(TC_same_norm)./sqrt(sum(~isnan(TC_same_norm)));
errorbar(ss, nanmean(TC_same_norm), TC_same_norm_SEM,'LineWidth',1.5)
p = patch('vertices', [2.75, 0; 2.75, 1.4; 3.25, 0; 3.25 1.4], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylim([0 1.4])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
title('TC Same Day (Average)')
box off

%%
figure(1)
plot(ss, MH110.PV_TC_corr.meanPV_same_day.AB)
hold on
plot(ss, MH113.PV_TC_corr.meanPV_same_day.AB)
plot(ss, MH114.PV_TC_corr.meanPV_same_day.AB)  
plot(ssx, MH115.PV_TC_corr.meanPV_same_day.AB)
plot(ss, MH126.PV_TC_corr.meanPV_same_day.AB)  
plot(ss, MH127.PV_TC_corr.meanPV_same_day.AB)  
plot(ss, MH122.PV_TC_corr.meanPV_same_day.AB)  
plot(ss, MH128.PV_TC_corr.meanPV_same_day.AB)
plot(ss, MH131.PV_TC_corr.meanPV_same_day.AB(ss))
plot(ss, MH132.PV_TC_corr.meanPV_same_day.AB(ss))
plot(ss, MH138.PV_TC_corr.meanPV_same_day.AB(ss))
ylim([0 0.6])
%%
%normalized PV same day
MH110_PVsame_norm = MH110.PV_TC_corr.meanPV_same_day.AB./MH110.PV_TC_corr.meanPV_same_day.AB(2);
MH113_PVsame_norm = MH113.PV_TC_corr.meanPV_same_day.AB./MH113.PV_TC_corr.meanPV_same_day.AB(2);
MH114_PVsame_norm = MH114.PV_TC_corr.meanPV_same_day.AB./MH114.PV_TC_corr.meanPV_same_day.AB(2);
MH115_PVsame_norm = MH115.PV_TC_corr.meanPV_same_day.AB./MH115.PV_TC_corr.meanPV_same_day.AB(1);
MH126_PVsame_norm = MH126.PV_TC_corr.meanPV_same_day.AB./MH126.PV_TC_corr.meanPV_same_day.AB(2);
MH127_PVsame_norm = MH127.PV_TC_corr.meanPV_same_day.AB./MH127.PV_TC_corr.meanPV_same_day.AB(2);
MH122_PVsame_norm = MH122.PV_TC_corr.meanPV_same_day.AB./MH122.PV_TC_corr.meanPV_same_day.AB(2);
MH128_PVsame_norm = MH128.PV_TC_corr.meanPV_same_day.AB./MH128.PV_TC_corr.meanPV_same_day.AB(2);
MH115_PVsame_norm=[NaN MH115_PVsame_norm(1) MH115_PVsame_norm(2) MH115_PVsame_norm(3)];
%%
figure(2)
subplot(1,2,1)
plot(ss, MH110_PVsame_norm,'-s','LineWidth',1.5)
hold on
plot(ss, MH113_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH114_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH115_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH126_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH127_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH122_PVsame_norm,'-s','LineWidth',1.5)
plot(ss, MH128_PVsame_norm,'-s','LineWidth',1.5)
p = patch('vertices', [2.75, 0; 2.75,2.5; 3.25, 0; 3.25 2.5], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylim([0 2])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128','Location','southeast')
title('PV Same Day (Individual)')
set(gca,'xtick',[1:4])
box off

subplot(1,2,2)
PV_same_norm = vertcat(MH110_PVsame_norm,MH113_PVsame_norm,MH114_PVsame_norm,MH115_PVsame_norm,MH126_PVsame_norm,MH127_PVsame_norm,MH122_PVsame_norm,MH128_PVsame_norm);
PV_same_norm_SEM = nanstd(PV_same_norm)./sqrt(sum(~isnan(PV_same_norm)));
errorbar(ss, nanmean(PV_same_norm), PV_same_norm_SEM,'LineWidth',1.5)
p = patch('vertices', [2.75, 0; 2.75, 2.5; 3.25, 0; 3.25 2.5], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylim([0 2])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
title('PV Same Day (Average)')
box off
%% Neighboring day PV/TC comparison
%PV neighbor matrix (A trials)
MH110_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH110.PV_TC_corr.PVcorr_all_ses.A);
MH110_PV_neighbor_A = diag(MH110_PV_matrix_A,1);
MH113_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH113.PV_TC_corr.PVcorr_all_ses.A);
MH113_PV_neighbor_A = diag(MH113_PV_matrix_A,1);
MH114_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH114.PV_TC_corr.PVcorr_all_ses.A);
MH114_PV_neighbor_A = diag(MH114_PV_matrix_A,1);
MH115_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH115.PV_TC_corr.PVcorr_all_ses.A);
MH115_PV_neighbor_A = diag(MH115_PV_matrix_A,1);
MH126_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH126.PV_TC_corr.PVcorr_all_ses.A);
MH126_PV_neighbor_A = diag(MH126_PV_matrix_A,1);
MH127_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH127.PV_TC_corr.PVcorr_all_ses.A);
MH127_PV_neighbor_A = diag(MH127_PV_matrix_A,1);
MH122_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH122.PV_TC_corr.PVcorr_all_ses.A);
MH122_PV_neighbor_A = diag(MH122_PV_matrix_A,1);
MH128_PV_matrix_A = cellfun(@(x) nanmean(diag(x)),MH128.PV_TC_corr.PVcorr_all_ses.A);
MH128_PV_neighbor_A = diag(MH128_PV_matrix_A,1);

PV_neighbor_A = NaN([4,size(MH110_PV_neighbor_A,1)]);
PV_neighbor_A(1,:) = MH110_PV_neighbor_A;
PV_neighbor_A(2,:) = MH113_PV_neighbor_A;
PV_neighbor_A(3,:) = MH114_PV_neighbor_A;
PV_neighbor_A(4,2)= MH115_PV_neighbor_A(1);
PV_neighbor_A(4,3)= MH115_PV_neighbor_A(2);
PV_neighbor_A(5,:) = MH126_PV_neighbor_A;
PV_neighbor_A(6,:) = MH127_PV_neighbor_A;
PV_neighbor_A(7,:) = MH122_PV_neighbor_A;
PV_neighbor_A(8,:) = MH128_PV_neighbor_A;
PV_neighbor_A_SEM = nanstd(PV_neighbor_A,1)./sqrt(size(PV_neighbor_A,1));
%%
%PV neighbor B trials
MH110_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH110.PV_TC_corr.PVcorr_all_ses.B);
MH110_PV_neighbor_B = diag(MH110_PV_matrix_B,1);
MH113_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH113.PV_TC_corr.PVcorr_all_ses.B);
MH113_PV_neighbor_B = diag(MH113_PV_matrix_B,1);
MH114_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH114.PV_TC_corr.PVcorr_all_ses.B);
MH114_PV_neighbor_B = diag(MH114_PV_matrix_B,1);
MH115_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH115.PV_TC_corr.PVcorr_all_ses.B);
MH115_PV_neighbor_B = diag(MH115_PV_matrix_B,1);
MH126_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH126.PV_TC_corr.PVcorr_all_ses.B);
MH126_PV_neighbor_B = diag(MH126_PV_matrix_B,1);
MH127_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH127.PV_TC_corr.PVcorr_all_ses.B);
MH127_PV_neighbor_B = diag(MH127_PV_matrix_B,1);
MH122_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH122.PV_TC_corr.PVcorr_all_ses.B);
MH122_PV_neighbor_B = diag(MH122_PV_matrix_B,1);
MH128_PV_matrix_B = cellfun(@(x) nanmean(diag(x)),MH128.PV_TC_corr.PVcorr_all_ses.B);
MH128_PV_neighbor_B = diag(MH128_PV_matrix_B,1);

PV_neighbor_B = NaN([4,size(MH110_PV_neighbor_B,1)]);
PV_neighbor_B(1,:) = MH110_PV_neighbor_B;
PV_neighbor_B(2,:) = MH113_PV_neighbor_B;
PV_neighbor_B(3,:) = MH114_PV_neighbor_B;
PV_neighbor_B(4,2)= MH115_PV_neighbor_B(1);
PV_neighbor_B(4,3)= MH115_PV_neighbor_B(2);
PV_neighbor_B(5,:) = MH126_PV_neighbor_B;
PV_neighbor_B(6,:) = MH127_PV_neighbor_B;
PV_neighbor_B(7,:) = MH122_PV_neighbor_B;
PV_neighbor_B(8,:) = MH128_PV_neighbor_B;
PV_neighbor_B_SEM = nanstd(PV_neighbor_B,1)./sqrt(size(PV_neighbor_B,1));
%%
%TC neighbor matrix (A trials)
MH110_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH110.PV_TC_corr.TCcorr_all_ses.ts.A);
MH110_TC_neighbor_A = diag(MH110_TC_matrix_A,1);
MH113_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH113.PV_TC_corr.TCcorr_all_ses.ts.A);
MH113_TC_neighbor_A = diag(MH113_TC_matrix_A,1);
MH114_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH114.PV_TC_corr.TCcorr_all_ses.ts.A);
MH114_TC_neighbor_A = diag(MH114_TC_matrix_A,1);
MH115_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH115.PV_TC_corr.TCcorr_all_ses.ts.A);
MH115_TC_neighbor_A = diag(MH115_TC_matrix_A,1);
MH126_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH126.PV_TC_corr.TCcorr_all_ses.ts.A);
MH126_TC_neighbor_A = diag(MH126_TC_matrix_A,1);
MH127_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH127.PV_TC_corr.TCcorr_all_ses.ts.A);
MH127_TC_neighbor_A = diag(MH127_TC_matrix_A,1);
MH122_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH122.PV_TC_corr.TCcorr_all_ses.ts.A);
MH122_TC_neighbor_A = diag(MH122_TC_matrix_A,1);
MH128_TC_matrix_A = cellfun(@(x) nanmean(diag(x)),MH128.PV_TC_corr.TCcorr_all_ses.ts.A);
MH128_TC_neighbor_A = diag(MH128_TC_matrix_A,1);


TC_neighbor_A = NaN([4,size(MH110_TC_neighbor_A,1)]);
TC_neighbor_A(1,:) = MH110_TC_neighbor_A;
TC_neighbor_A(2,:) = MH113_TC_neighbor_A;
TC_neighbor_A(3,:) = MH114_TC_neighbor_A;
TC_neighbor_A(4,2)= MH115_TC_neighbor_A(1);
TC_neighbor_A(4,3)= MH115_TC_neighbor_A(2);
TC_neighbor_A(5,:) = MH126_TC_neighbor_A;
TC_neighbor_A(6,:) = MH127_TC_neighbor_A;
TC_neighbor_A(7,:) = MH122_TC_neighbor_A;
TC_neighbor_A(8,:) = MH128_TC_neighbor_A;
TC_neighbor_A_SEM = nanstd(TC_neighbor_A,1)./sqrt(size(TC_neighbor_A,1));

%%
%TC neighbor B Trials
MH110_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH110.PV_TC_corr.TCcorr_all_ses.ts.B);
MH110_TC_neighbor_B = diag(MH110_TC_matrix_B,1);
MH113_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH113.PV_TC_corr.TCcorr_all_ses.ts.B);
MH113_TC_neighbor_B = diag(MH113_TC_matrix_B,1);
MH114_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH114.PV_TC_corr.TCcorr_all_ses.ts.B);
MH114_TC_neighbor_B = diag(MH114_TC_matrix_B,1);
MH115_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH115.PV_TC_corr.TCcorr_all_ses.ts.B);
MH115_TC_neighbor_B = diag(MH115_TC_matrix_B,1);
MH126_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH126.PV_TC_corr.TCcorr_all_ses.ts.B);
MH126_TC_neighbor_B = diag(MH126_TC_matrix_B,1);
MH127_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH127.PV_TC_corr.TCcorr_all_ses.ts.B);
MH127_TC_neighbor_B = diag(MH127_TC_matrix_B,1);
MH122_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH122.PV_TC_corr.TCcorr_all_ses.ts.B);
MH122_TC_neighbor_B = diag(MH122_TC_matrix_B,1);
MH128_TC_matrix_B = cellfun(@(x) nanmean(diag(x)),MH128.PV_TC_corr.TCcorr_all_ses.ts.B);
MH128_TC_neighbor_B = diag(MH128_TC_matrix_B,1);

TC_neighbor_B = NaN([4,size(MH110_TC_neighbor_B,1)]);
TC_neighbor_B(1,:) = MH110_TC_neighbor_B;
TC_neighbor_B(2,:) = MH113_TC_neighbor_B;
TC_neighbor_B(3,:) = MH114_TC_neighbor_B;
TC_neighbor_B(4,2)= MH115_TC_neighbor_B(1);
TC_neighbor_B(4,3)= MH115_TC_neighbor_B(2);
TC_neighbor_B(5,:) = MH126_TC_neighbor_B;
TC_neighbor_B(6,:) = MH127_TC_neighbor_B;
TC_neighbor_B(7,:) = MH122_TC_neighbor_B;
TC_neighbor_B(8,:) = MH128_TC_neighbor_B;
TC_neighbor_B_SEM = nanstd(TC_neighbor_B,1)./sqrt(size(TC_neighbor_B,1));
%% Plotting
figure(3)
valid = [1 2 3];
subplot(1,2,1)
hold on
axis square
errorbar(valid,nanmean(PV_neighbor_A),PV_neighbor_A_SEM,'LineStyle', '-','LineWidth',1.5)
hold on
errorbar(valid, nanmean(PV_neighbor_B),PV_neighbor_B_SEM,'LineStyle', '-','LineWidth',1.5)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
legend('A Trials','B Trials')
ylabel('Correlation Score')
xlabel('Session Comparison')
xticks([1 2 3])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day')
ax=gca;
axis(ax, 'tight')
xlim(ax, xlim(ax) + [-1,1]*range(xlim(ax)).* 0.1)
ylim([0 1])

subplot(1,2,2)
hold on
axis square
errorbar(valid,nanmean(TC_neighbor_A),TC_neighbor_A_SEM,'LineStyle', '-','LineWidth',1.5)
hold on
errorbar(valid,nanmean(TC_neighbor_B),TC_neighbor_B_SEM,'LineStyle', '-','LineWidth',1.5)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylabel('Correlation Score')
xlabel('Session Comparison')
legend('A Trials','B Trials')
xticks([1 2 3 ])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day')
ax=gca;
axis(ax, 'tight')
xlim(ax, xlim(ax) + [-1,1]*range(xlim(ax)).* 0.1)
ylim([0 1])

figure(6)
subplot(2,2,1)
for ii=1:size(PV_neighbor_A,1)
    if ii~=4
        plot(valid, PV_neighbor_A(ii,:),'-s','LineWidth',1.5)
        hold on
    else
        plot([2 3], PV_neighbor_A(ii,2:end),'-s','LineWidth',1.5)
    end
end
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
xticks([1 2 3])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day - A Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
%legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128')
box off

subplot(2,2,3)
for ii=1:size(PV_neighbor_B,1)
    if ii~=4
        plot(valid, PV_neighbor_B(ii,:),'-s','LineWidth',1.5)
        hold on
    else
        plot([2 3], PV_neighbor_B(ii,2:end),'-s','LineWidth',1.5)
    end
end
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
xticks([1 2 3])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day - B Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
%legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128')
box off

subplot(2,2,2)
for ii=1:size(TC_neighbor_A,1)
    if ii~=4
        plot(valid, TC_neighbor_A(ii,:),'-s','LineWidth',1.5)
        hold on
    else
        plot([2 3], TC_neighbor_A(ii,2:end),'-s','LineWidth',1.5)
    end
end
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
xticks([1 2 3])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day - A Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
%legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128')
box off

subplot(2,2,4)
for ii=1:size(TC_neighbor_B,1)
    if ii~=4
        plot(valid, TC_neighbor_B(ii,:),'-s','LineWidth',1.5)
        hold on
    else
        plot([2 3], TC_neighbor_B(ii,2:end),'-s','LineWidth',1.5)
    end
end
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
xticks([1 2 3])
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day - B Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
%legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128')
box off

%need to plot some heat maps showing slight remapping between neighbors
%% loading in place cell structures for control and silencing session
MH110_ca_ctrl = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_29_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH110_ca_cno = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_30_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH113_ca_ctrl = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_26_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH113_ca_cno = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_27_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH114_ca_ctrl = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_27_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH114_ca_cno = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_28_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH115_ca_ctrl = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_10_Random_Saline-001_1\output\28_Nov_2023_ca_analysis.mat','Place_cell');
MH115_ca_cno = load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_11_Random_CNO-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH126_ca_ctrl= load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_04_Random-001_3\output\11_Jun_2024_ca_analysis.mat','Place_cell');
MH126_ca_cno=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_05_Random_CNO-001_4\output\11_Jun_2024_ca_analysis.mat','Place_cell');
MH127_ca_ctrl=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_03_Random_Saline-001_6\output\10_Jun_2024_ca_analysis.mat','Place_cell');
MH127_ca_cno=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_04_Random_CNO-001_7\output\10_Jun_2024_ca_analysis.mat','Place_cell');
MH122_ca_ctrl=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_04_Random_Saline-001_4\output\18_Jun_2024_ca_analysis.mat','Place_cell');
MH122_ca_cno=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_05_Random_CNO-001_5\output\18_Jun_2024_ca_analysis.mat','Place_cell');
MH128_ca_ctrl=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_07_Random_Saline-001_5\output\19_Jun_2024_ca_analysis.mat','Place_cell');
MH128_ca_cno=load('R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_08_Random_CNO-001_6\output\19_Jun_2024_ca_analysis.mat','Place_cell');
%%
%structure for 4 is all A trials, structure 5 is all B trials
%spatial information
%creating spatial information in A trials ONLY
crossMouse_spatial_tuning.si.a.num(1,1) = size(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(2,1) = size(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(3,1) = size(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(4,1) = size(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.a.num(1,2) = size(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(2,2) = size(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(3,2) = size(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.num(4,2) = size(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.a.frac(1,1) = sum(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(2,1) = sum(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(3,1) = sum(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(4,1) = sum(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.a.frac(1,2) = sum(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(2,2) = sum(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(3,2) = sum(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.a.frac(4,2) = sum(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs)/size(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.a.all{1,1}=max(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{2,1}=max(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{3,1}=max(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{4,1}=max(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);

crossMouse_spatial_tuning.si.a.all{1,2}=max(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{2,2}=max(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{3,2}=max(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.a.all{4,2}=max(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs);

crossMouse_spatial_tuning.si.a.sig{1,1}=crossMouse_spatial_tuning.si.a.all{1,1}(find(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{2,1}=crossMouse_spatial_tuning.si.a.all{2,1}(find(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{3,1}=crossMouse_spatial_tuning.si.a.all{3,1}(find(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{4,1}=crossMouse_spatial_tuning.si.a.all{4,1}(find(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));

crossMouse_spatial_tuning.si.a.sig{1,2}=crossMouse_spatial_tuning.si.a.all{1,2}(find(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{2,2}=crossMouse_spatial_tuning.si.a.all{2,2}(find(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{3,2}=crossMouse_spatial_tuning.si.a.all{3,2}(find(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.a.sig{4,2}=crossMouse_spatial_tuning.si.a.all{4,2}(find(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));


%creating spatial information for B trials only
crossMouse_spatial_tuning.si.b.num(1,1) = size(MH110_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(2,1) = size(MH113_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(3,1) = size(MH114_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(4,1) = size(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.b.num(1,2) = size(MH110_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(2,2) = size(MH113_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(3,2) = size(MH114_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.num(4,2) = size(MH115_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.b.frac(1,1) = sum(MH110_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH110_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(2,1) = sum(MH113_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH113_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(3,1) = sum(MH114_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH114_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(4,1) = sum(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.b.frac(1,2) = sum(MH110_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH110_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(2,2) = sum(MH113_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH113_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(3,2) = sum(MH114_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH114_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);
crossMouse_spatial_tuning.si.b.frac(4,2) = sum(MH115_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs)/size(MH115_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs,2);

crossMouse_spatial_tuning.si.b.all{1,1}=max(MH110_ca_ctrl.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{2,1}=max(MH113_ca_ctrl.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{3,1}=max(MH114_ca_ctrl.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{4,1}=max(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);

crossMouse_spatial_tuning.si.b.all{1,2}=max(MH110_ca_cno.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{2,2}=max(MH113_ca_cno.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{3,2}=max(MH114_ca_cno.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);
crossMouse_spatial_tuning.si.b.all{4,2}=max(MH115_ca_cno.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs);

crossMouse_spatial_tuning.si.b.sig{1,1}=crossMouse_spatial_tuning.si.a.all{1,1}(find(MH110_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{2,1}=crossMouse_spatial_tuning.si.a.all{2,1}(find(MH113_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{3,1}=crossMouse_spatial_tuning.si.a.all{3,1}(find(MH114_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{4,1}=crossMouse_spatial_tuning.si.a.all{4,1}(find(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));

crossMouse_spatial_tuning.si.b.sig{1,2}=crossMouse_spatial_tuning.si.a.all{1,2}(find(MH110_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{2,2}=crossMouse_spatial_tuning.si.a.all{2,2}(find(MH113_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{3,2}=crossMouse_spatial_tuning.si.a.all{3,2}(find(MH114_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
crossMouse_spatial_tuning.si.b.sig{4,2}=crossMouse_spatial_tuning.si.a.all{4,2}(find(MH115_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs));
%%
%tuning specificity
%creating tuning specificity in A trials ONLY
crossMouse_spatial_tuning.ts.a.num(1,1) = size(MH110_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(2,1) = size(MH113_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(3,1) = size(MH114_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(4,1) = size(MH115_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.a.num(1,2) = size(MH110_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(2,2) = size(MH113_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(3,2) = size(MH114_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.num(4,2) = size(MH115_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.a.frac(1,1) = sum(MH110_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH110_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(2,1) = sum(MH113_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH113_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(3,1) = sum(MH114_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH114_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(4,1) = sum(MH115_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH115_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.a.frac(1,2) = sum(MH110_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH110_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(2,2) = sum(MH113_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH113_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(3,2) = sum(MH114_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH114_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.a.frac(4,2) = sum(MH115_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI)/size(MH115_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.a.all{1,1}=MH110_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{2,1}=MH113_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{3,1}=MH114_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{4,1}=MH115_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;

crossMouse_spatial_tuning.ts.a.all{1,2}=MH110_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{2,2}=MH113_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{3,2}=MH114_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.a.all{4,2}=MH115_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;

crossMouse_spatial_tuning.ts.a.sig{1,1}=crossMouse_spatial_tuning.ts.a.all{1,1}(find(MH110_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{2,1}=crossMouse_spatial_tuning.ts.a.all{2,1}(find(MH113_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{3,1}=crossMouse_spatial_tuning.ts.a.all{3,1}(find(MH114_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{4,1}=crossMouse_spatial_tuning.ts.a.all{4,1}(find(MH115_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));

crossMouse_spatial_tuning.ts.a.sig{1,2}=crossMouse_spatial_tuning.ts.a.all{1,2}(find(MH110_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{2,2}=crossMouse_spatial_tuning.ts.a.all{2,2}(find(MH113_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{3,2}=crossMouse_spatial_tuning.ts.a.all{3,2}(find(MH114_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.a.sig{4,2}=crossMouse_spatial_tuning.ts.a.all{4,2}(find(MH115_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI));

%creating tuning specificity in B trials ONLY
crossMouse_spatial_tuning.ts.b.num(1,1) = size(MH110_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(2,1) = size(MH113_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(3,1) = size(MH114_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(4,1) = size(MH115_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.b.num(1,2) = size(MH110_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(2,2) = size(MH113_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(3,2) = size(MH114_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.num(4,2) = size(MH115_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.b.frac(1,1) = sum(MH110_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH110_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(2,1) = sum(MH113_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH113_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(3,1) = sum(MH114_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH114_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(4,1) = sum(MH115_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH115_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.b.frac(1,2) = sum(MH110_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH110_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(2,2) = sum(MH113_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH113_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(3,2) = sum(MH114_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH114_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);
crossMouse_spatial_tuning.ts.b.frac(4,2) = sum(MH115_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI)/size(MH115_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity,2);

crossMouse_spatial_tuning.ts.b.all{1,1}=MH110_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{2,1}=MH113_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{3,1}=MH114_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{4,1}=MH115_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;

crossMouse_spatial_tuning.ts.b.all{1,2}=MH110_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{2,2}=MH113_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{3,2}=MH114_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
crossMouse_spatial_tuning.ts.b.all{4,2}=MH115_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;

crossMouse_spatial_tuning.ts.b.sig{1,1}=crossMouse_spatial_tuning.ts.a.all{1,1}(find(MH110_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{2,1}=crossMouse_spatial_tuning.ts.a.all{2,1}(find(MH113_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{3,1}=crossMouse_spatial_tuning.ts.a.all{3,1}(find(MH114_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{4,1}=crossMouse_spatial_tuning.ts.a.all{4,1}(find(MH115_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));

crossMouse_spatial_tuning.ts.b.sig{1,2}=crossMouse_spatial_tuning.ts.a.all{1,2}(find(MH110_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{2,2}=crossMouse_spatial_tuning.ts.a.all{2,2}(find(MH113_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{3,2}=crossMouse_spatial_tuning.ts.a.all{3,2}(find(MH114_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));
crossMouse_spatial_tuning.ts.b.sig{4,2}=crossMouse_spatial_tuning.ts.a.all{4,2}(find(MH115_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI));

%% plotting place cell scores 

%spatial information scores, 4 plots one with A trials and one with B for
%all cells and significantly tuned
x=1:2
sessions={'Control';'Silence'};

ctrl=horzcat(crossMouse_spatial_tuning.si.a.all{1,1},crossMouse_spatial_tuning.si.a.all{2,1},crossMouse_spatial_tuning.si.a.all{3,1},crossMouse_spatial_tuning.si.a.all{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.si.a.all{1,2},crossMouse_spatial_tuning.si.a.all{2,2},crossMouse_spatial_tuning.si.a.all{3,2},crossMouse_spatial_tuning.si.a.all{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];


figure(4)
subplot(2,2,1)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - A Trial (All)');
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.si.b.all{1,1},crossMouse_spatial_tuning.si.b.all{2,1},crossMouse_spatial_tuning.si.b.all{3,1},crossMouse_spatial_tuning.si.b.all{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.si.b.all{1,2},crossMouse_spatial_tuning.si.b.all{2,2},crossMouse_spatial_tuning.si.b.all{3,2},crossMouse_spatial_tuning.si.b.all{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
set(gca,'xtick',[1:2],'xticklabel',sessions)

subplot(2,2,2)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - B Trial (All)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.si.a.sig{1,1},crossMouse_spatial_tuning.si.a.sig{2,1},crossMouse_spatial_tuning.si.a.sig{3,1},crossMouse_spatial_tuning.si.a.sig{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.si.a.sig{1,2},crossMouse_spatial_tuning.si.a.sig{2,2},crossMouse_spatial_tuning.si.a.sig{3,2},crossMouse_spatial_tuning.si.a.sig{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

subplot(2,2,3)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - A Trial (Tuned)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.si.b.sig{1,1},crossMouse_spatial_tuning.si.b.sig{2,1},crossMouse_spatial_tuning.si.b.sig{3,1},crossMouse_spatial_tuning.si.b.sig{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.si.b.sig{1,2},crossMouse_spatial_tuning.si.b.sig{2,2},crossMouse_spatial_tuning.si.b.sig{3,2},crossMouse_spatial_tuning.si.b.sig{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

subplot(2,2,4)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - B Trial (Tuned)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off
%%
%tuning specificity scores, 4 plots one with A trials and one with B for
%all cells and significantly tuned
ctrl=horzcat(crossMouse_spatial_tuning.ts.a.all{1,1},crossMouse_spatial_tuning.ts.a.all{2,1},crossMouse_spatial_tuning.ts.a.all{3,1},crossMouse_spatial_tuning.ts.a.all{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.ts.a.all{1,2},crossMouse_spatial_tuning.ts.a.all{2,2},crossMouse_spatial_tuning.ts.a.all{3,2},crossMouse_spatial_tuning.ts.a.all{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

figure(5)
subplot(2,2,1)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - A Trial (All)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.ts.b.all{1,1},crossMouse_spatial_tuning.ts.b.all{2,1},crossMouse_spatial_tuning.ts.b.all{3,1},crossMouse_spatial_tuning.ts.b.all{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.ts.b.all{1,2},crossMouse_spatial_tuning.ts.b.all{2,2},crossMouse_spatial_tuning.ts.b.all{3,2},crossMouse_spatial_tuning.ts.b.all{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

subplot(2,2,2)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - B Trial (All)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.ts.a.sig{1,1},crossMouse_spatial_tuning.ts.a.sig{2,1},crossMouse_spatial_tuning.ts.a.sig{3,1},crossMouse_spatial_tuning.ts.a.sig{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.ts.a.sig{1,2},crossMouse_spatial_tuning.ts.a.sig{2,2},crossMouse_spatial_tuning.ts.a.sig{3,2},crossMouse_spatial_tuning.ts.a.sig{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

subplot(2,2,3)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - A Trial (Tuned)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=horzcat(crossMouse_spatial_tuning.ts.b.sig{1,1},crossMouse_spatial_tuning.ts.b.sig{2,1},crossMouse_spatial_tuning.ts.b.sig{3,1},crossMouse_spatial_tuning.ts.b.sig{4,1});
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=horzcat(crossMouse_spatial_tuning.ts.b.sig{1,2},crossMouse_spatial_tuning.ts.b.sig{2,2},crossMouse_spatial_tuning.ts.b.sig{3,2},crossMouse_spatial_tuning.ts.b.sig{4,2});
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];

subplot(2,2,4)
bar(x,[nanmean(ctrl) nanmean(cno)])
hold on
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - B Trial (Tuned)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off
%% same day correlation maps

subplot(2,4,1)
imagesc(MH110.PV_TC_corr.PVcorr_all_same_day{1, 2})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH110 Control')
xlabel('Spatial Bin')
ylabel('Spatial Bin')
subplot(2,4,2)
imagesc(MH110.PV_TC_corr.PVcorr_all_same_day{1, 3})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH110 Silence')
xlabel('Spatial Bin')
ylabel('Spatial Bin')

subplot(2,4,3)
imagesc(MH113.PV_TC_corr.PVcorr_all_same_day{1, 2})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH113 Control')
xlabel('Spatial Bin')
ylabel('Spatial Bin')
subplot(2,4,4)
imagesc(MH113.PV_TC_corr.PVcorr_all_same_day{1, 3})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH113 Silence')
xlabel('Spatial Bin')
ylabel('Spatial Bin')

subplot(2,4,5)
imagesc(MH114.PV_TC_corr.PVcorr_all_same_day{1, 2})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH114 Control')
xlabel('Spatial Bin')
ylabel('Spatial Bin')
subplot(2,4,6)
imagesc(MH114.PV_TC_corr.PVcorr_all_same_day{1, 3})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH114 Silence')
xlabel('Spatial Bin')
ylabel('Spatial Bin')

subplot(2,4,7)
imagesc(MH115.PV_TC_corr.PVcorr_all_same_day{1, 1})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH115 Control')
xlabel('Spatial Bin')
ylabel('Spatial Bin')
subplot(2,4,8)
imagesc(MH115.PV_TC_corr.PVcorr_all_same_day{1, 2})
colormap(gca,cmap_purple);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
title('MH115 Silence')
xlabel('Spatial Bin')
ylabel('Spatial Bin')
%% correlation map between days (A trials)
subplot(2,4,1)
imagesc(MH110.PV_TC_corr.PVcorr_all_ses.A{1, 2});
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH110 Ctrl D1 vs Ctrl D2')
subplot(2,4,2)
imagesc(MH110.PV_TC_corr.PVcorr_all_ses.A{2, 3}  );
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH110 Ctrl D2 vs Silence')
subplot(2,4,3)
imagesc(MH113.PV_TC_corr.PVcorr_all_ses.A{1, 2});
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH113 Ctrl D1 vs Ctrl D2')
subplot(2,4,4)
imagesc(MH113.PV_TC_corr.PVcorr_all_ses.A{2, 3}  );
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH113 Ctrl D2 vs Silence')
subplot(2,4,5)
imagesc(MH114.PV_TC_corr.PVcorr_all_ses.A{1, 2});
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH114 Ctrl D1 vs Ctrl D2')
subplot(2,4,6)
imagesc(MH114.PV_TC_corr.PVcorr_all_ses.A{2, 3}  );
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH114 Ctrl D2 vs Silence')

subplot(2,4,8)
imagesc(MH115.PV_TC_corr.PVcorr_all_ses.A{1, 2}  );
colormap(gca,cmap_blue);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH115 Ctrl D2 vs Silence')
set(gcf,'position',[500,500,900,400])
%%
subplot(2,4,1)
imagesc(MH110.PV_TC_corr.PVcorr_all_ses.B{1, 2});
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH110 Ctrl D1 vs Ctrl D2')
subplot(2,4,2)
imagesc(MH110.PV_TC_corr.PVcorr_all_ses.B{2, 3}  );
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH110 Ctrl D2 vs Silence')
subplot(2,4,3)
imagesc(MH113.PV_TC_corr.PVcorr_all_ses.B{1, 2});
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH113 Ctrl D1 vs Ctrl D2')
subplot(2,4,4)
imagesc(MH113.PV_TC_corr.PVcorr_all_ses.B{2, 3}  );
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH113 Ctrl D2 vs Silence')
subplot(2,4,5)
imagesc(MH114.PV_TC_corr.PVcorr_all_ses.B{1, 2});
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH114 Ctrl D1 vs Ctrl D2')
subplot(2,4,6)
imagesc(MH114.PV_TC_corr.PVcorr_all_ses.B{2, 3}  );
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH114 Ctrl D2 vs Silence')

subplot(2,4,8)
imagesc(MH115.PV_TC_corr.PVcorr_all_ses.B{1, 2}  );
colormap(gca,cmap_red);
caxis([0 1]);
set(gca,'XTick',[], 'YTick', [])
axis square
xlabel('Spatial Bin')
ylabel('Spatial Bin')
title('MH115 Ctrl D2 vs Silence')
set(gcf,'position',[500,500,900,400])
%% example heat maps (go back to deal with colors for A and B with cbrewer)
subplot(2,4,1)
imagesc(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_tuning_curve_sorted  )
colormap(gca,cmap_blue);
title('Control: All(A Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,2)
imagesc(MH115_ca_ctrl.Place_cell{1, 4}.Spatial_tuning_curve_sorted(find(ismember(MH115_ca_ctrl.Place_cell{1, 4}.ROI_Spatial_tuning_sorted,MH115_ca_ctrl.Place_cell{1, 4}.Tuned_ROI)),:));
colormap(gca,cmap_blue);
title('Control: Tuned(A Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,5)
imagesc(MH115_ca_cno.Place_cell{1, 4}.Spatial_tuning_curve_sorted  )
colormap(gca,cmap_blue);
title('Silence: All(A Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,6)
imagesc(MH115_ca_cno.Place_cell{1, 4}.Spatial_tuning_curve_sorted(find(ismember(MH115_ca_cno.Place_cell{1, 4}.ROI_Spatial_tuning_sorted,MH115_ca_cno.Place_cell{1, 4}.Tuned_ROI)),:));
colormap(gca,cmap_blue);
title('Silence: Tuned(A Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);

%B trials
subplot(2,4,3)
imagesc(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_tuning_curve_sorted  )
colormap(gca,cmap_red);
title('Control: All(B Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,4)
imagesc(MH115_ca_ctrl.Place_cell{1, 5}.Spatial_tuning_curve_sorted(find(ismember(MH115_ca_ctrl.Place_cell{1, 5}.ROI_Spatial_tuning_sorted,MH115_ca_ctrl.Place_cell{1, 5}.Tuned_ROI)),:));
colormap(gca,cmap_red);
title('Control: Tuned(B Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,7)
imagesc(MH115_ca_cno.Place_cell{1, 5}.Spatial_tuning_curve_sorted  )
colormap(gca,cmap_red);
title('Silence: All(B Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);
subplot(2,4,8)
imagesc(MH115_ca_cno.Place_cell{1, 5}.Spatial_tuning_curve_sorted(find(ismember(MH115_ca_cno.Place_cell{1, 5}.ROI_Spatial_tuning_sorted,MH115_ca_cno.Place_cell{1, 5}.Tuned_ROI)),:));
colormap(gca,cmap_red);
title('Silence: Tuned(B Trial)')
xlabel('Spatial Bin')
ylabel('ROI')
caxis([0 1]);



% set(gcf,'position',[500,500,900,400])
% %% Remapping plots
% %Control (A trials) 1,2
% [~,ctrlA_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 1},[],2);
% [~,ctrlA_order] = sort(ctrlA_peak);
% 
% S1_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 1}(ctrlA_order,:);
% S2_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 2}(ctrlA_order,:);
% 
% %Control (B trials) 1,2
% [~,ctrlB_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 1},[],2);
% [~,ctrlB_order] = sort(ctrlB_peak);
% 
% S1_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 1}(ctrlB_order,:);
% S2_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2}(ctrlB_order,:);
% 
% %Silence trials (A trials) 2,3
% [~,cnoA_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 2},[],2);
% [~,cnoA_order] = sort(cnoA_peak);
% 
% S3_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 2}(cnoA_order,:);
% S4_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 3}(cnoA_order,:);
% 
% %Silence trials (B trials) 2,3 
% [~,cnoB_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2},[],2);
% [~,cnoB_order] = sort(cnoB_peak);
% 
% S3_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2}(cnoB_order,:);
% S4_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 3}(cnoB_order,:);

% %%
% cmap_blue=cbrewer('seq', 'Blues', 16);
% cmap_red=cbrewer('seq', 'Reds', 16);
% 
% notnan = find(~isnan(S1_A(:,1)));
% notnan_ind = notnan(1);
% figure(1)
% subplot(2,4,1)
% imagesc(S1_A(notnan_ind:size(S1_A,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_blue);
% subplot(2,4,2)
% imagesc(S2_A(notnan_ind:size(S1_A,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_blue);
% 
% notnan = find(~isnan(S3_A(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,5)
% imagesc(S3_A(notnan_ind:size(S3_A,1),:))
% colormap(gca,cmap_blue);
% ylabel('ROI')
% xlabel('Spatial Bin')
% subplot(2,4,6)
% imagesc(S4_A(notnan_ind:size(S3_A,1),:))
% colormap(gca,cmap_blue);
% ylabel('ROI')
% xlabel('Spatial Bin')
% 
% notnan = find(~isnan(S1_B(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,3)
% imagesc(S1_B(notnan_ind:size(S1_B,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_red);
% subplot(2,4,4)
% imagesc(S2_B(notnan_ind:size(S1_B,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_red);
% 
% notnan = find(~isnan(S3_B(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,7)
% imagesc(S3_B(notnan_ind:size(S3_B,1),:))
% colormap(gca,cmap_red);
% ylabel('ROI')
% xlabel('Spatial Bin')
% subplot(2,4,8)
% imagesc(S4_B(notnan_ind:size(S3_B,1),:))
% colormap(gca,cmap_red);
% ylabel('ROI')
% xlabel('Spatial Bin')
% 
% set(gcf,'position',[50,50,800,500])
%%
cmap_blue=cbrewer('seq', 'Blues', 16);
cmap_red=cbrewer('seq', 'Reds', 16);
%%
mouse_files = {'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update\tuned_fractions.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update\tuned_fractions.mat'};
%%
frac_A= NaN(length(mouse_files),4)
frac_B= NaN(length(mouse_files),4)
frac_AB= NaN(length(mouse_files),4)
frac_neither= NaN(length(mouse_files),4)

for mouse=1:length(mouse_files)
    load(mouse_files{mouse})
    if mouse==4 %exception for MH115 because of missing session
        frac_A(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,1) 
        frac_B(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,2) 
        frac_AB(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,3)
        frac_neither(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,4)
    else
        frac_A(mouse,:)=tuned_fractions.fracTuned_si_filt(:,1) 
        frac_B(mouse,:)=tuned_fractions.fracTuned_si_filt(:,2) 
        frac_AB(mouse,:)=tuned_fractions.fracTuned_si_filt(:,3)
        frac_neither(mouse,:)=tuned_fractions.fracTuned_si_filt(:,4)
    end
end
%%  
x=[1 2 3 4];
color_vec(1,:) = [139, 0, 139]/255; %magenta
color_vec(2,:) = [65,105,225]/255; %blue 
color_vec(3,:) = [220,20,60]/255;%red

A_SEM = nanstd(frac_A)./sqrt(sum(~isnan(frac_A)));
B_SEM = nanstd(frac_B)./sqrt(sum(~isnan(frac_B)));
AB_SEM = nanstd(frac_AB)./sqrt(sum(~isnan(frac_AB)));
N_SEM = nanstd(frac_neither)./sqrt(sum(~isnan(frac_neither)));

subplot(4,2,1)
errorbar(x,nanmean(frac_A),A_SEM,'LineWidth',1.5','Color',color_vec(2,:))
title('Fraction of A Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(4,2,3)
errorbar(x,nanmean(frac_B),B_SEM,'LineWidth',1.5','Color',color_vec(3,:))
title('Fraction of B Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(4,2,5)
errorbar(x,nanmean(frac_AB),AB_SEM,'LineWidth',1.5','Color',color_vec(1,:))
title('Fraction of AB Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(4,2,7)
errorbar(x,nanmean(frac_neither),N_SEM,'LineWidth',1.5','Color',[.7 .7 .7])
title('Fraction of Neither Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.8; 3.25, 0; 3.25 0.8], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(4,2,2)
for ii=1:size(frac_A,1)
    if ii==4
        plot([2 3 4],frac_A(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_A(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
legend('MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128')
title('Fraction of A Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylabel('Fraction of Cells')
box off

subplot(4,2,4)
for ii=1:size(frac_B,1)
    if ii==4
        plot([2 3 4],frac_B(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_B(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
title('Fraction of B Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylabel('Fraction of Cells')
box off

subplot(4,2,6)
for ii=1:size(frac_AB,1)
    if ii==4
        plot([2 3 4],frac_AB(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_AB(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
title('Fraction of AB Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylabel('Fraction of Cells')
box off

subplot(4,2,8)
for ii=1:size(frac_neither,1)
    if ii==4
        plot([2 3 4],frac_neither(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_neither(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
title('Fraction of Neither Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 0.8; 3.25, 0; 3.25 0.8], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
ylabel('Fraction of Cells')
box off