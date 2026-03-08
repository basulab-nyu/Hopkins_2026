function results = friedman_stats(task_1, task_2, task_3, task_names, do_plot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% friedman_stats
%
% Nonparametric analysis for correlations across tasks and position
% Generates Figure-2 style bin-wise pairwise plots
%
% INPUTS:
%   friedman_stats(task_1, task_2)                  -> 2 tasks
%   friedman_stats(task_1, task_2, task_3)         -> 3 tasks
%   friedman_stats(task_1, task_2, task_3, names)  -> optional task names
%   friedman_stats(task_1, task_2, task_3, names, do_plot) -> optional logical flag to turn plotting on/off
%
%   - All inputs must be matrices of size (n_mice x n_bins)
%   - task_names: cell array of strings or string array, length = # tasks
%   - do_plot: logical scalar, true (default) to plot, false to suppress figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------- Parse inputs -------------------
if nargin < 2
    error('At least two task matrices are required');
end

tasks = {task_1, task_2};
n_tasks = 2;

if nargin >= 3 && ~isempty(task_3)
    tasks{3} = task_3;
    n_tasks = 3;
end

% Task names
if nargin < 4 || isempty(task_names)
    task_names = strcat("task", string(1:n_tasks));
else
    assert(numel(task_names) == n_tasks, 'Number of task names must match number of tasks');
end

% Plotting flag
if nargin < 5 || isempty(do_plot)
    do_plot = true;
else
    assert(islogical(do_plot) && isscalar(do_plot), ...
        'do_plot must be a logical scalar (true/false)');
end

% ------------------- Checks -------------------
for i = 1:n_tasks
    assert(ismatrix(tasks{i}), 'All inputs must be matrices');
end

% Compare sizes
sz = size(tasks{1});
for i = 2:n_tasks
    assert(isequal(size(tasks{i}), sz), 'All matrices must be the same size');
end

[n_mice, n_bins] = size(tasks{1});

%% ------------------- BIN-WISE TESTS -------------------

friedman_p = nan(n_bins,1);
pairwise_p = nan(n_bins, nchoosek(n_tasks,2));
pair_labels = strings(nchoosek(n_tasks,2),1);  % Column vector for table compatibility

% Generate contrast labels
idx = 1;
for i = 1:n_tasks-1
    for j = i+1:n_tasks
        pair_labels(idx) = task_names{i} + "-" + task_names{j};
        idx = idx + 1;
    end
end

for b = 1:n_bins
    X = nan(n_mice, n_tasks);
    for t = 1:n_tasks
        X(:,t) = tasks{t}(:,b);
    end

    if any(isnan(X),'all'), continue; end

    % Omnibus (only if 3 tasks)
    if n_tasks == 3
        friedman_p(b) = friedman(X,1,'off');
    end

    % Pairwise
    idx = 1;
    for i = 1:n_tasks-1
        for j = i+1:n_tasks
            pairwise_p(b,idx) = signrank(X(:,i), X(:,j));
            idx = idx + 1;
        end
    end
end

%% ------------------- FDR -------------------

if n_tasks == 3
    friedman_p_fdr = mafdr(friedman_p,'BHFDR',true);
    friedman_sig   = friedman_p_fdr < 0.05;
else
    friedman_p_fdr = [];
    friedman_sig   = [];
end

pairwise_p_fdr = mafdr(pairwise_p(:),'BHFDR',true);
pairwise_p_fdr = reshape(pairwise_p_fdr, size(pairwise_p));

%% ------------------- TABLES -------------------

if n_tasks == 3
    friedman_table = table( ...
        (1:n_bins)', friedman_p, friedman_p_fdr, friedman_sig, ...
        'VariableNames',{'pos_bin','friedman_p','friedman_p_fdr','sig_fdr_0_05'});
    friedman_sig_table = friedman_table(friedman_sig,:);
else
    friedman_table = [];
    friedman_sig_table = [];
end

[pos_idx, c_idx] = ndgrid(1:n_bins, 1:size(pairwise_p,2));

pairwise_table = table( ...
    pos_idx(:), pair_labels(c_idx(:)), ...
    pairwise_p(:), pairwise_p_fdr(:), pairwise_p_fdr(:)<0.05, ...
    'VariableNames',{'pos_bin','contrast','p','p_fdr','sig_fdr_0_05'});

pairwise_sig_table = pairwise_table(pairwise_table.sig_fdr_0_05,:);

%% ------------------- GLOBAL TESTS -------------------

X_all = cat(3, tasks{:});
X_mean = squeeze(mean(X_all,2,'omitnan'));   % mice x tasks

if n_tasks == 3
    p_task_overall = friedman(X_mean,1,'off');
else
    p_task_overall = [];
end

p_pairwise_global = nan(size(pairwise_p,2),1);
idx = 1;
for i = 1:n_tasks-1
    for j = i+1:n_tasks
        p_pairwise_global(idx) = signrank(X_mean(:,i), X_mean(:,j));
        idx = idx + 1;
    end
end

p_pairwise_global_fdr = mafdr(p_pairwise_global,'BHFDR',true);

%% ------------------- PLOTS -------------------
if do_plot
    colors = lines(n_tasks);
    figure; hold on;

    for t = 1:n_tasks
        mu  = mean(tasks{t},1,'omitnan');
        sem = std(tasks{t},0,1,'omitnan') ./ sqrt(sum(~isnan(tasks{t}),1));
        fill([1:n_bins fliplr(1:n_bins)], ...
             [mu-sem fliplr(mu+sem)], ...
             colors(t,:), 'FaceAlpha',0.2,'EdgeColor','none');
        plot(1:n_bins,mu,'LineWidth',1.2,'Color',colors(t,:));
    end

    xlabel('Position (bin index)');
    ylabel('Correlation');
    title('Correlation across position (mean ± SEM)');
    legend(task_names); box off;

    if n_tasks == 3
        figure;
        plot(1:n_bins,friedman_p_fdr,'k','LineWidth',1);
        hold on; yline(0.05,'--');
        xlabel('Position (bin index)');
        ylabel('Friedman p (FDR)');
        title('Bin-wise omnibus task differences');
        box off;
    end

    %% ------------------- FIGURE-2 STYLE BIN-WISE PAIRWISE PLOTS -------------------
    for c = 1:length(pair_labels)
        figure;
        plot(1:n_bins, pairwise_p_fdr(:,c), 'LineWidth',1.2);
        hold on; yline(0.05,'--','Color','r');
        xlabel('Position (bin index)');
        ylabel('Paired Wilcoxon p (FDR)');
        title(pair_labels(c) + " (bin-wise, FDR corrected)");
        box off;
    end
end  % do_plot

%% ------------------- OUTPUT -------------------

results.task_names = task_names;
results.do_plot = do_plot;

results.friedman_table = friedman_table;
results.friedman_sig_table = friedman_sig_table;

results.pairwise_table = pairwise_table;
results.pairwise_sig_table = pairwise_sig_table;

results.global.p_task_overall = p_task_overall;
results.global.p_pairwise = p_pairwise_global;
results.global.p_pairwise_fdr = p_pairwise_global_fdr;

end
