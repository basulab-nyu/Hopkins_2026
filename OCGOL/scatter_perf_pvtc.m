load("R:\basulabspace\MH\Decoding_LECSilence\PV.mat")
load("R:\basulabspace\MH\Decoding_LECSilence\TC.mat")
load("R:\basulabspace\MH\Decoding_LECSilence\Perf.mat")

perf_A_match=perf_A([1 2 3 5 6 7 8 9 10 12 13],2:3);
perf_B_match=perf_B([1 2 3 5 6 7 8 9 10 12 13],2:3);
PV_A_match=PV_neighbor_A(:,1:2);
PV_B_match=PV_neighbor_B(:,1:2);
TC_A_match=TC_neighbor_A(:,1:2);
TC_B_match=TC_neighbor_B(:,1:2);
%% --- Combine columns into one group ---

PV_A_all   = PV_A_match(:);
TC_A_all = TC_A_match(:);
perf_A_all = perf_A_match(:);

PV_B_all   = PV_B_match(:);
TC_B_all = TC_B_match(:);
perf_B_all = perf_B_match(:);

% --- Compute Pearson correlations ---
%CNO
[r_A, p_A] = corr(PV_A_all(12:22), perf_A_all(12:22), 'Type','Pearson');
[r_B, p_B] = corr(PV_B_all(12:22), perf_B_all(12:22), 'Type','Pearson');

[r_A_TC, p_A_TC] = corr(TC_A_all(12:22), perf_A_all(12:22), 'Type','Pearson');
[r_B_TC, p_B_TC] = corr(TC_B_all(12:22), perf_B_all(12:22), 'Type','Pearson');

%saline
[r_A_sal, p_A_sal] = corr(PV_A_all(1:11), perf_A_all(1:11), 'Type','Pearson');
[r_B_sal, p_B_sal] = corr(PV_B_all(1:11), perf_B_all(1:11), 'Type','Pearson');

[r_A_TC_sal, p_A_TC_sal] = corr(TC_A_all(1:11), perf_A_all(1:11), 'Type','Pearson');
[r_B_TC_sal, p_B_TC_sal] = corr(TC_B_all(1:11), perf_B_all(1:11), 'Type','Pearson');

%% --- TC (top) and PV (bottom) Figure with fixed axes size and shared legend ---
figure('Color','w','Position',[200 200 800 600]);

xFit = linspace(0, 0.8, 100);

% Create 2x1 tiled layout with compact spacing
t = tiledlayout(2,1,'TileSpacing','compact','Padding','compact');

% ===================== TC Plot (Top) =====================
ax1 = nexttile;
hold on

xA_tc = TC_A_all(12:22);
yA_tc = perf_A_all(12:22);
xB_tc = TC_B_all(12:22);
yB_tc = perf_B_all(12:22);

% Scatter
s1 = scatter(xA_tc, yA_tc, 60, 'filled', 'MarkerFaceColor', blue_light);
s2 = scatter(xB_tc, yB_tc, 60, 'filled', 'MarkerFaceColor', magenta_light);
s3 = scatter(TC_A_all(1:11), perf_A_all(1:11), 60, 'x', 'MarkerEdgeColor', blue, 'LineWidth', 1.5);
s4 = scatter(TC_B_all(1:11), perf_B_all(1:11), 60, 'x', 'MarkerEdgeColor', magenta, 'LineWidth', 1.5);

% Best-fit lines
pA_tc = polyfit(xA_tc, yA_tc, 1);
pB_tc = polyfit(xB_tc, yB_tc, 1);

l1 = plot(xFit, polyval(pA_tc, xFit), 'Color', blue_light, 'LineWidth', 2);
l2 = plot(xFit, polyval(pB_tc, xFit), 'Color', magenta_light, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('TC correlation')
ylabel('Performance')
title('TC')

% Stats bottom-right
text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A_TC, p_A_TC, r_B_TC, p_B_TC), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== PV Plot (Bottom) =====================
ax2 = nexttile;
hold on

xA_pv = PV_A_all(12:22);
yA_pv = perf_A_all(12:22);
xB_pv = PV_B_all(12:22);
yB_pv = perf_B_all(12:22);

scatter(xA_pv, yA_pv, 60, 'filled', 'MarkerFaceColor', blue_light);
scatter(xB_pv, yB_pv, 60, 'filled', 'MarkerFaceColor', magenta_light);
scatter(PV_A_all(1:11), perf_A_all(1:11), 60, 'x', 'MarkerEdgeColor', blue, 'LineWidth', 1.5);
scatter(PV_B_all(1:11), perf_B_all(1:11), 60, 'x', 'MarkerEdgeColor', magenta, 'LineWidth', 1.5);

pA_pv = polyfit(xA_pv, yA_pv, 1);
pB_pv = polyfit(xB_pv, yB_pv, 1);

plot(xFit, polyval(pA_pv, xFit), 'Color', blue_light, 'LineWidth', 2);
plot(xFit, polyval(pB_pv, xFit), 'Color', magenta_light, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('PV correlation')
ylabel('Performance')
title('PV')

text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A, p_A, r_B, p_B), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== Shared Legend =====================
% Create legend relative to axes handles, not tiledlayout object
lgd = legend([l1 l2], {'Group A','Group B'}, ...
    'Orientation','horizontal', ...
    'Location','northoutside');
lgd.Box = 'off';

% Match axes sizes exactly
linkaxes([ax1 ax2],'x')  % optional if you want x-limits to match

% Global formatting
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14)
set(gcf,'Renderer','painters');

%% --- TC (top: Control) and TC (bottom: CNO) Figure with fixed axes size and shared legend ---
figure('Color','w','Position',[200 200 800 600]);

xFit = linspace(0, 0.8, 100);

% Create 2x1 tiled layout with compact spacing
t = tiledlayout(2,1,'TileSpacing','compact','Padding','compact');

% ===================== TC Plot (Top: Control A & B) =====================
ax1 = nexttile;
hold on

xA_tc_ctrl = TC_A_all(1:11);
yA_tc_ctrl = perf_A_all(1:11);
xB_tc_ctrl = TC_B_all(1:11);
yB_tc_ctrl = perf_B_all(1:11);

% Scatter
s1 = scatter(xA_tc_ctrl, yA_tc_ctrl, 60, 'filled', 'MarkerFaceColor', blue);
s2 = scatter(xB_tc_ctrl, yB_tc_ctrl, 60, 'filled', 'MarkerFaceColor', magenta);

% Best-fit lines
pA_tc_ctrl = polyfit(xA_tc_ctrl, yA_tc_ctrl, 1);
pB_tc_ctrl = polyfit(xB_tc_ctrl, yB_tc_ctrl, 1);

l1 = plot(xFit, polyval(pA_tc_ctrl, xFit), 'Color', blue, 'LineWidth', 2);
l2 = plot(xFit, polyval(pB_tc_ctrl, xFit), 'Color', magenta, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('TC correlation')
ylabel('Performance')
title('TC (Control)')

% Stats bottom-right
text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A_TC_sal, p_A_TC_sal, r_B_TC_sal, p_B_TC_sal), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== TC Plot (Bottom: CNO A & B) =====================
ax2 = nexttile;
hold on

xA_tc_cno = TC_A_all(12:22);
yA_tc_cno = perf_A_all(12:22);
xB_tc_cno = TC_B_all(12:22);
yB_tc_cno = perf_B_all(12:22);

% Scatter
scatter(xA_tc_cno, yA_tc_cno, 60, 'filled', 'MarkerFaceColor', blue_light);
scatter(xB_tc_cno, yB_tc_cno, 60, 'filled', 'MarkerFaceColor', magenta_light);

% Best-fit lines
pA_tc_cno = polyfit(xA_tc_cno, yA_tc_cno, 1);
pB_tc_cno = polyfit(xB_tc_cno, yB_tc_cno, 1);

l3=plot(xFit, polyval(pA_tc_cno, xFit), 'Color', blue_light, 'LineWidth', 2);
l4=plot(xFit, polyval(pB_tc_cno, xFit), 'Color', magenta_light, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('TC correlation')
ylabel('Performance')
title('TC (CNO)')

% Stats bottom-right
text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A_TC, p_A_TC, r_B_TC, p_B_TC), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== Shared Legend =====================
lgd = legend([l1 l2 l3 l4], {'A-Saline','B-Saline','A-CNO','B-CNO'}, ...
    'Orientation','horizontal', ...
    'Location','northoutside');
lgd.Box = 'off';

% Match axes sizes exactly
linkaxes([ax1 ax2],'x')

% Global formatting
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14)
set(gcf,'Renderer','painters');

%% --- PV (top: Control) and PV (bottom: CNO) Figure with fixed axes size and shared legend ---
figure('Color','w','Position',[200 200 800 600]);

xFit = linspace(0, 0.8, 100);

% Create 2x1 tiled layout
t = tiledlayout(2,1,'TileSpacing','compact','Padding','compact');

% ===================== PV Plot (Top: Control A & B) =====================
ax1 = nexttile;
hold on

xA_pv_ctrl = PV_A_all(1:11);
yA_pv_ctrl = perf_A_all(1:11);
xB_pv_ctrl = PV_B_all(1:11);
yB_pv_ctrl = perf_B_all(1:11);

% Scatter
s1 = scatter(xA_pv_ctrl, yA_pv_ctrl, 60, 'filled', 'MarkerFaceColor', blue);
s2 = scatter(xB_pv_ctrl, yB_pv_ctrl, 60, 'filled', 'MarkerFaceColor', magenta);

% Best-fit lines
pA_pv_ctrl = polyfit(xA_pv_ctrl, yA_pv_ctrl, 1);
pB_pv_ctrl = polyfit(xB_pv_ctrl, yB_pv_ctrl, 1);

l1 = plot(xFit, polyval(pA_pv_ctrl, xFit), 'Color', blue, 'LineWidth', 2);
l2 = plot(xFit, polyval(pB_pv_ctrl, xFit), 'Color', magenta, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('PV correlation')
ylabel('Performance')
title('PV (Control)')

% Stats bottom-right
text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A_sal, p_A_sal, r_B_sal, p_B_sal), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== PV Plot (Bottom: CNO A & B) =====================
ax2 = nexttile;
hold on

xA_pv_cno = PV_A_all(12:22);
yA_pv_cno = perf_A_all(12:22);
xB_pv_cno = PV_B_all(12:22);
yB_pv_cno = perf_B_all(12:22);

% Scatter
scatter(xA_pv_cno, yA_pv_cno, 60, 'filled', 'MarkerFaceColor', blue_light);
scatter(xB_pv_cno, yB_pv_cno, 60, 'filled', 'MarkerFaceColor', magenta_light);

% Best-fit lines
pA_pv_cno = polyfit(xA_pv_cno, yA_pv_cno, 1);
pB_pv_cno = polyfit(xB_pv_cno, yB_pv_cno, 1);

l3 = plot(xFit, polyval(pA_pv_cno, xFit), 'Color', blue_light, 'LineWidth', 2);
l4 = plot(xFit, polyval(pB_pv_cno, xFit), 'Color', magenta_light, 'LineWidth', 2);

ylim([0 1.2])
xlim([0 0.8])
xlabel('PV correlation')
ylabel('Performance')
title('PV (CNO)')

% Stats bottom-right
text(0.98,0.02,...
    sprintf('A: r = %.3f, p = %.3f\nB: r = %.3f, p = %.3f', ...
    r_A, p_A, r_B, p_B), ...
    'Units','normalized',...
    'HorizontalAlignment','right',...
    'VerticalAlignment','bottom')

hold off

% ===================== Shared Legend =====================
lgd = legend([l1 l2 l3 l4], ...
    {'A-Saline','B-Saline','A-CNO','B-CNO'}, ...
    'Orientation','horizontal', ...
    'Location','northoutside');
lgd.Box = 'off';

% Match axes sizes
linkaxes([ax1 ax2],'x')

% Global formatting
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14)
set(gcf,'Renderer','painters');