function [centersDistr] = pf_centroidDistr(centMatrix)
    edges=[0:5:100];
    centers=cat(1, centMatrix{:})';
    centers=(centers(~isnan(centers)));
    
    empty_cells = cellfun(@isempty, centMatrix);
    nan_cells = cellfun(@(x) any(isnan(x)), centMatrix);
    indices = find(~empty_cells & ~nan_cells);
    
    centersDistr= histcounts(centers,edges)/length(centers);
end