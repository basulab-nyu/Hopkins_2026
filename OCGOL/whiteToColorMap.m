function cmap = whiteToColorMapSymmetric(rgb_max, n_colors)
% whiteToColorMapSymmetric creates a colormap that goes from light rgb_max
% (towards white), through rgb_max, to dark rgb_max (towards black)
%
% Inputs:
%   rgb_max   - 1x3 vector with RGB color values in [0, 255]
%   n_colors  - (optional) Number of colors in the colormap (default: 17)
%
% Output:
%   cmap      - n_colors-by-3 colormap matrix

    if nargin < 2
        n_colors = 17;  % Default number of colors
    end

    % Ensure odd number of colors to place rgb_max in the center
    if mod(n_colors, 2) == 0
        error('n_colors must be an odd number to place rgb_max in the center.');
    end

    half_n = (n_colors - 1) / 2;

    % Create upper half: white to rgb_max
    light_rgb = rgb_max + (1 - rgb_max) * 0.9;  % Lightened version, closer to white
    light_rgb = min(light_rgb, 1);              % Clamp values to [0,1]

    r1 = linspace(light_rgb(1), rgb_max(1), half_n)';
    g1 = linspace(light_rgb(2), rgb_max(2), half_n)';
    b1 = linspace(light_rgb(3), rgb_max(3), half_n)';

    % Create lower half: rgb_max to dark version (multiply by factor)
    dark_rgb = rgb_max * 0.05;  % Darkened version

    r2 = linspace(rgb_max(1), dark_rgb(1), half_n)';
    g2 = linspace(rgb_max(2), dark_rgb(2), half_n)';
    b2 = linspace(rgb_max(3), dark_rgb(3), half_n)';

    % Combine: [light → rgb_max → dark]
    cmap = [r1 g1 b1; rgb_max; r2 g2 b2];

end