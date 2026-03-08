function dataStruct = processCaDynamics_sdur(matchedMice,ca_files,trialType,sampleTime)
% Computes calcium dynamics and avg event trace for all matched mice
% matchedMice: cell array of names of mice with a matching RF and OCGOL
% session 
% ca_files: cell array of ca analysis .mat file names for matched mice
% trialType: 1= RF, 4= A trials, 5= B trials
%sampleTime: size of time window for average event trace (for limiting to
%short duration events this will be 2 sec*30 Hz imaging)
% Returns a struct with various fields filled in per mouse

nMice = length(matchedMice);

%Event trace
dataStruct.CaDynamic.avgMouse_eventTrace= NaN(nMice,sampleTime);
dataStruct.CaDynamic.allROIMouse_eventTrace= cell(1,nMice);

%Event rate
dataStruct.CaDynamic.event_rate_mean= NaN(nMice,1);
dataStruct.CaDynamic.event_rate_all= cell(1,nMice);

%AUC
dataStruct.CaDynamic.eventAUC_mean=NaN(nMice,1);
dataStruct.CaDynamic.eventAUC_all=cell(1,nMice);

%Amplitude
dataStruct.CaDynamic.amp_mean=NaN(nMice,1);
dataStruct.CaDynamic.amp_all=cell(1,nMice);

%Duration
dataStruct.CaDynamic.dur_mean=NaN(nMice,1);
dataStruct.CaDynamic.dur_all=cell(1,nMice);
    
for i = 1:nMice
        %Load in calcium/event data for each mouse
        loaded = load(ca_files{i}, 'Behavior_split','Events_split');
        behavior = loaded.Behavior_split{1, trialType};
        events = loaded.Events_split{1, trialType};

        %calculate event rate during run
        run_dur=(sum(behavior.run_ones)/30)/60;
        dataStruct.CaDynamic.event_rate_all{i}=events.Run.properties.nb_events/run_dur;
        mean_event_rate= mean(events.Run.properties.nb_events/run_dur); 
        dataStruct.CaDynamic.event_rate_mean(i)=mean_event_rate;   
        
        %collect duration
        all_durs= [events.Run.properties.duration{~cellfun(@isempty,events.Run.properties.duration)}];
        dataStruct.CaDynamic.dur_all{i}=all_durs;
        dataStruct.CaDynamic.dur_mean(i)=nanmean(all_durs);
        
        durations = events.Run.properties.duration; % original cell array
        binarizedDur = cell(size(durations)); % preallocate output cell array
        
        for roi = 1:numel(durations)
            if ~isempty(durations{roi})
                % Create binary vector: 1 if duration <= sample time in seconds, else 0
                frameRate = 30;
                durationThresholdSec = sampleTime / frameRate;
                binarizedDur{roi} = durations{roi} <= durationThresholdSec;
            else
                % If empty, just assign empty
                binarizedDur{roi} = [];
            end
        end
        % store the binarized durations in the data structure
        dataStruct.CaDynamic.dur_binarized{i} = binarizedDur;
        
        %calculate average event trace for all short duration events------
        % Initialize output for event traces <=2 seconds
        allValidTraces = [];
        
        % Loop through each ROI
        for roi = 1:numel(dataStruct.CaDynamic.dur_binarized{i})
            
            binarized = dataStruct.CaDynamic.dur_binarized{i}{roi};  % Logical vector
            traces = events.Run.properties.trace{roi};            % Cell array of event traces
            
            % Skip if empty or mismatched
            if isempty(binarized) || isempty(traces) || length(binarized) ~= length(traces)
                continue;
            end
        
            % Loop through events for this ROI
            for evt = 1:length(traces)
                if binarized(evt)  % Only process events ≤ 2 seconds
                    trace = traces{evt}';  % Get the trace
                    len = length(trace);

                    % Pad trace to sample time with NaNs if needed
                    if len < sampleTime
                        trace = [trace, NaN(1, sampleTime - len)];
                    end
                    allValidTraces = [allValidTraces; trace];  % Append
                end
            end
        end
        dataStruct.CaDynamic.allROIMouse_eventTrace{i}=allValidTraces;
        dataStruct.CaDynamic.avgMouse_eventTrace(i,:)=nanmean(allValidTraces);  

        %collect AUC---------------------------------------------------
        allAUC = [];
        % Loop through each ROI
        for roi = 1:numel(dataStruct.CaDynamic.dur_binarized{i})
            
            binarized = dataStruct.CaDynamic.dur_binarized{i}{roi};  % Logical vector of short events for given roi
            AUCs = events.Run.properties.AUC{roi};            % Vector of AUC for all duration events for a given ROI
            
            % Skip if empty or mismatched
            if isempty(binarized) || isempty(AUCs) || length(binarized) ~= length(AUCs)
                continue;
            end     
            AUC_roi = AUCs(binarized)';  % Get the AUC for short events
            allAUC = [allAUC; AUC_roi];  % Append
        end
        dataStruct.CaDynamic.eventAUC_all{i}=allAUC;
        dataStruct.CaDynamic.eventAUC_mean(i)=nanmean(allAUC);

        %collect amplitude---------------------------------------------
        allAmp = [];
        % Loop through each ROI
        for roi = 1:numel(dataStruct.CaDynamic.dur_binarized{i})
            
            binarized = dataStruct.CaDynamic.dur_binarized{i}{roi};  % Logical vector of short events for given roi
            amps = events.Run.properties.amplitude{roi};            % Vector of amplitude for all duration events for a given ROI
            
            % Skip if empty or mismatched
            if isempty(binarized) || isempty(amps) || length(binarized) ~= length(amps)
                continue;
            end     
            amp_roi = amps(binarized)';  % Get the amplitude for short events
            allAmp = [allAmp; amp_roi];  % Append
        end
        dataStruct.CaDynamic.amp_all{i}=allAmp;
        dataStruct.CaDynamic.amp_mean(i)=nanmean(allAmp);

end

