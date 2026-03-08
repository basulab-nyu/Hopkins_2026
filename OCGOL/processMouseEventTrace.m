function [avgROITraces, avgMouseTrace] = processMouseEventTrace(traceData, sampleTime)
% Process calcium event traces for a single mouse
% traceData: cell array of ROIs, each containing event traces
% sampleTime: number of timepoints to extract from each event
% Returns:
%   avgROITraces: [nROIs x sampleTime] matrix, each row is the average trace per ROI
%   avgMouseTrace: [1 x sampleTime] mean trace across all ROIs

    nROIs = length(traceData);
    avgROITraces = NaN(nROIs, sampleTime);

    for i_roi = 1:nROIs
        roiEvents = traceData{i_roi};
        if isempty(roiEvents), continue; end

        nEvents = length(roiEvents);
        roi_trace = NaN(nEvents, sampleTime);

        for i_event = 1:nEvents
            thisEvent = roiEvents{i_event};
            if isempty(thisEvent), continue; end

            len = length(thisEvent);
            if len >= sampleTime
                roi_trace(i_event, :) = thisEvent(1:sampleTime);
            else
                roi_trace(i_event, 1:len) = thisEvent;
            end
        end

        avgROITraces(i_roi, :) = mean(roi_trace, 1, 'omitnan');
    end

    avgMouseTrace = mean(avgROITraces, 1, 'omitnan');
end