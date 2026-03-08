%% Plot colors
magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.7 0.55 0];
magenta_light = magenta + 0.50 * (1 - magenta);
blue_light = blue + 0.50 * (1 - blue);
savepath = 'C:\Users\mh5481\OneDrive - NYU Langone Health\Desktop\Figures\RFvOCGOL_LEC\Stats\4'; % Path to save directory
%% Load in tables
mice={'MH110','MH113','MH114','MH115','MH126','MH127','MH122','MH128','MH131','MH132','MH136','MH137','MH138'};
legend_strings=[ "CNO", mice ];

MH110=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH110\MH110_Perf_Silence_V3.mat');
MH113=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH113\MH113_Perf_Silence_V3.mat');
MH114=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH114\MH114_Perf_Silence_V3.mat');
MH115=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH115\MH115_Perf_Silence_V3.mat');
MH126=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH126\MH126_Perf_Silence_V3.mat');
MH127=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH127\MH127_Perf_Silence_V3.mat');
MH122=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH122\MH122_Perf_Silence_V3.mat');
MH128=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH128\MH128_Perf_Silence_V3.mat');
MH131=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH131\MH131_Perf_Silence_V3.mat');
MH132=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH132\MH132_Perf_Silence_V3.mat');
MH136=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH136\MH136_Perf_Silence_V3.mat');
MH137=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH137\MH137_Perf_Silence_V3.mat');
MH138=load('R:\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH138\MH138_Perf_Silence_V3.mat');
%% Plotting active ROIs
ActiveROI=[221 158;
214	196;
239	243;
400	410;
335	362;
325	327;
333	350;
270	242;
130	126;
354	260;
196	164;
228	171];

xnum=[1 2];
b=bar(xnum,mean(ActiveROI))
b.FaceColor = 'flat';
b.CData(1,:) = [0.2 0.2 0.2];
b.CData(2,:) = [0.6 0.6 0.6];
box off
ylabel('Number Active Cells')
hold on
for i=1:size(ActiveROI,1)
    plot(ActiveROI(i,:),'Color',[.5 .5 .5])
end
plot(xnum,mean(ActiveROI),'k','LineWidth',2)
errorbar(xnum,mean(ActiveROI),[SEM_col(ActiveROI(:,1)), SEM_col(ActiveROI(:,2))],'.','CapSize',10,'LineWidth',2,'Color', 'k');
names = {'Saline'; 'CNO'};
set(gca,'xtick',[1:2],'xticklabel',names)
set(gca, 'FontName', 'Arial','FontSize',14);
%% Plotting performance
ss=[1 2 3 4]; %Denotes 4 sessions of (S, S, CNO, S)
perf_all = NaN(length(mice),length(ss));
perf_A = NaN(length(mice),length(ss));
perf_B = NaN(length(mice),length(ss));
for i=1:length(mice)
    mouse = mice{i};
    mouse_perfAll=eval([mouse '.Performance.PropCorrect.All']);
    mouse_perfA=eval([mouse '.Performance.PropCorrect.A']);
    mouse_perfB=eval([mouse '.Performance.PropCorrect.B']);
    if mouse=='MH136'
        perf_all(i,[1,3,4])= mouse_perfAll;
        perf_A(i,[1,3,4])= mouse_perfA;
        perf_B(i,[1,3,4])= mouse_perfB;
    else
        perf_all(i,:)= mouse_perfAll;
        perf_A(i,:)= mouse_perfA;
        perf_B(i,:)= mouse_perfB;
    end
end
err_all = SEM_col_exNan(perf_all);
err_A = SEM_col_exNan(perf_A);
err_B = SEM_col_exNan(perf_B); 

figure()
subplot(1,2,2);
hold on
for i=1:length(mice)
    plot([1,2],perf_A(i,2:3),'color', [.5 .5 .5])
end
errorbar(1,nanmean(perf_A(:,2)),err_A(2),'LineWidth',2,'Color',blue)
scatter(1,nanmean(perf_A(:,2)),'s','filled','MarkerFaceColor', blue)
errorbar(2,nanmean(perf_A(:,3)),err_A(3),'LineWidth',2,'Color',blue_light)
scatter(2,nanmean(perf_A(:,3)),'s','filled','MarkerFaceColor', blue_light)
% p = patch('vertices', [1.75, 0; 1.75, 1.1; 2.25, 0; 2.25 1.1], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3)

for i=1:length(mice)
    plot([3 4],perf_B(i,2:3),'color', [.5 .5 .5])
end
errorbar(3,nanmean(perf_B(:,2)),err_B(2),'LineWidth',2,'Color',magenta)
scatter(3,nanmean(perf_B(:,2)),'s','filled','MarkerFaceColor', magenta)
errorbar(4,nanmean(perf_B(:,3)),err_B(3),'LineWidth',2,'Color',magenta_light)
scatter(4,nanmean(perf_B(:,3)),'s','filled','MarkerFaceColor', magenta_light)
% p = patch('vertices', [3.75, 0; 3.75, 1.1; 4.25, 0; 4.25 1.1], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3)
ylim([0 1.1]); xlim([0 5])
ylabel('Fraction of Correct Trials'); xlabel('Session'); box off
sessions = {'A-Saline'; 'A-CNO';'B-Saline';'B-CNO'};
set(gca,'xtick',[1:4],'xticklabel',sessions)
xtickangle(45);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')

% Plotting fraction of licks
lick_A = NaN(length(mice),length(ss));
lick_B = NaN(length(mice),length(ss));
for i=1:length(mice)
    mouse = mice{i};
    mouse_lick_A=eval([mouse '.Performance.Lick.FracLicksReward.A']);
    mouse_lick_B=eval([mouse '.Performance.Lick.FracLicksReward.B']);
    if mouse=='MH136'
        lick_A(i,[1,3,4])= mouse_lick_A;
        lick_B(i,[1,3,4])= mouse_lick_B;
    else
        lick_A(i,:)= mouse_lick_A;
        lick_B(i,:)= mouse_lick_B;
    end
end


lick_err_A = SEM_col_exNan(lick_A);
lick_err_B = SEM_col_exNan(lick_B);

subplot(1,2,1)
hold on
for i=1:length(mice)
    plot([1,2],lick_A(i,2:3),'color', [.5 .5 .5])
end
errorbar(1,nanmean(lick_A(:,2)),lick_err_A(2),'LineWidth',2,'Color',blue)
scatter(1,nanmean(lick_A(:,2)),'s','filled','MarkerFaceColor', blue)
errorbar(2,nanmean(lick_A(:,3)),lick_err_A(3),'LineWidth',2,'Color',blue_light)
scatter(2,nanmean(lick_A(:,3)),'s','filled','MarkerFaceColor', blue_light)
% p = patch('vertices', [1.75, 0; 1.75, 1; 2.25, 0; 2.25 1], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3);

for i=1:length(mice)
    plot([3,4],lick_B(i,2:3),'color', [.5 .5 .5])
end
errorbar(3,nanmean(lick_B(:,2)),lick_err_B(2),'LineWidth',2,'Color',magenta)
scatter(3,nanmean(lick_B(:,2)),'s','filled','MarkerFaceColor', magenta)
errorbar(4,nanmean(lick_B(:,3)),lick_err_B(3),'LineWidth',2,'Color',magenta_light)
scatter(4,nanmean(lick_B(:,3)),'s','filled','MarkerFaceColor', magenta_light)
% p = patch('vertices', [3.75, 0; 3.75, 1; 4.25, 0; 4.25 1], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3)
ylim([0 1]); xlim([0 5]); box off
sessions = {'A-Saline'; 'A-CNO'; 'B-Saline'; 'B-CNO'};
set(gca,'xtick',[1:4],'xticklabel',sessions)
xtickangle(45);
xlabel('Session')
ylabel({'Fraction of Licks'; 'in Reward Zone'})
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')

% Plotting number of rewards collected
rewcoll_A = NaN(length(mice),length(ss));
rewcoll_B = NaN(length(mice),length(ss));
for i=1:length(mice)
    mouse = mice{i};
    mouse_rewcoll_A=eval([mouse '.Performance.Lick.RewardsColl.A']);
    mouse_rewcoll_B=eval([mouse '.Performance.Lick.RewardsColl.B']);
    
    mouse_mean_A   = cellfun(@mean, mouse_rewcoll_A);
    mouse_mean_B   = cellfun(@mean, mouse_rewcoll_B);

    if strcmp(mouse, 'MH136')
        rewcoll_A(i,[1,3,4])= mouse_mean_A ;
        rewcoll_B(i,[1,3,4])= mouse_mean_B;
    else
        rewcoll_A(i,:)= mouse_mean_A;
        rewcoll_B(i,:)=  mouse_mean_B;
    end
end

% subplot(1,3,1)
% hold on
% for i=1:length(mice)
%     plot([1,2],rewcoll_A(i,2:3),'color', [.5 .5 .5])
% end
% errorbar([1,2],nanmean(rewcoll_A(:,2:3)),SEM_col_exNan(rewcoll_A(:,2:3)),'LineWidth',2,'Color',blue)
% scatter([1,2],nanmean(rewcoll_A(:,2:3)),'s','filled','MarkerFaceColor', blue)
% p = patch('vertices', [1.75, 0; 1.75, 5; 2.25, 0; 2.25 5], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3)
% 
% for i=1:length(mice)
%     plot([3,4],rewcoll_B(i,2:3),'color', [.5 .5 .5])
% end
% errorbar([3,4],nanmean(rewcoll_B(:,2:3)),SEM_col_exNan(rewcoll_B(:,2:3)),'LineWidth',2,'Color',magenta)
% scatter([3,4],nanmean(rewcoll_B(:,2:3)),'s','filled','MarkerFaceColor', magenta)
% p = patch('vertices', [3.75, 0; 3.75, 5; 4.25, 0; 4.25 5], ...
%           'faces', [1, 2, 4, 3], ...
%           'FaceColor', 'y', ...
%           'EdgeColor','none',...
%           'FaceAlpha', 0.3)
% ylim([0 5]);xlim([0 5])
% ylabel('Rewards/Lap');xlabel('Session');box off
% sessions = {'A-Saline'; 'A-CNO'; 'B-Saline'; 'B-CNO'};
% set(gca,'xtick',[1:4],'xticklabel',sessions)
% xtickangle(45);

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')
%exportgraphics(gcf, 'FracLicks_Perf.pdf', 'ContentType', 'vector', 'Resolution', 300);

%Export matrices for stats
% writematrix(rmmissing(lick_A(:,2:3)), fullfile(savepath,'A_lickFrac.csv'));
% writematrix(rmmissing(lick_B(:,2:3)), fullfile(savepath,'B_lickFrac.csv'));
% writematrix(rmmissing(perf_A(:,2:3)), fullfile(savepath,'A_perf.csv'));
% writematrix(rmmissing(perf_B(:,2:3)), fullfile(savepath,'B_perf.csv'));
%% Plotting sample lick rasters
for i=6 %1:length(mice)
    mouse = mice{i};
    A_lick=eval([mouse '.Performance.Lick.LickRaster.A']);
    B_lick=eval([mouse '.Performance.Lick.LickRaster.B']);
    x=(1:100)*2;
    figure; hold on
    if strcmp(mouse, 'MH136')
        subplot(2,2,1)
        plotLickRaster(A_lick{1, 1})
        title('A-Saline')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
        
        subplot(2,2,2)
        plotLickRaster(B_lick{1, 1})
        title('B-Saline')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);

        subplot(2,2,3)
        plotLickRaster(A_lick{1, 2})
        title('A-CNO')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);

        subplot(2,2,4)
        plotLickRaster(B_lick{1, 2})
        title('B-CNO')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
    else
        subplot(2,2,1)
        plotLickRaster(A_lick{1, 2})
        title('A-Saline')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
        
        subplot(2,2,2)
        plotLickRaster(B_lick{1, 2})
        title('B-Saline')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
        
        subplot(2,2,3)
        plotLickRaster(A_lick{1, 3})
        title('A-CNO')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
        
        subplot(2,2,4)
        plotLickRaster(B_lick{1, 3})
        title('B-CNO')
        xline(x(30),'Color', magenta,'LineWidth',1.5); xline(x(70),'Color',blue,'LineWidth',1.5);
    end
    set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
    set(gcf, 'Renderer', 'painters')
end
set(gcf,'Renderer','painters')
%exportgraphics(gcf, 'LickRaster_MH127.pdf', 'ContentType', 'vector', 'Resolution', 300);
%% Plotting speed
speed_A_A = cell(length(mice),length(ss));
speed_A_B = cell(length(mice),length(ss));
speed_B_B = cell(length(mice),length(ss));
speed_B_A = cell(length(mice),length(ss));
for i=1:length(mice)
    mouse = mice{i};
    mouse_speed_AA=eval([mouse '.Performance.Speed.A.AReward']);
    mouse_speed_AB=eval([mouse '.Performance.Speed.A.BReward']);
    mouse_speed_BB=eval([mouse '.Performance.Speed.B.BReward']);
    mouse_speed_BA=eval([mouse '.Performance.Speed.B.AReward']);
    
    mouse_speed_AA = cellfun(@(x) nanmean(x, 1), mouse_speed_AA, 'UniformOutput', false);
    mouse_speed_AB = cellfun(@(x) nanmean(x, 1), mouse_speed_AB, 'UniformOutput', false);
    mouse_speed_BB = cellfun(@(x) nanmean(x, 1), mouse_speed_BB, 'UniformOutput', false);
    mouse_speed_BA = cellfun(@(x) nanmean(x, 1), mouse_speed_BA, 'UniformOutput', false);

    if strcmp(mouse, 'MH136')
        speed_A_A(i,[2,3,4])= mouse_speed_AA;
        speed_A_B(i,[2,3,4])= mouse_speed_AB;
        speed_B_B(i,[2,3,4])= mouse_speed_BB;
        speed_B_A(i,[2,3,4])= mouse_speed_BA;
    else
        speed_A_A(i,:)= mouse_speed_AA;
        speed_A_B(i,:)=  mouse_speed_AB;
        speed_B_B(i,:)=  mouse_speed_BB;
        speed_B_A(i,:)=  mouse_speed_BA;
    end
end

AA_Saline= cell2mat(speed_A_A(:,2));
AB_Saline= cell2mat(speed_A_B(:,2));
BB_Saline= cell2mat(speed_B_B(:,2));
BA_Saline= cell2mat(speed_B_A(:,2));

AA_CNO= cell2mat(speed_A_A(:,3));
AB_CNO= cell2mat(speed_A_B(:,3));
BB_CNO= cell2mat(speed_B_B(:,3));
BA_CNO= cell2mat(speed_B_A(:,3));

time=linspace (-2,2,41);
%%
results_AA=friedman_stats(AA_Saline, AA_CNO);
results_AB=friedman_stats(AB_Saline, AB_CNO);
results_BB=friedman_stats(BB_Saline, BB_CNO);
results_BA=friedman_stats(BA_Saline, BA_CNO);
figure()
subplot(1,2,1) %A speed
hold on
shadedErrorBar(time,nanmean(AA_Saline),SEM_col_exNan(AA_Saline),'lineProps',{'Color',blue,'LineWidth',1.5});
shadedErrorBar(time,nanmean(AB_Saline),SEM_col_exNan(AB_Saline),'lineProps',{'Color',magenta,'LineWidth',1.5});
shadedErrorBar(time,nanmean(AA_CNO),SEM_col_exNan(AA_CNO),'lineProps',{'Color',blue + 0.50 * (1 - blue),'LineWidth',1.5});
shadedErrorBar(time,nanmean(AB_CNO),SEM_col_exNan(AB_CNO),'lineProps',{'Color',magenta + 0.50 * (1 - magenta),'LineWidth',1.5});
xlabel('Time (s)'); ylabel('Speed (cm/s)'); ylim([0 20])
title('A')
%legend('A Zone - Saline', 'B Zone - Saline','A Zone - CNO','B Zone - CNO','location','southwest')
xline(0,'--k','LineWidth',1.5,'HandleVisibility', 'off')
plotSignificanceBars(gca,time,results_AA)
plotSignificanceBars(gca,time,results_AB)

subplot(1,2,2) %B speed
hold on
shadedErrorBar(time,nanmean(BB_Saline),SEM_col_exNan(BB_Saline),'lineProps',{'Color',magenta,'LineWidth',1.5});
shadedErrorBar(time,nanmean(BA_Saline),SEM_col_exNan(BA_Saline),'lineProps',{'Color',blue,'LineWidth',1.5});
shadedErrorBar(time,nanmean(BB_CNO),SEM_col_exNan(BB_CNO),'lineProps',{'Color',magenta + 0.50 * (1 - magenta),'LineWidth',1.5});
shadedErrorBar(time,nanmean(BA_CNO),SEM_col_exNan(BA_CNO),'lineProps',{'Color',blue + 0.50 * (1 - blue),'LineWidth',1.5});
xlabel('Time (s)'); ylabel('Speed (cm/s)'); ylim([0 20])
title('B')
xline(0,'--k','LineWidth',1.5)
set(gcf, 'Renderer', 'painters')
plotSignificanceBars(gca,time,results_BB)
plotSignificanceBars(gca,time,results_BA)
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
%exportgraphics(gcf, 'Speed.pdf', 'ContentType', 'vector', 'Resolution', 300);
%writetable(results_BB.pairwise_sig_table, fullfile(savepath,'Speed_BB_Wilcoxon.xlsx'))
%% Lick Histogram control vs silencing
sb = 0:2:200;
lick_hist_A= cell(length(mice),length(ss));
lick_hist_B= cell(length(mice),length(ss));
for i=1:length(mice)
    mouse = mice{i};
    mouse_lickhistA=eval([mouse '.Performance.Lick.LickRaster.A']);
    mouse_lickhistB=eval([mouse '.Performance.Lick.LickRaster.B']);
    if strcmp(mouse, 'MH136')
        idx_map=[2,3,4];
        for j=1:3
            C_A = mouse_lickhistA{j};
            lick_hist_A{i, idx_map(j)} = sum(C_A) / sum(sum(C_A));

            C_B = mouse_lickhistB{j};
            lick_hist_B{i, idx_map(j)} = sum(C_B) / sum(sum(C_B));
        end
            
    else
        for idx=1:length(ss)
            C_A = mouse_lickhistA{idx};
            lick_hist_A{i, idx} = sum(C_A) / sum(sum(C_A));

            C_B = mouse_lickhistB{idx};
            lick_hist_B{i, idx} = sum(C_B) / sum(sum(C_B));
        end
    end
end

Alickrast_Saline= cell2mat(lick_hist_A(:,2));
Blickrast_Saline= cell2mat(lick_hist_B(:,2));
Alickrast_CNO= cell2mat(lick_hist_A(:,3));
Blickrast_CNO= cell2mat(lick_hist_B(:,3));

figure()
subplot(2,2,1); hold on %A lick histogram
bar(sb(2:end),nanmean(Alickrast_Saline),'FaceColor',blue,'EdgeColor','none', 'BarWidth', 1)
x_rect = [57 61 61 57]; 
y_rect = [0 0 .15 .15]; 
patch(x_rect, y_rect, magenta, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
xx_rect = [142 146 146 142]; 
yy_rect = [0 0 .15 .15]; 
patch(xx_rect, yy_rect, blue, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
ylim([0 0.15])
yline(0.01,'--k','LineWidth',1.5)
xlabel('Position (cm)')
ylabel('Fraction of Licks')
title('A - Saline')

subplot(2,2,2); hold on
bar(sb(2:end),nanmean(Blickrast_Saline),'FaceColor',magenta,'EdgeColor','none', 'BarWidth', 1)
ylim([0 0.15])
yline(0.01,'--k','LineWidth',1.5)
xlabel('Position (cm)')
ylabel('Fraction of Licks')
patch(x_rect, y_rect, magenta, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
patch(xx_rect, yy_rect, blue, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
title('B - Saline')

subplot(2,2,3); hold on
bar(sb(2:end),nanmean(Alickrast_CNO),'FaceColor',blue + 0.50 * (1 - blue),'EdgeColor','none', 'BarWidth', 1)
ylim([0 0.15])
yline(0.01,'--k','LineWidth',1.5)
xlabel('Position (cm)')
ylabel('Fraction of Licks')
patch(x_rect, y_rect, magenta, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
patch(xx_rect, yy_rect, blue, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
title('A - CNO')

subplot(2,2,4); hold on
bar(sb(2:end),nanmean(Blickrast_CNO),'FaceColor',magenta + 0.50 * (1 - magenta),'EdgeColor','none', 'BarWidth', 1)
ylim([0 0.15])
yline(0.01,'--k','LineWidth',1.5)
xlabel('Position (cm)')
ylabel('Fraction of Licks')
patch(x_rect, y_rect, magenta, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
patch(xx_rect, yy_rect, blue, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
title('B - CNO')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')
%exportgraphics(gcf, 'LickHistoAvg.pdf', 'ContentType', 'vector', 'Resolution', 300);
