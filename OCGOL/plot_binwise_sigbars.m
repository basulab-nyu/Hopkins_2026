function plot_binwise_sigbars(ax, sig_bins, x_vals, y_level, bar_height)

axes(ax); hold on

sig_bins = sig_bins(:)';
edges = diff([0 sig_bins 0]);
starts = find(edges == 1);
ends   = find(edges == -1) - 1;

for i = 1:numel(starts)
    x1 = x_vals(starts(i));
    x2 = x_vals(ends(i));
    patch([x1 x2 x2 x1], ...
          [y_level y_level y_level+bar_height y_level+bar_height], ...
          'k', 'EdgeColor','none');
end
end