function results = binwise_vs_value(data, ref_value, do_plot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% binwise_vs_value
%
% One-sample bin-wise test of whether each bin differs from ref_value
% Uses Wilcoxon signed-rank test (nonparametric)
%
% INPUTS:
%   data       : (n_mice x n_bins) matrix
%   ref_value  : scalar reference value (e.g. 0.05)
%   do_plot    : logical (default = true)
%
% OUTPUT:
%   results.p_raw
%   results.p_fdr
%   results.sig_fdr
%   results.table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2 || isempty(ref_value)
    ref_value = 0.05;
end

if nargin < 3 || isempty(do_plot)
    do_plot = true;
end

assert(ismatrix(data), 'Input must be n_mice x n_bins');

[n_mice, n_bins] = size(data);

%% ------------------- BIN-WISE TESTS -------------------

p_raw = nan(n_bins,1);

for b = 1:n_bins
    x = data(:,b);
    if all(isnan(x))
        continue
    end
    p_raw(b) = signrank(x, ref_value);
end

%% ------------------- FDR CORRECTION -------------------

p_fdr = mafdr(p_raw, 'BHFDR', true);
sig_fdr = p_fdr < 0.05;

%% ------------------- TABLE -------------------

results.table = table( ...
    (1:n_bins)', p_raw, p_fdr, sig_fdr, ...
    'VariableNames', {'bin','p','p_fdr','sig_fdr_0_05'});

results.p_raw   = p_raw;
results.p_fdr   = p_fdr;
results.sig_fdr = sig_fdr;
results.ref_value = ref_value;

%% ------------------- OPTIONAL PLOT -------------------

if do_plot
    mu  = mean(data,1,'omitnan');
    sem = std(data,0,1,'omitnan') ./ sqrt(sum(~isnan(data),1));

    figure; hold on
    fill([1:n_bins fliplr(1:n_bins)], ...
         [mu-sem fliplr(mu+sem)], ...
         [0.7 0.7 0.7], ...
         'EdgeColor','none','FaceAlpha',0.4);
    plot(1:n_bins, mu, 'k', 'LineWidth',1.5);

    yline(ref_value,'--r','LineWidth',1);

    xlabel('Position (bin)');
    ylabel('Value');
    title(sprintf('Bin-wise test vs %.3f (mean ± SEM)', ref_value));
    box off
end

end