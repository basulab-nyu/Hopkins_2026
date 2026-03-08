%%previously loaded in performance for MH110-MH128
%%then ran script LEC_silence_plots to extract place cell data to plot
%%against performance

subplot(3,4,1)
scatter(perf_all(:,2),frac_neither(:,2),'filled')
hold on
scatter(perf_all(:,3),frac_neither(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction Neither Tuned Cells')
title('Fraction Neither vs. Performance (All)')
legend("Saline","CNO",'Location','northwest')

subplot(3,4,2)
scatter(perf_all(:,2),frac_AB(:,2),'filled')
hold on
scatter(perf_all(:,3),frac_AB(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction AB Tuned Cells')
title('Fraction AB vs. Performance (All)')

subplot(3,4,3)
scatter(perf_all(:,2),frac_A(:,2),'filled')
hold on
scatter(perf_all(:,3),frac_A(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction A Tuned Cells')
title('Fraction A vs. Performance (All)')

subplot(3,4,4)
scatter(perf_all(:,2),frac_B(:,2),'filled')
hold on
scatter(perf_all(:,3),frac_B(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction B Tuned Cells')
title('Fraction B vs. Performance (All)')

subplot(3,4,5)
scatter(perf_A(:,2),frac_neither(:,2),'filled')
hold on
scatter(perf_A(:,3),frac_neither(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction Neither Tuned Cells')
title('Fraction Neither vs. Performance (A)')
legend("Saline","CNO",'Location','northwest')

subplot(3,4,6)
scatter(perf_A(:,2),frac_AB(:,2),'filled')
hold on
scatter(perf_A(:,3),frac_AB(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction AB Tuned Cells')
title('Fraction AB vs. Performance (A)')

subplot(3,4,7)
scatter(perf_A(:,2),frac_A(:,2),'filled')
hold on
scatter(perf_A(:,3),frac_A(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction A Tuned Cells')
title('Fraction A vs. Performance (A)')

subplot(3,4,8)
scatter(perf_A(:,2),frac_B(:,2),'filled')
hold on
scatter(perf_A(:,3),frac_B(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction B Tuned Cells')
title('Fraction B vs. Performance (A)')

subplot(3,4,9)
scatter(perf_B(:,2),frac_neither(:,2),'filled')
hold on
scatter(perf_B(:,3),frac_neither(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction Neither Tuned Cells')
title('Fraction Neither vs. Performance (B)')
legend("Saline","CNO",'Location','northwest')

subplot(3,4,10)
scatter(perf_B(:,2),frac_AB(:,2),'filled')
hold on
scatter(perf_B(:,3),frac_AB(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction AB Tuned Cells')
title('Fraction AB vs. Performance (B)')

subplot(3,4,11)
scatter(perf_B(:,2),frac_A(:,2),'filled')
hold on
scatter(perf_B(:,3),frac_A(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction A Tuned Cells')
title('Fraction A vs. Performance (B)')

subplot(3,4,12)
scatter(perf_B(:,2),frac_B(:,2),'filled')
hold on
scatter(perf_B(:,3),frac_B(:,3),'filled')
ylim([0,1])
xlim([0 1])
xlabel('Performance (Fraction Correct)')
ylabel('Fraction B Tuned Cells')
title('Fraction B vs. Performance (B)')
%%
subplot(2,3,1)
scatter(perf_all(:,3),PV_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
ylim([0 2.1])
xlim([0 1])
title('PV Same Day vs. Performance (All)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized PV Correlation')

subplot(2,3,2)
scatter(perf_A(:,3),PV_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
ylim([0 2.1])
xlim([0 1])
title('PV Same Day vs. Performance (A)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized PV Correlation')

subplot(2,3,3)
scatter(perf_B(:,3),PV_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
ylim([0 2.1])
xlim([0 1])
title('PV Same Day vs. Performance (B)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized PV Correlation')

subplot(2,3,4)
scatter(perf_all(:,3),TC_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
xlim([0 1])
ylim([0 2.5])
title('TC Same Day vs. Performance (All)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized TC Correlation')

subplot(2,3,5)
scatter(perf_A(:,3),TC_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
xlim([0 1])
ylim([0 2.5])
title('TC Same Day vs. Performance (A)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized TC Correlation')

subplot(2,3,6)
scatter(perf_B(:,3),TC_same_norm(:,3),"filled",'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
xlim([0 1])
ylim([0 2.5])
title('TC Same Day vs. Performance (B)') 
xlabel('Performance (Fraction Correct)')
ylabel('Normalized TC Correlation')
%%
sessions= {'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH110\crossSession_update\tuned_logicals.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH113\crossSession_update\tuned_logicals.mat',...
    "R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH114\crossSession_update_allSes\tuned_logicals.mat",...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort1_Processed_SilencingSession\MH115\crossSession_update\tuned_logicals.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH126\crossSession_update\tuned_logicals.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH127\crossSession_update\tuned_logicals.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH122\crossSession_update\tuned_logicals.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Cohort2_Processed_SilencingSession\MH128\crossSession_update\tuned_logicals.mat'};

num_cells=NaN(size(sessions,2),4);%magic number for number of sessions for each mouse

for i_mouse=1:length(sessions)
    load(sessions{i_mouse});
    try
        for i_day=1:size(tuned_logicals.tuned_log_filt_si,2)
            num_cells(i_mouse, i_day)= length(tuned_logicals.tuned_log_filt_si{1, i_day}.onlyA)
        end
    end
end

num_cells(4,2:end)=num_cells(4,1:3)
num_cells(4,1)=NaN
%%
xx=[1 2 3 4];
for i_mouse=1:size(num_cells,1)
    plot(xx, num_cells(i_mouse,:),'-o','LineWidth',1.5)
    hold on
end
ylim([0 500])
xlim([1 4])
box off
ylabel('Number Active Cells')
xlabel('Day')
xticks([1 2 3 4])
xticklabels({'D1-Saline','D2-Saline','D3-CNO','D4-Saline'})
xtickangle(45)
title('Active Cells vs. Day')
legend("MH110","MH113","MH114","MH115","MH126","MH127","MH122","MH128");