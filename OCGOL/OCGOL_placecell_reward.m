sal_sessions= {'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH110\MH110_23_05_29_Random_Saline-001_4\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH113\MH113_23_05_26_Random_Saline-001_4\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH114\MH114_23_05_27_Random_Saline-001_4\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH115\MH115_23_08_10_Random_Saline-001_2\output\28_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH126\MH126_2024_05_04_Random-001_3\output\11_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH127\MH127_2024_05_03_Random_Saline-001_6\output\10_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH122\MH122_2024_05_04_Random_Saline-001_4\output\18_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH128\MH128_2024_05_07_Random_Saline-001_5\output\19_Jun_2024_ca_analysis.mat'};
CNO_sessions={'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH110\MH110_23_05_30_Random_CNO-001_5\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH113\MH113_23_05_27_Random_CNO-001_5\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH114\MH114_23_05_28_Random_CNO-001_5\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH115\MH115_23_08_11_Random_CNO-001_3\output\29_Nov_2023_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH126\MH126_2024_05_05_Random_CNO-001_4\output\11_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH127\MH127_2024_05_04_Random_CNO-001_7\output\10_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH122\MH122_2024_05_05_Random_CNO-001_5\output\18_Jun_2024_ca_analysis.mat',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH128\MH128_2024_05_08_Random_CNO-001_6\output\19_Jun_2024_ca_analysis.mat'};
%%
saline_prob.A=NaN(size(sal_sessions,2),20);
saline_prob.B=NaN(size(sal_sessions,2),20);
cno_prob.A=NaN(size(CNO_sessions,2),20);
cno_prob.B=NaN(size(CNO_sessions,2),20);

for i_mouse=1:size(sal_sessions,2)
    load(sal_sessions{i_mouse},"Place_cell");
    try
    saline_prob.A(i_mouse,:)=Place_cell{1, 4}.proba_per_bin{1, 6};
    saline_prob.B(i_mouse,:)=Place_cell{1, 5}.proba_per_bin{1, 6};
    end
end

%%
for i_mouse=1:size(CNO_sessions,2)
    load(CNO_sessions{i_mouse},"Place_cell");
    try
    cno_prob.A(i_mouse,:)=Place_cell{1, 4}.proba_per_bin{1, 6};
    cno_prob.B(i_mouse,:)=Place_cell{1, 5}.proba_per_bin{1, 6};
    end
end
%%
x=[1:20]
subplot(2,2,1)
for ii=1:size(saline_prob.A,1)
    plot(x,saline_prob.A(ii,:),'LineWidth',1.5)
    hold on
end
yline(.05)
xline(15)
legend("MH110","MH113","MH114","MH115","MH126","MH127","MH122","MH128","Chance",'Location','northwest')
xlim([0 21])
ylim([0 0.25])
box off
ylabel('Place Cell Probability')
xlabel('Spatial Bin')
title('P(Place Cell) - Saline/A Trial')

subplot(2,2,2)
for ii=1:size(saline_prob.B,1)
    plot(x,saline_prob.B(ii,:),'LineWidth',1.5)
    hold on
end
xline(6)
xlim([0 21])
ylim([0 0.25])
box off
ylabel('Place Cell Probability')
xlabel('Spatial Bin')
title('Saline/B Trial')
yline(.05)

subplot(2,2,3)
for ii=1:size(cno_prob.A,1)
    plot(x,cno_prob.A(ii,:),'LineWidth',1.5)
    hold on
end
xline(15)
yline(.05)
legend("MH110","MH113","MH114","MH115","MH126","MH127","MH122","MH128","Chance",'Location','northwest')
xlim([0 21])
ylim([0 0.25])
box off
ylabel('Place Cell Probability')
xlabel('Spatial Bin')
title('CNO/A Trial')

subplot(2,2,4)
for ii=1:size(cno_prob.B,1)
    plot(x,cno_prob.B(ii,:),'LineWidth',1.5)
    hold on
end
xline(6)
xlim([0 21])
ylim([0 0.25])
box off
ylabel('Place Cell Probability')
xlabel('Spatial Bin')
title('CNO/B Trial')
yline(.05)
%%
sal_err_A = std(saline_prob.A)./sqrt(sum(saline_prob.A));
sal_err_B = std(saline_prob.B)./sqrt(sum(saline_prob.B));

cno_err_A = std(cno_prob.A)./sqrt(sum(cno_prob.A));
cno_err_B = std(cno_prob.B)./sqrt(sum(cno_prob.B));

gray = [128 128 128]/255;

subplot(1,2,1)
yline(0.05);
errorbar(mean(saline_prob.A),sal_err_A,'LineWidth',1.5,'Color',[0 0.4470 0.7410])
hold on
xline(15);
errorbar(mean(cno_prob.A),cno_err_A,'LineWidth',1.5,'Color',gray)
ylabel('P(Place Cell)');
xlabel('Spatial Bin');
title('P(Place Cell) - A Trials');
ylim([0 .25])

subplot(1,2,2)
yline(0.05);
errorbar(mean(saline_prob.B),sal_err_B,'LineWidth',1.5,'Color',[0.8 0.1451 0.1608])
hold on
xline(6);
errorbar(mean(cno_prob.B),cno_err_B,'LineWidth',1.5,'Color',gray)
ylabel('P(Place Cell)')
xlabel('Spatial Bin');
title('P(Place Cell) - B Trials');
ylim([0 .25])