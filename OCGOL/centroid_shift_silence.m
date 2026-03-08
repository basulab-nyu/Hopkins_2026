function [theta, unit_vectors, circular_mean_rad, circular_mean_cm] = centroid_shift_silence(pathName)
    %Need to load in tuned_logicals, ROI_assign_multi, and pf_vector_max for
    load(fullfile(pathName,'pf_vector_max.mat')); %Tuning vectors
    load(fullfile(pathName,'tuned_logicals.mat')); %Logical of tuned cells

    subDir=fullfile(pathName,'filtered_match_ROI'); %directory containing cross registered ROIs
    matFiles = dir(fullfile(subDir, '*.mat'));
    if isempty(matFiles)
        error('No .mat files found in %s', subDir);
    end
    load(fullfile(subDir, matFiles(1).name)); %Matched cells 

    %Settings for sessions and trial types
    options.sessionSelect=[2 3]; %for saline vs cno
    options.selectTrial=[4 5];

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
                
                %complex vector
                %u{ss}{tt} = pf_vector_max{ss}{tt};
                u{ss}{tt}(ROI) = pf_vector_max{ss}{tt}(ROI);
                %cartesian converted
                uCar{ss}{tt}{ROI} = [real(u{ss}{tt}(ROI)), imag(u{ss}{tt}(ROI))];
            end
        end
    end
    
    for tt = options.selectTrial
        % --- Session 1 and 2 tuning selection ---
        if tt == 4
            tuned_s1 = tuned_logicals.tuned_log_filt_si{options.sessionSelect(1)}.allA;
            tuned_s2 = tuned_logicals.tuned_log_filt_si{options.sessionSelect(2)}.allA;
        else
            tuned_s1 = tuned_logicals.tuned_log_filt_si{options.sessionSelect(1)}.allB;
            tuned_s2 = tuned_logicals.tuned_log_filt_si{options.sessionSelect(2)}.allB;
        end
    
        % --- Find matched cells tuned in BOTH sessions ---
        validROIMatch = ~isnan(ROI_assign_multi_filtered(:,options.sessionSelect(1))) & ~isnan(ROI_assign_multi_filtered(:,options.sessionSelect(2)));
        validROI_filtered=ROI_assign_multi_filtered(validROIMatch,options.sessionSelect);

        tuned_both_idx = validROI_filtered( ...
            tuned_s1(validROI_filtered(:,1)) & ...
            tuned_s2(validROI_filtered(:,2)), :);
    
        % --- Extract data for those ROIs ---
        theta{tt} = centroid_angle_diff_btw_ROIs( ...
            uCar{options.sessionSelect(1)}{tt}(tuned_both_idx(:,1)), ...
            uCar{options.sessionSelect(2)}{tt}(tuned_both_idx(:,2)), ...
            pf_vector_max{1});
        
        tuned_both_idx_plot{tt}=tuned_both_idx;
    end
    
    tokens = regexp(pathName, '(MH\d+)', 'match');
    if ~isempty(tokens)
        mouseID = tokens{1};
    else
        mouseID = 'UnknownMouse';
    end

    for trial=options.selectTrial
        nMatched = numel(theta{trial});
        figure;
        nPlot = min(nMatched, 50);
        for ii=1:nPlot
            subplot(5,10,ii)
            compass(pf_vector_max{options.sessionSelect(1)}{trial}(tuned_both_idx_plot{trial}(ii,1)),'r')
            hold on;
            compass(pf_vector_max{options.sessionSelect(2)}{trial}(tuned_both_idx_plot{trial}(ii,2)),'r')
            diff_vector = exp(1i*theta{trial}(ii));
            compass(diff_vector,'k')
        end
        title(sprintf('%s - Trial %d', mouseID, trial));
   
        % Circular mean in radians 
        theta_values = theta{trial};
        unit_vectors{trial} = exp(1i * theta_values);
        mean_vector = mean(unit_vectors{trial});
        circular_mean_rad{trial} = angle(mean_vector);

        % Convert to degrees
        circular_mean_deg = circular_mean_rad{trial} * (180/pi);
        
        % Convert to distance along circular track (200 cm)
        track_length_cm = 200;
        circular_mean_cm{trial} = (circular_mean_deg / 360) * track_length_cm;
    end
end