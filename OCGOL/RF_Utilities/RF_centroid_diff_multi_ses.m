function [cent_diff,pf_vector_max] = centroid_diff_multi_ses(session_vars,tunedLogical, pf_vector,field_event_rates,select_fields,registered,options)

%% Import variables

%matching_list = registered.multi.assigned_all;


%% Define tuned combinations

switch options.tuning_criterion
    case 'si' %spatial information
        %for each session
        for ss =options.sessionSelect
            %spatial information criterion
            Atuned{ss} = tunedLogical(ss).si.Atuned;        
            all_neurons{ss} = true(size(Atuned{ss}));
        end
   case 'ts' %spatial information 
        for ss =options.sessionSelect
            %spatial information criterion
            Atuned{ss} = tunedLogical(ss).ts.Atuned;        
            all_neurons{ss} = true(size(Atuned{ss}));
        end
end

%% Extract tuning spec structs and assign reward location
%tuning specificities struct for each session
for ss=options.sessionSelect
    for tt=options.selectTrial
        %original TS
        ts{ss}{tt} = session_vars{ss}.Place_cell{tt}.Tuning_Specificity;
        %tuning vectors for each ROI
        %tun_vectors{ss}{tt} = session_vars{ss}.Place_cell{tt}.Tuning_Specificity.tuning_vector;
        %original sum vector
        tun_vector{ss}{tt} = session_vars{ss}.Place_cell{tt}.Tuning_Specificity.tuning_vector_specificity;

        place_field_centers{ss}{tt} = session_vars{ss}.Place_cell{tt}.placeField.center;
        %cm
        %rewardLoc(ii) = session_vars{ii}.Behavior.performance.reward_loc;
    end
end
    
%% Get index of max intensity for place field vector

for ss=options.sessionSelect
    %for each trial (A or B) regardless if correct
    for tt=options.selectTrial
        %for each ROI
        for rr =1:size(field_event_rates{ss}{tt},2)
            %if more than 1 field
            if size(field_event_rates{ss}{tt}{rr},2) > 1
                [~,max_transient_peak{ss}{tt}(rr)] = max(field_event_rates{ss}{tt}{rr});

            elseif size(field_event_rates{ss}{tt}{rr},2) == 1 %if 1
                max_transient_peak{ss}{tt}(rr) = 1;
            else
                max_transient_peak{ss}{tt}(rr) = nan;
            end
        end
    end
end

%%  Maximum transient intensity tuning vectors (select) and bin centers (100 bin space)

%select the place field vectors based on the max intensity analysis
for ss=options.sessionSelect
    %for each trial (A or B) regardless if correct
    for tt=options.selectTrial
        %for each ROI
        for rr=1:size(pf_vector{ss}{tt},2)
            %if not empty
            if ~isempty(pf_vector{ss}{tt}{rr})
                %if single field, use original vector
                if size(pf_vector{ss}{tt}{rr},2) == 1
                    pf_vector_max{ss}{tt}(rr) = pf_vector{ss}{tt}{rr}(max_transient_peak{ss}{tt}(rr));
                    place_field_centers_max{ss}{tt}(rr) = place_field_centers{ss}{tt}{rr}(max_transient_peak{ss}{tt}(rr));

                    %pf_vector_max{ss}{tt}(rr) = tun_vector{ss}{tt}(rr);
                    %place field bin center
                    %place_field_centers_max{ss}{tt}(rr) = place_field_centers{ss}{tt}{rr};
                else %if more than 1
                    pf_vector_max{ss}{tt}(rr) = pf_vector{ss}{tt}{rr}(max_transient_peak{ss}{tt}(rr));
                    place_field_centers_max{ss}{tt}(rr) = place_field_centers{ss}{tt}{rr}(max_transient_peak{ss}{tt}(rr));
                end
            else
                pf_vector_max{ss}{tt}(rr) = nan;
                place_field_centers_max{ss}{tt}(rr) = nan;
            end
        end
    end
end

%% Bin location of corresponding centroid (signifcant PFs using select_fields as input)
%select the place field vectors based on the max intensity analysis
for ss=options.sessionSelect
    %for each trial (A or B) regardless if correct
    for tt=options.selectTrial
        %for each ROI
        for rr=1:size(pf_vector{ss}{tt},2)
            %if not empty
            if ~isempty(pf_vector{ss}{tt}{rr})
                %if single field, use original vector
                if size(pf_vector{ss}{tt}{rr},2) == 1
                    %pf_vector_max{ss}{tt}(rr) = tun_vector{ss}{tt}(rr);
                    %place field bin center
                    place_field_centers_select_all{ss}{tt}{rr} = place_field_centers{ss}{tt}{rr}(select_fields{ss}{tt}{rr}');
                else %if more than 1
                    %pf_vector_max{ss}{tt}(rr) = pf_vector{ss}{tt}{rr}(max_transient_peak{ss}{tt}(rr));
                    place_field_centers_select_all{ss}{tt}{rr} = place_field_centers{ss}{tt}{rr}(select_fields{ss}{tt}{rr}');
                end
            else
                %pf_vector_max{ss}{tt}(rr) = nan;
                place_field_centers_select_all{ss}{tt}{rr} = nan;
            end
        end
    end
end
%% Get centroid of max peak (MH added 2/12/26)
for ss = options.sessionSelect
    for tt = options.selectTrial
        for rr = 1:length(max_transient_peak{ss}{tt})
            
            if ~isnan(max_transient_peak{ss}{tt}(rr)) && ...
               ~isempty(place_field_centers{ss}{tt}{rr})
               
                peak_idx = max_transient_peak{ss}{tt}(rr);
                
                place_field_centers_max{ss}{tt}(rr) = ...
                    place_field_centers{ss}{tt}{rr}(peak_idx);
            else
                place_field_centers_max{ss}{tt}(rr) = nan;
            end
        end
    end
end

%% Get each tuning vector (complex and cartesian) for each max place field vector

%for each session
for ss=options.sessionSelect
    %for each trial
    for tt=options.selectTrial
        %for each ROI in that session
        for ROI = 1:size(pf_vector_max{ss}{tt},2)
            %get angle for that ROI from each session relative to 0
            %angle of each vector
            %ang{ss}{tt} = angle(pf_vector_max{ss}{tt});
            ang{ss}{tt}(ROI) = angle(pf_vector_max{ss}{tt}(ROI));
            %ang{ss}(ROI) = angle(ts{ss}.tuning_vector_specificity(ROI));
            
            %complex vector
            %u{ss}{tt} = pf_vector_max{ss}{tt};
            u{ss}{tt}(ROI) = pf_vector_max{ss}{tt}(ROI);
            %u{ss}(ROI) = ts{ss}.tuning_vector_specificity(ROI);
            %cartesian converted
            %uCar{ss}{tt} = [real(u{ss}{tt})', imag(u{ss}{tt})'];
            uCar{ss}{tt}{ROI} = [real(u{ss}{tt}(ROI)), imag(u{ss}{tt}(ROI))];
            %uCar{ss}{ROI} = [real(u{ss}(ROI)), imag(u{ss}(ROI))];
        end
    end
end


%% Export centroid bins
for ss = options.sessionSelect
    
    nTrials = length(options.selectTrial);
    nROIs   = length(place_field_centers_max{ss}{options.selectTrial(1)});
    
    comb_place_field_max{ss} = nan(nTrials, nROIs);
    
    for tt_idx = 1:nTrials
        tt = options.selectTrial(tt_idx);
        comb_place_field_max{ss}(tt_idx,:) = ...
            place_field_centers_max{ss}{tt};
    end
end

%place field bin centers for all fields with significant fields (min 5
%event on distinct laps and PFs id'd using PF_finder
cent_diff.all_sig_bin = place_field_centers_select_all;
cent_diff.max_bin = comb_place_field_max;
end

