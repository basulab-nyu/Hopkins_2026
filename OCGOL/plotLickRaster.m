function plotLickRaster(lick_matrix)
% plotLickRaster - Creates a raster plot of lick events with jittered vertical tick marks
%
% Syntax: plotLickRaster(lick_matrix)
%
% Input:
%    lick_matrix - m x 100 matrix, where each element is the number of licks
%                  in a given spatial bin (columns) for each lap (rows)
%
% The function plots one vertical tick mark per lick with jitter within each spatial bin.

[m, n_bins] = size(lick_matrix);

hold on;

tick_height = 0.4; % height of each tick mark

% Calculate bin width when mapping 1:100 to 0:200
bin_width = 200 / n_bins;

for lap = 1:m
    for bin = 1:n_bins
        n_licks = lick_matrix(lap, bin);
        if n_licks > 0
            % jitter x positions within bin range [bin, bin+1)
            x_start = (bin - 1) * bin_width;
            x = x_start + rand(1, n_licks) * bin_width;
            y_center = lap; % y position
            
            % Plot vertical ticks for each lick
            for i = 1:n_licks
                plot([x(i), x(i)], [y_center - tick_height/2, y_center + tick_height/2], 'k');
            end
        end
    end
end

xlabel('Position');
ylabel('Lap');
xlim([0 200]);
ylim([-0.1 m+0.9]); % slightly extend limits so ticks at 0 and m are not forced
set(gca, 'YDir', 'reverse'); % lap 1 on top
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 14);
set(gcf, 'Renderer', 'painters')

hold off;
end