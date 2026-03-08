function plotBinwiseSignificanceBar(ax, sb, sig_bins, row_idx, varargin)
% row_idx = 1,2,3,... determines vertical stacking order

%% Parse inputs
p = inputParser;
p.addParameter('bar_height_frac',  0.03, @isscalar);
p.addParameter('bar_spacing_frac', 0.06, @isscalar);
p.addParameter('sig_color', [0.85 0.10 0.10]);
p.addParameter('ns_color',  [0.75 0.75 0.75]);
p.parse(varargin{:});

bar_height_frac  = p.Results.bar_height_frac;
bar_spacing_frac = p.Results.bar_spacing_frac;
sig_color = p.Results.sig_color;
ns_color  = p.Results.ns_color;

%% Setup
hold(ax,'on');

sig_bins = sig_bins(:)';
n_bins   = numel(sb);
dx       = mean(diff(sb));

%% Axis geometry
yl      = ylim(ax);
y_range = diff(yl);

bar_height  = bar_height_frac  * y_range;
bar_spacing = bar_spacing_frac * y_range;

% <-- THIS is the key line
y_center = yl(2) + row_idx * bar_spacing;

y_bottom = y_center - bar_height/2;
y_top    = y_center + bar_height/2;

%% Draw patches
for b = 1:n_bins
    x_left  = sb(b) - dx/2;
    x_right = sb(b) + dx/2;

    face_col = ns_color;
    if sig_bins(b)
        face_col = sig_color;
    end

    patch(ax, ...
        [x_left x_right x_right x_left], ...
        [y_bottom y_bottom y_top y_top], ...
        face_col, ...
        'EdgeColor','none');
end

%% Expand ylim enough to show all rows
ylim(ax, [yl(1) yl(2) + (row_idx+1)*bar_spacing]);

end