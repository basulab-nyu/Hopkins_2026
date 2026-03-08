function [matching_list] = filter_match_tuning_crit(matching_list,tunedLogical,select_fields,options)

%original is the already manually filtered list

%si all A tuned; all B tuned
matching_list.si_Aall_filt = matching_list.original;


%si all A tuned; all B tuned
matching_list.ts_Aall_filt = matching_list.original;

%for SI A filt (any A regardless of B tuning)
for ss=options.sessionSelect
    %get idxs
    idx_temp = find(tunedLogical(ss).si.Atuned  == 1);
    %get logical with values that are si tuned
    keep_idx_log = ismember(matching_list.si_Aall_filt(:,ss),idx_temp);
    %set the negative of the log to nan (no match based on tuning criterion
    matching_list.si_Aall_filt(~keep_idx_log,ss) = nan;

end




%for TS A filt (any A regardless of B tuning)
for ss=options.sessionSelect
    %get idxs
    idx_temp = find(tunedLogical(ss).ts.Atuned   == 1);
    %get logical with values that are si tuned
    keep_idx_log = ismember(matching_list.ts_Aall_filt(:,ss),idx_temp);
    %set the negative of the log to nan (no match based on tuning criterion
    matching_list.ts_Aall_filt(~keep_idx_log,ss) = nan;

end




end

