%% Code produces plots for LEC silencing days - must be formatted from global remapping updates in the following order S1- Saline, S2 - Saline, S3 - CNO, S4- Saline.
%If there are sessions after these first 4 that is ok and code will run
%Manually add in directories for PV_TC_corr + update "mice" variable (need
%all 4 sessions for PV/TC)

%Manually add in tuned fractions and place cell variables in later
%sections. For these you only need S2 and S3 so more mice may fit this
%criteria without errors - update directories and mouse variables here.

%%PV same day
% List of mice to be included
mice={'MH110','MH113','MH114','MH126','MH127','MH122','MH128','MH131','MH132','MH137','MH138'};

MH110 = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update\PV_TC_corr.mat');
MH113 = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update\PV_TC_corr.mat');
MH114 = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes\PV_TC_corr.mat');
MH115 = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update\PV_TC_corr.mat'); 

MH126=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update\PV_TC_corr.mat');
MH127=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\PV_TC_corr.mat');
MH122=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update\PV_TC_corr.mat');
MH128=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update\PV_TC_corr.mat');

MH131=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH132=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
%MH136=
MH137=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');
MH138=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\crossSession_update\PV_TC_corr.mat');

% cmap_blue=cbrewer('seq', 'Blues', 16);
% cmap_red=cbrewer('seq', 'Reds', 16);
% cmap_purple=cbrewer('seq','Purples',16);

magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.97 0.58 0.11];
purple= (magenta + blue) / 2;
magenta_light = magenta + 0.50 * (1 - magenta);
blue_light = blue + 0.50 * (1 - blue);
purple_light= purple + 0.50 * (1 - purple);

cmap_yellow=whiteToColorMap(yellow);
cmap_blue=whiteToColorMap(blue);
cmap_magenta=whiteToColorMap(magenta);
cmap_purple=whiteToColorMap(purple);

ss=[1 2 3 4]; %This is used in plotting as well as indexing the apporopriate sessions for any mice that had more than 4 sessions registered for cross day analysis
ss_x1=[2 3 4]; %for MH115 exception of no sess 1
ss_x2=[1 3 4]; %for MH136 exception of no sess 2

savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\5'; % Path to save directory

%% Calculating normalized TC same day scores with graphs
legend_string=["CNO", mice];
TC_same=NaN(length(mice),length(ss));
TC_same_norm=NaN(length(mice),length(ss)); %normalized by session 2 (saline day before cno day)
for i=1:length(mice)
    mouse = mice{i};
    mouse_TC=eval([mouse '.PV_TC_corr.TC_same_day_diag']);
    TC_same(i,:)= [nanmean(mouse_TC{1, 1}) nanmean(mouse_TC{1, 2}) nanmean(mouse_TC{1, 3}) nanmean(mouse_TC{1, 4})];  
    TC_same_norm(i,:)= TC_same(i,:)./TC_same(i,2);
end
TC_same_norm_SEM = nanstd(TC_same_norm)./sqrt(sum(~isnan(TC_same_norm)));

figure() %Plotting individual mice TC same day correlation normalized to control day
subplot(1,2,1) 
set(gca,'colororder',parula(20))
p = patch('vertices', [2.75, 0; 2.75, 2.75; 3.25, 0; 3.25 2.75], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for i=1:length(mice)
    plot(ss, TC_same_norm(i,:),'-s','LineWidth',1.5)
end
legend(legend_string,'Location','southeast')
ylim([0 2.75])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
title('TC Same Day (Individual)')
set(gca,'xtick',ss)
box off

subplot(1,2,2) %Plotting average TC same day correlation normalized to d2
p = patch('vertices', [2.75, 0; 2.75, 2.75; 3.25, 0; 3.25 2.75], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
errorbar(ss, nanmean(TC_same_norm), TC_same_norm_SEM,'LineWidth',1.5,'Color',cmap_purple(13,:))
ylim([0 2.75])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
title('TC Same Day (Average)')
set(gca,'xtick',ss)
box off

%% Calculating normalized PV same day scores and same day across spatial bins with graphs
PV_same=NaN(length(mice),length(ss));
PV_same_norm=NaN(length(mice),length(ss)); %normalized by session 2 (saline day before cno day)

ctrl_PV_same_allsb=NaN(length(mice),100); %using saline sessione 2 and cno day 1
cno_PV_same_allsb=NaN(length(mice),100);

for i=1:length(mice)
    mouse = mice{i};
    mouse_PV=eval([mouse '.PV_TC_corr.meanPV_same_day.AB']);
    mouse_PV_allsb=eval([mouse '.PV_TC_corr.PVcorr_all_same_day_diag']);
    ctrl_PV_same_allsb(i,:)=mouse_PV_allsb(2,:);
    cno_PV_same_allsb(i,:)=mouse_PV_allsb(3,:);
    PV_same(i,:)= mouse_PV(ss);  
    PV_same_norm(i,:)= PV_same(i,:)./PV_same(i,2);
end
PV_same_norm_SEM = nanstd(PV_same_norm)./sqrt(sum(~isnan(PV_same_norm)));
ctrl_PV_same_allsb_SEM= NaN(1,size(ctrl_PV_same_allsb,2));
cno_PV_same_allsb_SEM= NaN(1,size(cno_PV_same_allsb,2));
for sb=1:size(ctrl_PV_same_allsb,2)
    ctrl_PV_same_allsb_SEM(sb)= std(ctrl_PV_same_allsb(:,sb))/sqrt(length(ctrl_PV_same_allsb(:,sb)));
    cno_PV_same_allsb_SEM(sb)= std(cno_PV_same_allsb(:,sb))/sqrt(length(cno_PV_same_allsb(:,sb)));
end
%%
sb=[1:2:200];
results=friedman_stats(ctrl_PV_same_allsb, cno_PV_same_allsb, [],{'Saline','CNO'},false);
%save(fullfile(savepath,'PVSameAllSB_Wilcoxon.mat'), 'results');
figure;hold on
shadedErrorBar(sb,mean(ctrl_PV_same_allsb),SEM_col(ctrl_PV_same_allsb),'lineProps',{'Color',purple,'LineWidth',2});
shadedErrorBar(sb,mean(cno_PV_same_allsb),SEM_col(cno_PV_same_allsb),'lineProps',{'Color',purple_light,'LineWidth',2,'LineStyle','--'});

ylim([0 1]);
xline(sb(10),'--','LineWidth',1.5,'Color', [0 0 0])
xline(sb(30),'--','LineWidth',1.5,'Color', magenta)
xline(sb(70),'--','LineWidth',1.5,'Color', blue)
legend({'Saline','CNO','Cue Zone End','B Reward Start','A Reward Start'},'AutoUpdate','off')
xlabel('Position (cm)')
ylabel('PV Correlation')

ax = gca;
hold(ax,'on');

sig_thresh = 0.05;

bar_height  = 0.01;   % thickness of each bar
bar_spacing = 0.1;   % vertical distance between bars (controls white space)

% Number of bins from plot
n_bins = numel(sb);

% Extract contrasts
contrasts    = unique(results.pairwise_table.contrast,'stable');
n_contrasts  = numel(contrasts);

% Build significance matrix: bins × contrasts
sig_mat = false(n_bins, n_contrasts);
for c = 1:n_contrasts
    rows = strcmp(results.pairwise_table.contrast, contrasts(c));
    sig_mat(:,c) = results.pairwise_table.sig_fdr_0_05(rows);
end

% Determine where to place bars
yl = ylim(ax);
y_start = yl(2) + bar_spacing;   % start above data

% Colormap: gray = n.s., red = sig
cmap = [0.75 0.75 0.75;   % not significant
        0.85 0.10 0.10]; % significant
colormap(ax,cmap);
set(ax,'CLim',[0 1]);

% Draw bars
for c = 1:n_contrasts

    y_center = y_start + (c-1)*bar_spacing;
    y_bottom = y_center - bar_height/2;
    y_top    = y_center + bar_height/2;

    imagesc(ax, ...
        [sb(1) sb(end)], ...
        [y_bottom y_top], ...
        sig_mat(:,c)');

    % Label bar
    text(sb(end) + range(sb)*0.01, ...
        y_center, ...
        contrasts(c), ...
        'VerticalAlignment','middle', ...
        'FontSize',9);
end

% Update y-limits to include bars + whitespace
ylim([yl(1), y_center + bar_spacing]);

box off

fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14,'FontName','Arial')
set(gcf,'Renderer','painters')
%exportgraphics(gcf, 'SameDay_PV_Bin_Sig.pdf', ...
%    'ContentType', 'vector', ...
%    'BackgroundColor', 'none')

%Export for PV same day by position stats
%writematrix([ctrl_PV_same_allsb' cno_PV_same_allsb'], fullfile(savepath,'PVsame_byPos.csv'));

%% PV Same Day Normalized
figure()
subplot(1,2,1) %Plotting individual PV same day scores
p = patch('vertices', [2.75, 0; 2.75,2.5; 3.25, 0; 3.25 2.5], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
set(gca,'colororder',parula(20))
for i=1:length(mice)
    plot(ss, PV_same_norm(i,:),'-s','LineWidth',1.5)
end
legend(legend_string,'Location','southeast')
ylim([0 2.25])
xlim([0.5 4.5])
ylabel('Normalized Correlation Score')
xlabel('Session')
title('PV Same Day (Individual)')
set(gca,'xtick',ss)
box off

subplot(1,2,2) %Plotting average PV same day scores
p = patch('vertices', [2.75, 0; 2.75,2.5; 3.25, 0; 3.25 2.5], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for i=1:length(mice)
    plot(ss, PV_same_norm(i,:),'LineWidth',1,'Color',[0.5 0.5 0.5])
end
errorbar(ss, nanmean(PV_same_norm), PV_same_norm_SEM,'LineWidth',2,'Color',cmap_purple(13,:))
ylim([0 2.25])
xlim([0.5 4.5])
ylabel('Normalized Correlation to D2')
xlabel('Session')
title('PV Same Day')
set(gca,'xtick',ss)
xticklabels({'D1: Saline','D2: Saline','D3: CNO','D4: Saline'})
xtickangle(45)
box off
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
%% PV Same Day raw values
figure()
hold on
for i=1:length(mice)
    plot([1 2], PV_same(i,2:3),'LineWidth',0.5,'Color',[0.5 0.5 0.5])
end

errorbar(1, mean(PV_same(:,2)), SEM_col(PV_same(:,2)),'LineWidth',2,'Color',purple)
errorbar(2, mean(PV_same(:,3)), SEM_col(PV_same(:,3)),'LineWidth',2,'Color',purple_light)
scatter(1, mean(PV_same(:,2)), 's', 'filled', 'MarkerFaceColor', purple)
scatter(2, mean(PV_same(:,3)), 's', 'filled', 'MarkerFaceColor', purple_light)

xticks([1 2]); xticklabels({'Saline','CNO'})
ylim([0 1]); xlim([0 3]); ylabel('PV Correlation'); box off
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)

%Export for PV same day raw value stats
%writematrix([PV_same(:,2) PV_same(:,3)], fullfile(savepath,'PVsame_raw.csv'));

%% Neighboring day PV/TC comparison
%PV neighbor matrix (A trials)
PV_neighbor_A = NaN([length(mice),length(ss)-1]);
PV_neighbor_B = NaN([length(mice),length(ss)-1]);
TC_neighbor_A = NaN([length(mice),length(ss)-1]);
TC_neighbor_B = NaN([length(mice),length(ss)-1]);

ctrl_PV_allsb_A=NaN(length(mice),100);
cno_PV_allsb_A=NaN(length(mice),100);
ctrl_PV_allsb_B=NaN(length(mice),100);
cno_PV_allsb_B=NaN(length(mice),100);

for i=1:length(mice)
    mouse = mice{i};
    mouse_PV_matrix_A=eval([mouse '.PV_TC_corr.PVcorr_all_ses.A']);
    ctrl_PV_allsb_A(i,:)=diag(mouse_PV_matrix_A{1,2});
    cno_PV_allsb_A(i,:)=diag(mouse_PV_matrix_A{2,3});
    mouse_PV_neighbor_mat_A=cellfun(@(x) nanmean(diag(x)),mouse_PV_matrix_A);
    mouse_PV_neighbor_A=diag(mouse_PV_neighbor_mat_A(ss,ss),1);
    PV_neighbor_A(i,:)= mouse_PV_neighbor_A; 
    
    mouse_PV_matrix_B=eval([mouse '.PV_TC_corr.PVcorr_all_ses.B']);
    ctrl_PV_allsb_B(i,:)=diag(mouse_PV_matrix_B{1,2});
    cno_PV_allsb_B(i,:)=diag(mouse_PV_matrix_B{2,3});
    mouse_PV_neighbor_mat_B=cellfun(@(x) nanmean(diag(x)),mouse_PV_matrix_B);
    mouse_PV_neighbor_B=diag(mouse_PV_neighbor_mat_B(ss,ss),1);
    PV_neighbor_B(i,:)= mouse_PV_neighbor_B;  
    
    mouse_TC_matrix_A=eval([mouse '.PV_TC_corr.TCcorr_all_ses.si.A']);
    mouse_TC_neighbor_mat_A=cellfun(@(x) nanmean(diag(x)),mouse_TC_matrix_A);
    mouse_TC_neighbor_A=diag(mouse_TC_neighbor_mat_A(ss,ss),1);
    TC_neighbor_A(i,:)= mouse_TC_neighbor_A; 
    
    mouse_TC_matrix_B=eval([mouse '.PV_TC_corr.TCcorr_all_ses.si.B']);
    mouse_TC_neighbor_mat_B=cellfun(@(x) nanmean(diag(x)),mouse_TC_matrix_B);
    mouse_TC_neighbor_B=diag(mouse_TC_neighbor_mat_B(ss,ss),1);
    TC_neighbor_B(i,:)= mouse_TC_neighbor_B; 
end

PV_neighbor_A_SEM = nanstd(PV_neighbor_A,1)./sqrt(size(PV_neighbor_A,1));
PV_neighbor_B_SEM = nanstd(PV_neighbor_B,1)./sqrt(size(PV_neighbor_B,1));
TC_neighbor_A_SEM = nanstd(TC_neighbor_A,1)./sqrt(size(TC_neighbor_A,1));
TC_neighbor_B_SEM = nanstd(TC_neighbor_B,1)./sqrt(size(TC_neighbor_B,1));

ctrl_PV_allsb_A_SEM=NaN(1,size(ctrl_PV_allsb_A,2));
cno_PV_allsb_A_SEM=NaN(1,size(cno_PV_allsb_A,2));
ctrl_PV_allsb_B_SEM=NaN(1,size(ctrl_PV_allsb_B,2));
cno_PV_allsb_B_SEM=NaN(1,size(cno_PV_allsb_B,2));
for sb=1:size(ctrl_PV_allsb_A,2)
    ctrl_PV_allsb_A_SEM(sb)= std(ctrl_PV_allsb_A(:,sb))/sqrt(length(ctrl_PV_allsb_A(:,sb)));
    cno_PV_allsb_A_SEM(sb)= std(cno_PV_allsb_A(:,sb))/sqrt(length(cno_PV_allsb_A(:,sb)));
    ctrl_PV_allsb_B_SEM(sb)= std(ctrl_PV_allsb_B(:,sb))/sqrt(length(ctrl_PV_allsb_B(:,sb)));
    cno_PV_allsb_B_SEM(sb)= std(cno_PV_allsb_B(:,sb))/sqrt(length(cno_PV_allsb_B(:,sb)));
end

%% Plotting neighboring day PV over all spatial bins

sb=[1:2:200];
figure()

results=friedman_stats(ctrl_PV_allsb_A, cno_PV_allsb_A, [],{'Saline','CNO'},false);
%save(fullfile(savepath,'PVAllSB_A_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, 'PVAllSB_A_Wilcoxon.xlsx')
subplot(3,1,1)
hold on
shadedErrorBar(sb,mean(ctrl_PV_allsb_A),SEM_col(ctrl_PV_allsb_A),'lineProps',{'Color',blue,'LineWidth',2});
shadedErrorBar(sb,mean(cno_PV_allsb_A),SEM_col(cno_PV_allsb_A),'lineProps',{'Color',blue_light,'LineWidth',2,'LineStyle','--'});
ylim([0 1]);
xline(sb(10),'--','LineWidth',1.5,'Color', [0 0 0])
xline(sb(30),'--','LineWidth',1.5,'Color', magenta)
xline(sb(70),'--','LineWidth',1.5,'Color', blue)
xlabel('Position (cm)')
ylabel('PV Correlation')
plotSignificanceBars(gca,sb,results)
box off

results=friedman_stats(ctrl_PV_allsb_B, cno_PV_allsb_B, [],{'Saline','CNO'},false);
%save(fullfile(savepath,'PVAllSB_B_Wilcoxon.mat'), 'results');
%writetable(results.pairwise_sig_table, 'PVAllSB_B_Wilcoxon.xlsx')
subplot(3,1,2)
hold on
shadedErrorBar(sb,mean(ctrl_PV_allsb_B),SEM_col(ctrl_PV_allsb_B),'lineProps',{'Color',magenta,'LineWidth',2});
shadedErrorBar(sb,mean(cno_PV_allsb_B),SEM_col(cno_PV_allsb_B),'lineProps',{'Color',magenta_light,'LineWidth',2,'LineStyle','--'});
xline(sb(10),'--','LineWidth',1.5,'Color', [0 0 0])
xline(sb(30),'--','LineWidth',1.5,'Color', magenta)
xline(sb(70),'--','LineWidth',1.5,'Color', blue)
ylim([0 1]);
xlabel('Position (cm)')
ylabel('PV Correlation')
plotSignificanceBars(gca,sb,results)
box off

results=friedman_stats(ctrl_PV_same_allsb, cno_PV_same_allsb, [],{'Saline','CNO'},false);
%writetable(results.pairwise_sig_table, 'PVSameAllSB_Wilcoxon.xlsx')
subplot(3,1,3)
hold on
shadedErrorBar(sb,mean(ctrl_PV_same_allsb),SEM_col(ctrl_PV_same_allsb),'lineProps',{'Color',purple,'LineWidth',2});
shadedErrorBar(sb,mean(cno_PV_same_allsb),SEM_col(cno_PV_same_allsb),'lineProps',{'Color',purple_light,'LineWidth',2,'LineStyle','--'});
ylim([0 1]);
xlabel('Position (cm)')
ylabel('PV Correlation')
xline(sb(10),'--','LineWidth',1.5,'Color', [0 0 0])
xline(sb(30),'--','LineWidth',1.5,'Color', magenta)
xline(sb(70),'--','LineWidth',1.5,'Color', blue)
plotSignificanceBars(gca,sb,results)
box off
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
set(gcf,'Renderer','painters')
%exportgraphics(gcf, 'PV_A_B_Same_AllSB.pdf', 'ContentType', 'vector', 'Resolution', 300);
%Export PV by position for A and B for stats
%writematrix([ctrl_PV_allsb_A' cno_PV_allsb_A'], fullfile(savepath,'PV_A_allsb.csv'));
%writematrix([ctrl_PV_allsb_B' cno_PV_allsb_B'], fullfile(savepath,'PV_B_allsb.csv'));

%% Plotting neighboring day PV and TC
figure() %pv neighboring day A and B means
valid = ss(1:end-1);
subplot(1,2,1)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
axis square
errorbar(valid,nanmean(PV_neighbor_A),PV_neighbor_A_SEM,'LineStyle', '-','LineWidth',1.5,'Color',cmap_blue(12,:))
errorbar(valid, nanmean(PV_neighbor_B),PV_neighbor_B_SEM,'LineStyle', '-','LineWidth',1.5,'Color',cmap_red(12,:))
legend('CNO','A Trials','B Trials')
ylabel('Correlation Score')
xlabel('Session Comparison')
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day')
ax=gca;
axis(ax, 'tight')
xlim(ax, xlim(ax) + [-1,1]*range(xlim(ax)).* 0.1)
ylim([0 1])

subplot(1,2,2)%tc neighboring day A and B means
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
axis square
errorbar(valid,nanmean(TC_neighbor_A),TC_neighbor_A_SEM,'LineStyle', '-','LineWidth',1.5,'Color',cmap_blue(12,:))
errorbar(valid,nanmean(TC_neighbor_B),TC_neighbor_B_SEM,'LineStyle', '-','LineWidth',1.5,'Color',cmap_red(12,:))
ylabel('Correlation Score')
xlabel('Session Comparison')
legend('CNO','A Trials','B Trials')
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day')
ax=gca;
axis(ax, 'tight')
xlim(ax, xlim(ax) + [-1,1]*range(xlim(ax)).* 0.1)
ylim([0 1])

figure()
subplot(2,2,1) %neighboring day PV A trials (individual)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
set(gca,'colororder',parula(20))
hold on
for ii=1:size(PV_neighbor_A,1)
    plot(valid, PV_neighbor_A(ii,:),'-s','LineWidth',1.5)
end
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day - A Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
box off

subplot(2,2,3)%neighboring day PV B trials (individual)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
set(gca,'colororder',parula(20))
for ii=1:size(PV_neighbor_B,1)
    plot(valid, PV_neighbor_B(ii,:),'-s','LineWidth',1.5)
end
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('PV Neighboring Day - B Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
box off

subplot(2,2,2) %neighboring day TC A trials (individual)
hold on
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
set(gca,'colororder',parula(20))
for ii=1:size(TC_neighbor_A,1)
    plot(valid, TC_neighbor_A(ii,:),'-s','LineWidth',1.5)
    hold on
end
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day - A Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
box off

subplot(2,2,4) %neighboring day TC B trials (individual)
p = patch('vertices', [1.75, 0; 1.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
set(gca,'colororder',parula(20))
for ii=1:size(TC_neighbor_B,1)
    plot(valid, TC_neighbor_B(ii,:),'-s','LineWidth',1.5)
end
xticks(valid)
xticklabels({'Control D1 vs Control D2','Control D2 vs Silence','Silence vs Control D4'})
xtickangle(45)
title('TC Neighboring Day - B Trial')
ylabel('Correlation Score')
xlabel('Session Comparison')
legend(legend_string);
box off

%need to plot some heat maps showing slight remapping between neighbors
%% Plots PV scores for A trials, B trials, and same day for AB cells
y=[mean(PV_neighbor_A(:,1)) mean(PV_neighbor_A(:,2))  mean(PV_neighbor_B(:,1)) mean(PV_neighbor_B(:,2))];
y_comb=[PV_neighbor_A(:,1) PV_neighbor_A(:,2) PV_neighbor_B(:,1) PV_neighbor_B(:,2)];
figure()
subplot(3,1,1);hold on
for i=1:size(y_comb,1)
    plot([1,2],y_comb(i,1:2),'LineWidth',0.5,'Color',[.5 .5 .5])
end
errorbar(1, mean(PV_neighbor_A(:,1)), SEM_col(PV_neighbor_A(:,1)),'LineWidth',2,'Color',blue)
errorbar(2, mean(PV_neighbor_A(:,2)), SEM_col(PV_neighbor_A(:,2)),'LineWidth',2,'Color',blue_light)
scatter(1, mean(PV_neighbor_A(:,1)), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, mean(PV_neighbor_A(:,2)), 's', 'filled', 'MarkerFaceColor', blue_light)

xticks([1 2]); xticklabels({'A-Saline','A-CNO'})
ylim([0 1]); xlim([0 3]); ylabel('PV Correlation'); box off
ylabel('PV Correlation')

subplot(3,1,2);hold on
for i=1:size(y_comb,1)
    plot([1,2],y_comb(i,3:4),'LineWidth',0.5,'Color',[.5 .5 .5])
end
errorbar(1, mean(PV_neighbor_B(:,1)), SEM_col(PV_neighbor_B(:,1)),'LineWidth',2,'Color',magenta)
errorbar(2, mean(PV_neighbor_B(:,2)), SEM_col(PV_neighbor_B(:,2)),'LineWidth',2,'Color',magenta_light)
scatter(1, mean(PV_neighbor_B(:,1)), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(2, mean(PV_neighbor_B(:,2)), 's', 'filled', 'MarkerFaceColor', magenta_light)

xticks([1 2]); xticklabels({'B-Saline','B-CNO'})
ylim([0 1]); xlim([0 3]); ylabel('PV Correlation'); box off
ylabel('PV Correlation')

subplot(3,1,3); hold on
for i=1:length(mice)
    plot([1 2], PV_same(i,2:3),'LineWidth',0.5,'Color',[0.5 0.5 0.5])
end

errorbar(1, mean(PV_same(:,2)), SEM_col(PV_same(:,2)),'LineWidth',2,'Color',purple)
errorbar(2, mean(PV_same(:,3)), SEM_col(PV_same(:,3)),'LineWidth',2,'Color',purple_light)
scatter(1, mean(PV_same(:,2)), 's', 'filled', 'MarkerFaceColor', purple)
scatter(2, mean(PV_same(:,3)), 's', 'filled', 'MarkerFaceColor', purple_light)

xticks([1 2]); xticklabels({'Saline','CNO'})
ylim([0 1]); xlim([0 3]); ylabel('PV Correlation'); box off

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'PV_A_B_Same.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export PV means for stats
%writematrix([PV_neighbor_A(:,1) PV_neighbor_A(:,2)], fullfile(savepath,'PV_A_mean.csv'));
%writematrix([PV_neighbor_B(:,1) PV_neighbor_B(:,2)], fullfile(savepath,'PV_B_mean.csv'));
%%
y=[mean(TC_neighbor_A(:,1)) mean(TC_neighbor_A(:,2))  mean(TC_neighbor_B(:,1)) mean(TC_neighbor_B(:,2))];
y_comb=[TC_neighbor_A(:,1) TC_neighbor_A(:,2) TC_neighbor_B(:,1) TC_neighbor_B(:,2)];

figure;
hold on
for i=1:size(y_comb,1)
    plot([1,2],y_comb(i,1:2),'Color',[.5 .5 .5])
end
for i=1:size(y_comb,1)
    plot([3,4],y_comb(i,3:4),'Color',[.5 .5 .5])
end
errorbar(1, mean(y_comb(:,1)), SEM_col(y_comb(:,1)), 'LineWidth', 2, 'Color', blue);
errorbar(2, mean(y_comb(:,2)), SEM_col(y_comb(:,2)), 'LineWidth', 2, 'Color', blue_light);
errorbar(3, mean(y_comb(:,3)), SEM_col(y_comb(:,3)), 'LineWidth', 2, 'Color', magenta);
errorbar(4, mean(y_comb(:,4)), SEM_col(y_comb(:,4)), 'LineWidth', 2, 'Color', magenta_light);

scatter(1, y(1), 's', 'filled', 'MarkerFaceColor', blue)
scatter(2, y(2), 's', 'filled', 'MarkerFaceColor', blue_light)
scatter(3, y(3), 's', 'filled', 'MarkerFaceColor', magenta)
scatter(4, y(4), 's', 'filled', 'MarkerFaceColor', magenta_light)
xticks([1 2 3 4]); xticklabels({'A-Saline','A-CNO','B-Saline','B-CNO'});xtickangle(45);
ylabel('TC Correlation'); ylim([0 1]); xlim([0 5])

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'Sil_TCCorr.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export TC means for stats
%writematrix([y_comb(:,1) y_comb(:,2)], fullfile(savepath,'TC_A_mean.csv'));
%writematrix([y_comb(:,3) y_comb(:,4)], fullfile(savepath,'TC_B_mean.csv'));
%% Visualize same day correlation maps (shared AB cells) for all mice
figure()
for i=1:length(mice)
    mouse = mice{i};
    mouse_PV=eval([mouse '.PV_TC_corr.PVcorr_all_same_day{1, 2}']);
    subplot(2,length(mice),i)
    imagesc(mouse_PV)
    colormap(gca,cmap_purple);
    caxis([0 1]);
    set(gca,'XTick',[], 'YTick', [])
    title([mouse ' - Saline'])
    xlabel('Spatial Bin')
    ylabel('Spatial Bin')
end
for i=1:length(mice)
    mouse = mice{i};
    mouse_PV_cno=eval([mouse '.PV_TC_corr.PVcorr_all_same_day{1, 3}']);
    subplot(2,length(mice),i+length(mice))
    imagesc(mouse_PV_cno)
    colormap(gca,cmap_purple);
    caxis([0 1]);
    set(gca,'XTick',[], 'YTick', [])
    title([mouse ' - CNO'])
    xlabel('Spatial Bin')
    ylabel('Spatial Bin')
end

%% 
% ------Calculate average PV map for A trials---------
first_mouse = mice{1};
sample_matrix_1 = eval([first_mouse '.PV_TC_corr.PVcorr_all_ses.A{1, 2}']);
sample_matrix_2 = eval([first_mouse '.PV_TC_corr.PVcorr_all_ses.A{2, 3}']);

sum_PV = zeros(size(sample_matrix_1));
sum_PV_cno = zeros(size(sample_matrix_2));

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV = eval([mouse '.PV_TC_corr.PVcorr_all_ses.A{1, 2}']);
    sum_PV = sum_PV + mouse_PV;
end

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV_cno = eval([mouse '.PV_TC_corr.PVcorr_all_ses.A{2, 3}']);
    sum_PV_cno = sum_PV_cno + mouse_PV_cno;
end

avg_PV = sum_PV / length(mice);
avg_PV_cno = sum_PV_cno / length(mice);

% ------Calculate average PV map for B trials---------
sample_matrix_B1 = eval([first_mouse '.PV_TC_corr.PVcorr_all_ses.B{1, 2}']);
sample_matrix_B2 = eval([first_mouse '.PV_TC_corr.PVcorr_all_ses.B{2, 3}']);

sum_PV_B = zeros(size(sample_matrix_B1));
sum_PV_cno_B = zeros(size(sample_matrix_B2));

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV_B = eval([mouse '.PV_TC_corr.PVcorr_all_ses.B{1, 2}']);
    sum_PV_B = sum_PV_B + mouse_PV_B;
end

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV_cno_B = eval([mouse '.PV_TC_corr.PVcorr_all_ses.B{2, 3}']);
    sum_PV_cno_B = sum_PV_cno_B + mouse_PV_cno_B;
end

avg_PV_B = sum_PV_B / length(mice);
avg_PV_cno_B = sum_PV_cno_B / length(mice);

% ------Calculate average PV map for same day---------
sample_matrix_same_2 = eval([first_mouse '.PV_TC_corr.PVcorr_all_same_day{1, 2}']);
sample_matrix_same_3 = eval([first_mouse '.PV_TC_corr.PVcorr_all_same_day{1, 3}']);

sum_PV_same_2 = zeros(size(sample_matrix_same_2));
sum_PV_same_3 = zeros(size(sample_matrix_same_3));

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV_same_2 = eval([mouse '.PV_TC_corr.PVcorr_all_same_day{1, 2}']);
    sum_PV_same_2 = sum_PV_same_2 + mouse_PV_same_2;
end

for i = 1:length(mice)
    mouse = mice{i};
    mouse_PV_same_3 = eval([mouse '.PV_TC_corr.PVcorr_all_same_day{1, 3}']);
    sum_PV_same_3 = sum_PV_same_3 + mouse_PV_same_3;
end

avg_PV_same_2 = sum_PV_same_2 / length(mice);
avg_PV_same_3 = sum_PV_same_3 / length(mice);

% --------- Plotting ---------
figure()

% Left column with colorbars (westoutside)
h1 = subplot(3,2,5);
imagesc(avg_PV_same_2)
colormap(gca, cmap_purple);
caxis([0 0.7]);
xline(30,'--','Color',magenta,'LineWidth',2)
xline(70,'--','Color',blue,'LineWidth',2)
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('Same - Sal')
cb1 = colorbar('Location', 'westoutside');

h3 = subplot(3,2,1);
imagesc(avg_PV)
colormap(gca, cmap_blue);
caxis([0 0.7]);
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('A - Sal v Sal')
cb3 = colorbar('Location', 'westoutside');

h5 = subplot(3,2,3);
imagesc(avg_PV_B)
colormap(gca, cmap_magenta);
caxis([0 0.7]);
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('B - Sal v Sal')
cb5 = colorbar('Location', 'westoutside');

% Right column WITHOUT colorbars
h2 = subplot(3,2,6);
imagesc(avg_PV_same_3)
colormap(gca, cmap_purple);
caxis([0 0.7]);
xline(30,'--','Color',magenta,'LineWidth',2)
xline(70,'--','Color',blue,'LineWidth',2)
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('Same - CNO')

h4 = subplot(3,2,2);
imagesc(avg_PV_cno)
colormap(gca, cmap_blue);
caxis([0 0.7]);
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('A - Sal v CNO')

h6 = subplot(3,2,4);
imagesc(avg_PV_cno_B)
colormap(gca, cmap_magenta);
caxis([0 0.7]);
set(gca, 'XTick', [], 'YTick', [])
xlabel('Position')
ylabel('Position')
title('B - Sal v CNO')

% Get left column positions
s1Pos = get(h1, 'position');
s3Pos = get(h3, 'position');
s5Pos = get(h5, 'position');

% Get right column positions
s2Pos = get(h2, 'position');
s4Pos = get(h4, 'position');
s6Pos = get(h6, 'position');

% Use right column size (width and height) to resize left column
s1Pos(3:4) = s2Pos(3:4);
s3Pos(3:4) = s4Pos(3:4);
s5Pos(3:4) = s6Pos(3:4);

% Apply updated positions back to left column axes
set(h1, 'position', s1Pos);
set(h3, 'position', s3Pos);
set(h5, 'position', s5Pos);

% Keep fonts consistent
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'PVMapsSil.pdf', 'ContentType', 'vector', 'Resolution', 300);
%%
mouse_files = {'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\crossSession_update\tuned_fractions.mat',...
    'R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\crossSession_update\tuned_fractions.mat'};

mice_tunedfrac = {'MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128','MH131','MH132','MH137','MH138'};
%%
frac_A= NaN(length(mouse_files),4);
frac_B= NaN(length(mouse_files),4);
frac_AB= NaN(length(mouse_files),4);
frac_neither= NaN(length(mouse_files),4);

for mouse=1:length(mouse_files)
    load(mouse_files{mouse})
    if mouse==4 %exception for MH115 because of missing session
        frac_A(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,1); 
        frac_B(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,2);
        frac_AB(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,3);
        frac_neither(mouse,2:4)=tuned_fractions.fracTuned_si_filt(:,4);
    else
        frac_A(mouse,:)=tuned_fractions.fracTuned_si_filt(ss,1); 
        frac_B(mouse,:)=tuned_fractions.fracTuned_si_filt(ss,2); 
        frac_AB(mouse,:)=tuned_fractions.fracTuned_si_filt(ss,3);
        frac_neither(mouse,:)=tuned_fractions.fracTuned_si_filt(ss,4);
    end
end
%% Stacked Bar Plot of Classes ofP PCs
% Example color codes 
color_A = blue;        
color_AB = purple;      
color_B = magenta;        
color_neither = [0.5 0.5 0.5]; 

% Means
mean_A = mean(frac_A(:, [2 3]));
mean_B = mean(frac_B(:, [2 3]));
mean_AB = mean(frac_AB(:, [2 3]));
mean_neither = mean(frac_neither(:, [2 3]));

% Reordered data matrix: A, B, AB, Neither
data = [
    mean_A(1), mean_A(2);
    mean_B(1), mean_B(2);
    mean_AB(1), mean_AB(2);
    mean_neither(1), mean_neither(2);
];

% Normalize columns
data = data ./ sum(data,1);

% Plot stacked bar
figure;
h = bar(data', 'stacked');

set(h(1), 'FaceColor', color_A);
set(h(2), 'FaceColor', color_B);
set(h(3), 'FaceColor', color_AB);
set(h(4), 'FaceColor', color_neither);

set(gca, 'XTickLabel', {'Saline', 'CNO'});
ylabel('Mean Fraction');
legend({'A-Sel', 'B-Sel', 'AB', 'Neither'}, 'Location', 'bestoutside');
box off;
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14,'FontName','Arial');
set(gcf, 'Renderer', 'painters');
%exportgraphics(gcf, 'CellClass_Stacked.pdf', 'ContentType', 'vector', 'Resolution', 300);
%%  
tuned_frac_legend=["CNO", mice];
x=[1 2 3 4];
color_vec(1,:) = [139, 0, 139]/255; %magenta
color_vec(2,:) = [65,105,225]/255; %blue 
color_vec(3,:) = [220,20,60]/255;%red

A_SEM = nanstd(frac_A)./sqrt(sum(~isnan(frac_A)));
B_SEM = nanstd(frac_B)./sqrt(sum(~isnan(frac_B)));
AB_SEM = nanstd(frac_AB)./sqrt(sum(~isnan(frac_AB)));
N_SEM = nanstd(frac_neither)./sqrt(sum(~isnan(frac_neither)));

figure()
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
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 1; 3.25, 0; 3.25 1], ...
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
p = patch('vertices', [2.75, 0; 2.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(4,2,2)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for ii=1:size(frac_A,1)
    if ii==4
        plot([2 3 4],frac_A(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_A(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
set(gca,'colororder',parula(20))
legend(tuned_frac_legend)
title('Fraction of A Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
ylabel('Fraction of Cells')
box off

subplot(4,2,4)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for ii=1:size(frac_B,1)
    if ii==4
        plot([2 3 4],frac_B(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_B(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
set(gca,'colororder',parula(20))
title('Fraction of B Tuned')
xlim([0 5])
ylim([0 0.6])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
ylabel('Fraction of Cells')
box off

subplot(4,2,6)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for ii=1:size(frac_AB,1)
    if ii==4
        plot([2 3 4],frac_AB(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_AB(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
set(gca,'colororder',parula(20))
title('Fraction of AB Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
ylabel('Fraction of Cells')
box off

subplot(4,2,8)
p = patch('vertices', [2.75, 0; 2.75, 0.6; 3.25, 0; 3.25 0.6], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
hold on
for ii=1:size(frac_neither,1)
    if ii==4
        plot([2 3 4],frac_neither(ii,2:end),'-s','LineWidth',1.5)
    else
        plot(x,frac_neither(ii,:),'-s','LineWidth',1.5)
        hold on
    end
end
set(gca,'colororder',parula(20))
title('Fraction of Neither Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
ylabel('Fraction of Cells')
box off

%Export fraction of cell types for stats
savepath2 = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\4'; % Path to save directory
% writematrix(frac_A(:,2:3), fullfile(savepath2,'frac_Asel.csv'));
% writematrix(frac_B(:,2:3), fullfile(savepath2,'frac_Bsel.csv'));
% writematrix(frac_AB(:,2:3), fullfile(savepath2,'frac_AB.csv'));
% writematrix(frac_neither(:,2:3), fullfile(savepath2,'frac_neither.csv'));
%%
subplot(2,2,1)
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

subplot(2,2,2)
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

subplot(2,2,3)
errorbar(x,nanmean(frac_AB),AB_SEM,'LineWidth',1.5','Color',color_vec(1,:))
title('Fraction of AB Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')

subplot(2,2,4)
errorbar(x,nanmean(frac_neither),N_SEM,'LineWidth',1.5','Color',[.7 .7 .7])
title('Fraction of Neither Tuned')
xlim([0 5])
ylim([0 1])
xticks(x)
xticklabels({'D1:Saline','D2:Saline','D3:CNO','D4:Saline'})
xtickangle(45)
p = patch('vertices', [2.75, 0; 2.75, 1; 3.25, 0; 3.25 1], ...
          'faces', [1, 2, 4, 3], ...
          'FaceColor', 'y', ...
          'EdgeColor','none',...
          'FaceAlpha', 0.3);
box off
ylabel('Fraction of Cells')
%% loading in place cell structures for control and silencing session
%
mice_pc_qual ={'MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128','MH131','MH132','MH137','MH138'};

MH110_ca_ctrl = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_29_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH110_ca_cno = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\MH110_23_05_30_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH113_ca_ctrl = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_26_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH113_ca_cno = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\MH113_23_05_27_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH114_ca_ctrl = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_27_Random_Saline-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH114_ca_cno = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\MH114_23_05_28_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH115_ca_ctrl = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_10_Random_Saline-001_1\output\28_Nov_2023_ca_analysis.mat','Place_cell');
MH115_ca_cno = load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\MH115_23_08_11_Random_CNO-001_2\output\29_Nov_2023_ca_analysis.mat','Place_cell');
MH126_ca_ctrl= load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_04_Random-001_3\output\11_Jun_2024_ca_analysis.mat','Place_cell');
MH126_ca_cno=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\MH126_2024_05_05_Random_CNO-001_4\output\11_Jun_2024_ca_analysis.mat','Place_cell');
MH127_ca_ctrl=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_03_Random_Saline-001_6\output\10_Jun_2024_ca_analysis.mat','Place_cell');
MH127_ca_cno=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\MH127_2024_05_04_Random_CNO-001_7\output\10_Jun_2024_ca_analysis.mat','Place_cell');
MH122_ca_ctrl=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_04_Random_Saline-001_4\output\18_Jun_2024_ca_analysis.mat','Place_cell');
MH122_ca_cno=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\MH122_2024_05_05_Random_CNO-001_5\output\18_Jun_2024_ca_analysis.mat','Place_cell');
MH128_ca_ctrl=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_07_Random_Saline-001_5\output\19_Jun_2024_ca_analysis.mat','Place_cell');
MH128_ca_cno=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\MH128_2024_05_08_Random_CNO-001_6\output\19_Jun_2024_ca_analysis.mat','Place_cell');
MH131_ca_ctrl=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\MH131_2024_10_30_Random_Saline-001_6\output\14_Jan_2025_ca_analysis.mat",'Place_cell');
MH131_ca_cno=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\OCGOL_Sil_Recall_Rev\MH131_2024_10_31_CNO-001_3\output\30_Jan_2025_ca_analysis.mat",'Place_cell');
MH132_ca_ctrl=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\MH132_2024_10_30_Random_Saline-001_5\output\30_Jan_2025_ca_analysis.mat",'Place_cell');
MH132_ca_cno=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\OCGOL_Sil_Recall_Rev\MH132_2024_10_31_CNO-001_6\output\15_Jan_2025_ca_analysis.mat",'Place_cell');
MH137_ca_ctrl=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\MH137_2024_10_30_Saline-001_6\output\25_Jan_2025_ca_analysis.mat",'Place_cell');
MH137_ca_cno=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\OCGOL_Sil_Recall_Rev\MH137_2024_10_31_Random_CNO-001_7\output\25_Jan_2025_ca_analysis.mat",'Place_cell');
MH138_ca_ctrl=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\MH138_2024_10_30_Saline-001_6\output\17_Jan_2025_ca_analysis.mat",'Place_cell');
MH138_ca_cno=load("R:\basulabspace\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\OCGOL_Sil_Recall_Rev\MH138_2024_10_31_Random_CNO-001_7\output\17_Jan_2025_ca_analysis.mat",'Place_cell');
%%
%structure for 4 is all A trials, structure 5 is all B trials
%spatial information
%creating spatial information in A trials ONLY
crossMouse_spatial_tuning.si.a.num = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.si.a.frac = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.si.a.all = [];
crossMouse_spatial_tuning.si.a.sig =[];

crossMouse_spatial_tuning.si.b.num = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.si.b.frac = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.si.b.all = [];
crossMouse_spatial_tuning.si.b.sig =[];

for i=1:length(mice_pc_qual) %Gathering all place cell quality data for control day 
    mouse=mice_pc_qual{i};
    
    data_ctrl_index=eval([mouse '_ca_ctrl.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs']);
    mouse_spatial_tuning.si.a.num = length(data_ctrl_index);
    mouse_spatial_tuning.si.a.frac = sum(data_ctrl_index)/mouse_spatial_tuning.si.a.num;
    crossMouse_spatial_tuning.si.a.num(i,1)= mouse_spatial_tuning.si.a.num;
    crossMouse_spatial_tuning.si.a.frac(i,1)= mouse_spatial_tuning.si.a.frac;
    data_ctrl_vals=eval([mouse '_ca_ctrl.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs']);
    mouse_spatial_tuning.si.a.all = max(data_ctrl_vals);
    crossMouse_spatial_tuning.si.a.all{i,1}= mouse_spatial_tuning.si.a.all;
    crossMouse_spatial_tuning.si.a.sig{i,1}= mouse_spatial_tuning.si.a.all(find(data_ctrl_index));
    
    data_ctrl_index=eval([mouse '_ca_ctrl.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs']);
    mouse_spatial_tuning.si.b.num = length(data_ctrl_index);
    mouse_spatial_tuning.si.b.frac = sum(data_ctrl_index)/mouse_spatial_tuning.si.b.num;
    crossMouse_spatial_tuning.si.b.num(i,1)= mouse_spatial_tuning.si.b.num;
    crossMouse_spatial_tuning.si.b.frac(i,1)= mouse_spatial_tuning.si.b.frac;
    data_ctrl_vals=eval([mouse '_ca_ctrl.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs']);
    mouse_spatial_tuning.si.b.all = max(data_ctrl_vals);
    crossMouse_spatial_tuning.si.b.all{i,1}= mouse_spatial_tuning.si.b.all;
    crossMouse_spatial_tuning.si.b.sig{i,1}= mouse_spatial_tuning.si.b.all(find(data_ctrl_index));
    
    data_cno_index=eval([mouse '_ca_cno.Place_cell{1, 4}.Spatial_Info.significant_ROI_Skaggs']);
    mouse_spatial_tuning.si.a.num = length(data_cno_index);
    mouse_spatial_tuning.si.a.frac = sum(data_cno_index)/mouse_spatial_tuning.si.a.num;
    crossMouse_spatial_tuning.si.a.num(i,2)= mouse_spatial_tuning.si.a.num;
    crossMouse_spatial_tuning.si.a.frac(i,2)= mouse_spatial_tuning.si.a.frac;
    data_cno_vals=eval([mouse '_ca_cno.Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs']);
    mouse_spatial_tuning.si.a.all = max(data_cno_vals);
    crossMouse_spatial_tuning.si.a.all{i,2}= mouse_spatial_tuning.si.a.all;
    crossMouse_spatial_tuning.si.a.sig{i,2}= mouse_spatial_tuning.si.a.all(find(data_cno_index));  
    
    data_cno_index=eval([mouse '_ca_cno.Place_cell{1, 5}.Spatial_Info.significant_ROI_Skaggs']);
    mouse_spatial_tuning.si.b.num = length(data_cno_index);
    mouse_spatial_tuning.si.b.frac = sum(data_cno_index)/mouse_spatial_tuning.si.b.num;
    crossMouse_spatial_tuning.si.b.num(i,2)= mouse_spatial_tuning.si.b.num;
    crossMouse_spatial_tuning.si.b.frac(i,2)= mouse_spatial_tuning.si.b.frac;
    data_cno_vals=eval([mouse '_ca_cno.Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs']);
    mouse_spatial_tuning.si.b.all = max(data_cno_vals);
    crossMouse_spatial_tuning.si.b.all{i,2}= mouse_spatial_tuning.si.b.all;
    crossMouse_spatial_tuning.si.b.sig{i,2}= mouse_spatial_tuning.si.b.all(find(data_cno_index));
end
%%
%same thing, but for tuning specificity
crossMouse_spatial_tuning.ts.a.num = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.ts.a.frac = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.ts.a.all = [];
crossMouse_spatial_tuning.ts.a.sig =[];

crossMouse_spatial_tuning.ts.b.num = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.ts.b.frac = NaN(length(mice_pc_qual),2);
crossMouse_spatial_tuning.ts.b.all = [];
crossMouse_spatial_tuning.ts.b.sig =[];


for i=1:length(mice_pc_qual) %Gathering all place cell quality data for control day 
    mouse=mice_pc_qual{i};
    
    data_ctrl_index=eval([mouse '_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.significant_ROI']);
    mouse_spatial_tuning.ts.a.num = length(data_ctrl_index);
    mouse_spatial_tuning.ts.a.frac = sum(data_ctrl_index)/mouse_spatial_tuning.ts.a.num;
    crossMouse_spatial_tuning.ts.a.num(i,1)= mouse_spatial_tuning.ts.a.num;
    crossMouse_spatial_tuning.ts.a.frac(i,1)= mouse_spatial_tuning.ts.a.frac;
    data_ctrl_vals=eval([mouse '_ca_ctrl.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity']);
    mouse_spatial_tuning.ts.a.all = data_ctrl_vals;
    crossMouse_spatial_tuning.ts.a.all{i,1}= mouse_spatial_tuning.ts.a.all;
    crossMouse_spatial_tuning.ts.a.sig{i,1}= mouse_spatial_tuning.ts.a.all(find(data_ctrl_index));
    
    data_ctrl_index=eval([mouse '_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.significant_ROI']);
    mouse_spatial_tuning.ts.b.num = length(data_ctrl_index);
    mouse_spatial_tuning.ts.b.frac = sum(data_ctrl_index)/mouse_spatial_tuning.ts.b.num;
    crossMouse_spatial_tuning.ts.b.num(i,1)= mouse_spatial_tuning.ts.b.num;
    crossMouse_spatial_tuning.ts.b.frac(i,1)= mouse_spatial_tuning.ts.b.frac;
    data_ctrl_vals=eval([mouse '_ca_ctrl.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity']);
    mouse_spatial_tuning.ts.b.all = data_ctrl_vals;
    crossMouse_spatial_tuning.ts.b.all{i,1}= mouse_spatial_tuning.ts.b.all;
    crossMouse_spatial_tuning.ts.b.sig{i,1}= mouse_spatial_tuning.ts.b.all(find(data_ctrl_index));
    
    data_cno_index=eval([mouse '_ca_cno.Place_cell{1, 4}.Tuning_Specificity.significant_ROI']);
    mouse_spatial_tuning.ts.a.num = length(data_cno_index);
    mouse_spatial_tuning.ts.a.frac = sum(data_cno_index)/mouse_spatial_tuning.ts.a.num;
    crossMouse_spatial_tuning.ts.a.num(i,2)= mouse_spatial_tuning.ts.a.num;
    crossMouse_spatial_tuning.ts.a.frac(i,2)= mouse_spatial_tuning.ts.a.frac;
    data_cno_vals=eval([mouse '_ca_cno.Place_cell{1, 4}.Tuning_Specificity.tuning_specificity']);
    mouse_spatial_tuning.ts.a.all = data_cno_vals;
    crossMouse_spatial_tuning.ts.a.all{i,2}= mouse_spatial_tuning.ts.a.all;
    crossMouse_spatial_tuning.ts.a.sig{i,2}= mouse_spatial_tuning.ts.a.all(find(data_cno_index));  
    
    data_cno_index=eval([mouse '_ca_cno.Place_cell{1, 5}.Tuning_Specificity.significant_ROI']);
    mouse_spatial_tuning.ts.b.num = length(data_cno_index);
    mouse_spatial_tuning.ts.b.frac = sum(data_cno_index)/mouse_spatial_tuning.ts.b.num;
    crossMouse_spatial_tuning.ts.b.num(i,2)= mouse_spatial_tuning.ts.b.num;
    crossMouse_spatial_tuning.ts.b.frac(i,2)= mouse_spatial_tuning.ts.b.frac;
    data_cno_vals=eval([mouse '_ca_cno.Place_cell{1, 5}.Tuning_Specificity.tuning_specificity']);
    mouse_spatial_tuning.ts.b.all = data_cno_vals;
    crossMouse_spatial_tuning.ts.b.all{i,2}= mouse_spatial_tuning.ts.b.all;
    crossMouse_spatial_tuning.ts.b.sig{i,2}= mouse_spatial_tuning.ts.b.all(find(data_cno_index));
end

%% plotting place cell scores 

%spatial information scores, 4 plots one with A trials and one with B for
%all cells and significantly tuned
x=1:2;
sessions={'Control';'Silence'};

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.si.a.all{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.si.a.all{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];
%%
figure()
subplot(2,2,1)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [cmap_blue(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [0.5 0.5 0.5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - A Trial (All)');
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.si.b.all{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.si.b.all{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];
set(gca,'xtick',[1:2],'xticklabel',sessions)

subplot(2,2,2)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_red(12,:)];
b.CData(2,:)= [cmap_red(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - B Trial (All)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.si.a.sig{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.si.a.sig{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

subplot(2,2,3)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [cmap_blue(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - A Trial (Tuned)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.si.b.sig{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.si.b.sig{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

subplot(2,2,4)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_red(12,:)];
b.CData(2,:)= [cmap_red(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('SI - B Trial (Tuned)');
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylim([0 2.5])
ylabel('Spatial Information Score')
box off
%%
%tuning specificity scores, 4 plots one with A trials and one with B for
%all cells and significantly tuned
ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.ts.a.all{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.ts.a.all{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

figure()
subplot(2,2,1)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [cmap_blue(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - A Trial (All)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.ts.b.all{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.ts.b.all{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

subplot(2,2,2)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_red(12,:)];
b.CData(2,:)= [cmap_red(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - B Trial (All)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.ts.a.sig{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.ts.a.sig{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

subplot(2,2,3)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [cmap_blue(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - A Trial (Tuned)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off

ctrl=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    ctrl(i)=nanmean(crossMouse_spatial_tuning.ts.b.sig{i,1});  
end
ctrl_SEM= nanstd(ctrl)/sqrt(sum(~isnan(ctrl)));
cno=NaN([length(mice_pc_qual),1]);
for i=1:length(mice_pc_qual)
    cno(i)=nanmean(crossMouse_spatial_tuning.ts.b.sig{i,2});  
end
cno_SEM= nanstd(cno)/sqrt(sum(~isnan(cno)));
err = [ctrl_SEM cno_SEM];
y=[nanmean(ctrl) nanmean(cno)];
paired=[ctrl cno];

subplot(2,2,4)
b=bar(x,[nanmean(ctrl) nanmean(cno)])
b.FaceColor='flat';
b.CData(1,:)= [cmap_red(12,:)];
b.CData(2,:)= [cmap_red(10,:)];
hold on
for i=1:length(mice_pc_qual)
    plot(x,paired(i,:),'color', [.5 .5 .5])
end
errorbar(x,y,err,"LineStyle","none","Color","black");   
title('TS - B Trial (Tuned)');
ylim([0 1])
set(gca,'xtick',[1:2],'xticklabel',sessions)
ylabel('Tuning Specificity Score')
box off
%%
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