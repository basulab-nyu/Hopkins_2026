
magenta= [0.8 0 0.6];
blue= [0 0.4 1];
yellow= [0.97 0.58 0.11];
blue_light = blue + 0.50 * (1 - blue);
cmap_yellow=whiteToColorMap(yellow);
cmap_blue=whiteToColorMap(blue);
cmap_magenta=whiteToColorMap(magenta);

sb = 0:2:200;
A_sel=tuned_logicals.tuned_log_filt_si{1,2}.onlyA;
A_sel_STC = Place_cell{1,4}.Spatial_tuning_curve(:,A_sel)';
[~, peakPos] = max(A_sel_STC, [], 2); 
[~, sortIdx] = sort(peakPos, 'ascend');
A_sel_STC_sorted = A_sel_STC(sortIdx, :);

B_sel=tuned_logicals.tuned_log_filt_si{1,2}.onlyB;
B_sel_STC = Place_cell{1,5}.Spatial_tuning_curve(:,B_sel)';
[~, peakPos] = max(B_sel_STC, [], 2); 
[~, sortIdx] = sort(peakPos, 'ascend');
B_sel_STC_sorted = B_sel_STC(sortIdx, :);
%%
figure
subplot(1,2,1)
imagesc([sb(1) sb(end)],[1 size(A_sel_STC_sorted,1)],A_sel_STC_sorted)
colormap(gca,cmap_blue);
caxis([0 1])
xline(sb(70),'k--','LineWidth',2)
xlabel('Position bin')
ylabel('Neuron (sorted by peak)')

subplot(1,2,2)
imagesc([sb(1) sb(end)],[1 size(B_sel_STC_sorted,1)],B_sel_STC_sorted)
colormap(gca,cmap_magenta);
caxis([0 1])
xline(sb(30),'k--','LineWidth',2)
xlabel('Position bin')
ylabel('Neuron (sorted by peak)')
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters');