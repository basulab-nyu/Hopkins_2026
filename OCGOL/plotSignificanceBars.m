% function plotSignificanceBars(ax, sb, results, varargin)
% % For use with output 'results' from function friedman_stats.m 
% % plotSignificanceBars  Draw horizontal significance bars above a plot
% %
% % plotSignificanceBars(ax, sb, results)
% % plotSignificanceBars(ax, sb, results, 'sig_thresh', 0.05, ...
% %                                      'bar_height', 0.01, ...
% %                                      'bar_spacing', 0.1)
% %
% % INPUTS
% %   ax      - axis handle (e.g., gca)
% %   sb      - x-bin centers or edges used in the plot
% %   results - struct containing pairwise_table with fields:
% %               .contrast
% %               .sig_fdr_0_05
% %
% % NAME-VALUE PAIRS
% %   sig_thresh  - significance threshold (default = 0.05)
% %   bar_height  - thickness of each bar (default = 0.01)
% %   bar_spacing - vertical spacing between bars (default = 0.1)
% 
% %% Parse inputs
% p = inputParser;
% p.addParameter('sig_thresh', 0.05, @isscalar);
% p.addParameter('bar_height', 0.01,  @isscalar);
% p.addParameter('bar_spacing', 0.1,   @isscalar);
% p.parse(varargin{:});
% 
% sig_thresh  = p.Results.sig_thresh; %#ok<NASGU>
% bar_height  = p.Results.bar_height;
% bar_spacing = p.Results.bar_spacing;
% 
% %% Setup
% hold(ax,'on');
% 
% n_bins = numel(sb);
% 
% contrasts   = unique(results.pairwise_table.contrast,'stable');
% n_contrasts = numel(contrasts);
% 
% % Build significance matrix: bins × contrasts
% sig_mat = false(n_bins, n_contrasts);
% for c = 1:n_contrasts
%     rows = strcmp(results.pairwise_table.contrast, contrasts(c));
%     sig_mat(:,c) = results.pairwise_table.sig_fdr_0_05(rows);
% end
% 
% %% Determine bar placement
% yl = ylim(ax);
% y_start = yl(2) + bar_spacing;
% 
% %% Colormap: gray = n.s., red = sig
% cmap = [0.75 0.75 0.75;   % not significant
%         0.85 0.10 0.10]; % significant
% colormap(ax, cmap);
% set(ax,'CLim',[0 1]);
% 
% %% Draw bars
% for c = 1:n_contrasts
% 
%     y_center = y_start + (c-1)*bar_spacing;
%     y_bottom = y_center - bar_height/2;
%     y_top    = y_center + bar_height/2;
% 
%     imagesc(ax, ...
%         [sb(1) sb(end)], ...
%         [y_bottom y_top], ...
%         sig_mat(:,c)');
% 
%     % Label bar
%     text(ax, ...
%         sb(end) + range(sb)*0.01, ...
%         y_center, ...
%         contrasts(c), ...
%         'VerticalAlignment','middle', ...
%         'FontSize',9);
% end
% 
% %% Expand ylim so bars are visible
% ylim(ax, [yl(1) y_start + n_contrasts*bar_spacing]);
% 
% end
function plotSignificanceBars(ax, sb, results, varargin)
% For use with output 'results' from function friedman_stats.m
% Draw horizontal significance bars using PATCH (vector-safe)

%% Parse inputs
p = inputParser;
p.addParameter('sig_thresh', 0.05, @isscalar);
p.addParameter('bar_height_frac',  0.03, @isscalar);  % fraction of y-range
p.addParameter('bar_spacing_frac', 0.06, @isscalar);  % fraction of y-range
p.addParameter('sig_color',  [0.85 0.10 0.10]);
p.addParameter('ns_color',   [0.75 0.75 0.75]);
p.parse(varargin{:});

bar_height_frac  = p.Results.bar_height_frac;
bar_spacing_frac = p.Results.bar_spacing_frac;
sig_color = p.Results.sig_color;
ns_color  = p.Results.ns_color;

%% Setup
hold(ax,'on');

n_bins = numel(sb);
dx = mean(diff(sb));  % bin width estimate

contrasts   = unique(results.pairwise_table.contrast,'stable');
n_contrasts = numel(contrasts);

% Build significance matrix: bins × contrasts
sig_mat = false(n_bins, n_contrasts);
for c = 1:n_contrasts
    rows = strcmp(results.pairwise_table.contrast, contrasts(c));
    sig_mat(:,c) = results.pairwise_table.sig_fdr_0_05(rows);
end

%% Axis-scaled geometry
yl = ylim(ax);
y_range = diff(yl);

bar_height  = bar_height_frac  * y_range;
bar_spacing = bar_spacing_frac * y_range;

y_start = yl(2) + bar_spacing;

%% Draw bars
for c = 1:n_contrasts

    y_center = y_start + (c-1)*bar_spacing;
    y_bottom = y_center - bar_height/2;
    y_top    = y_center + bar_height/2;

    for b = 1:n_bins

        x_left  = sb(b) - dx/2;
        x_right = sb(b) + dx/2;

        if sig_mat(b,c)
            face_col = sig_color;
        else
            face_col = ns_color;
        end

        patch(ax, ...
            [x_left x_right x_right x_left], ...
            [y_bottom y_bottom y_top y_top], ...
            face_col, ...
            'EdgeColor','none');
    end

    % Contrast label
    text(ax, ...
        sb(end) + range(sb)*0.01, ...
        y_center, ...
        contrasts(c), ...
        'VerticalAlignment','middle', ...
        'FontSize',9);
end

%% Expand ylim so bars are visible
ylim(ax, [yl(1) y_start + n_contrasts*bar_spacing]);

end
