function dataStruct = processCaDynamics(matchedMice,ca_files,trialType,sampleTime)
% Computes calcium dynamics and avg event trace for all matched mice
% matchedMice: cell array of names of mice with a matching RF and OCGOL
% session 
% ca_files: cell array of ca analysis .mat file names for matched mice
% trialType: 1= RF, 4= A trials, 5= B trials
%sampleTime: size of time window for average event trace (typically have
%this set to 4-6 seconds w/ 30 Hz imaging frequency)
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

        %calculate average event trace for each roi for each mouse
        %processMouseEventTrace
        [avgROI_trace, avgMouse_trace] = processMouseEventTrace(events.Run.properties.trace, sampleTime);
        dataStruct.CaDynamic.avgMouse_eventTrace(i,:)=avgMouse_trace;
        dataStruct.CaDynamic.allROIMouse_eventTrace{i}=avgROI_trace;


        %calculate event rate during run
        run_dur=(sum(behavior.run_ones)/30)/60;
        dataStruct.CaDynamic.event_rate_all{i}=events.Run.properties.nb_events/run_dur;
        mean_event_rate= mean(events.Run.properties.nb_events/run_dur); 
        dataStruct.CaDynamic.event_rate_mean(i)=mean_event_rate;   

        %collect AUC
        nonEmptyCells = ~cellfun(@isempty, events.Run.properties.AUC);
        averages = cellfun(@mean, events.Run.properties.AUC(nonEmptyCells));
        dataStruct.CaDynamic.eventAUC_all{i}=averages;
        dataStruct.CaDynamic.eventAUC_mean(i)=mean(averages);

        %collect amplitude
        nonEmptyCells = ~cellfun(@isempty, events.Run.properties.amplitude);
        averages = cellfun(@mean, events.Run.properties.amplitude(nonEmptyCells));
        dataStruct.CaDynamic.amp_all{i}=averages;
        dataStruct.CaDynamic.amp_mean(i)=mean(averages);

        %collect duration
        nonEmptyCells = ~cellfun(@isempty, events.Run.properties.duration);
        averages = cellfun(@mean, events.Run.properties.duration(nonEmptyCells));
        dataStruct.CaDynamic.dur_all{i}=averages;
        dataStruct.CaDynamic.dur_mean(i)=mean(averages);

end