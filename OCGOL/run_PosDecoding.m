function result = run_PosDecoding(matFilePath, indiceValue, perfValue, downSamp)
% RUN_DECODING: Perform decoding analysis on matched_transients_all_ses.mat
%   Inputs:
%     matFilePath: full path to 'matched_transients_all_ses.mat'
%     indiceValue: trial type to use (2 or 3) - RF:3, OCGOLA:2, OCGOLB:3
%     perfValue: OCGOL=1,RF=0
%     downSamp: (optional) number of ROIs to randomly sample for downsampling
%   Outputs:
%     result: struct with performance and error metrics

    load(matFilePath, 'matching_ROI_bin_transient_lap_data');
    these = matching_ROI_bin_transient_lap_data;
    maxSessions = length(these);

    if nargin < 4 || isempty(downSamp)
        doDownSamp = false;
    else
        doDownSamp = true;
    end

    if doDownSamp
        rois=size(these{1}.transient_mat,1); %total number of rois in this condition (this number is the same regardless of the session since they are all matched)
        if downSamp > rois
             error('downSamp (%d) is greater than the number of available ROIs (%d)', downSamp, rois);
        end
        ds_rois= randperm(rois, downSamp); %randomly sampled index of the total rois in this condition to match the num ROIs in lesser condition (ex. RF)
    end
    % Output variables
    PERFORMANCE = NaN(1,maxSessions);
    ERROR = NaN(1,maxSessions);
    ERROR_SPEED = NaN(1,maxSessions);
    ERROR_allBin = cell(1,maxSessions);
    ERROR_SPEED_allBin = cell(1,maxSessions);

    for i_ses = 1:maxSessions
        this = these{i_ses};
        if doDownSamp
            this.transient_mat=this.transient_mat(ds_rois,:); %downsampled transient matrix to be random cells that match the number in other condition (ex.RF)
        end
        % Binning for position and speed
        N_BINS = 40;
        edgesPosition = linspace(0,1,N_BINS+1);
        centersPosition = center(edgesPosition);
        edgesSpeed = linspace(-5,30,N_BINS+1);
        centersSpeed = center(edgesSpeed);

        SM = 1;
        DT = nanmedian(diff(this.time));
        N_CELLS = size(this.transient_mat,1);

        % Trial filtering by type
        indice = find(this.trialType == indiceValue);

        this.run_state = this.run_state(indice);
        this.position_cm = this.position_cm(indice);
        this.position_norm = this.position_norm(indice);
        this.speed = this.speed(indice);
        this.lap_nb = this.lap_nb(indice);
        this.lick = this.lick(indice);
        this.trialType = this.trialType(indice);
        this.transient_mat = this.transient_mat(:, indice);

        end_time= 1+(length(indice)-1)*DT;
        this.time= 1:DT:end_time;

        % Performance
        if perfValue == 1
            trials=find(this.lap_data.performance.trialOrder == indiceValue);
            correctIncorrect = this.lap_data.performance.trialCorrect(trials);
            perf = sum(correctIncorrect==1)/sum(correctIncorrect>=0);
            PERFORMANCE(i_ses) = perf;
        else
        end

        % Split trials
        cumulativeDistance = unwrap(this.position_norm*2*pi)/(2*pi);
        midIdx = jzeroCrossing(cumulativeDistance - cumulativeDistance(end)/2);
        midDistance = cumulativeDistance(midIdx(1));
        HALF = 1;

        if HALF==1
            valid1 = cumulativeDistance<midDistance;    
            valid2 = cumulativeDistance>=midDistance;    
        elseif HALF==2
            valid1 = cumulativeDistance>=midDistance;
            valid2 = cumulativeDistance<midDistance;    
        else
            valid1 = true(size(cumulativeDistance));
            valid2 = true(size(cumulativeDistance));
        end

        occA = DT*histcn(this.position_norm(this.run_state==1 & this.trialType==indiceValue & valid1),edgesPosition);
        occA = jmm_smooth_1d_cor_circ(occA,SM);
        occA = occA(1:N_BINS);

        occA_speed = DT*histcn(this.speed(this.run_state==1 & this.trialType==indiceValue & valid1),edgesSpeed);
        occA_speed = jmm_smooth_1d_cor_circ(occA_speed,SM);
        occA_speed = occA_speed(1:N_BINS);

        timeBin = 0.25;
        SM2 = ceil(timeBin/DT);

        timeEdges = this.time(1):timeBin:this.time(end)+timeBin;
        timeCenters = center(timeEdges);
        coarseRate = NaN(N_CELLS,length(timeEdges)-1);
        eventsA = NaN(N_CELLS,N_BINS);
        eventsA_speed = NaN(N_CELLS,N_BINS);

        for i_cell = 1:N_CELLS
            eventBinaryAll = (this.transient_mat(i_cell,:).*(this.run_state==1 & valid2)'==1);
            eventBinaryA = (this.transient_mat(i_cell,:).*(this.run_state==1 & this.trialType==indiceValue & valid1)'==1);

            eventPosA = this.position_norm(eventBinaryA);
            eventSpeedA = this.speed(eventBinaryA);

            eventA = histcn(eventPosA,edgesPosition);
            eventA = jmm_smooth_1d_cor_circ(eventA,SM);
            eventA = eventA(1:N_BINS);
            eventsA(i_cell,:) = eventA;

            eventA_speed = histcn(eventSpeedA,edgesSpeed);
            eventA_speed = jmm_smooth_1d_cor(eventA_speed,SM);
            eventA_speed = eventA_speed(1:N_BINS);
            eventsA_speed(i_cell,:) = eventA_speed;

            smoothedEventRate = jmm_smooth_1d_cor(eventBinaryAll, 2*SM2)/timeBin;
            coarseRate(i_cell,:) = interp1(this.time,smoothedEventRate,timeCenters);
        end

        rateA = bsxfun(@rdivide, eventsA, occA);
        rateTogether = rateA;
        rateA_speed = bsxfun(@rdivide, eventsA_speed, occA_speed);
        rateTogether_speed = rateA_speed;

        selectRateTogether = rateTogether;
        selectRateTogether_speed = rateTogether_speed;
        selectCoarseRate = coarseRate;
        N_selectCells = N_CELLS;

        instCorr = (zscore(selectRateTogether)'*zscore(selectCoarseRate))/(N_selectCells-1);
        instCorr_speed = (zscore(selectRateTogether_speed)'*zscore(selectCoarseRate))/(N_selectCells-1);

        [~, maxBin] = max(instCorr);
        [~, maxBin_speed] = max(instCorr_speed);

        confidence = max(instCorr) - quantile(instCorr,0.85);
        confidence_speed = max(instCorr_speed) - quantile(instCorr_speed,0.85);
        centersPosition2 = centersPosition;
        centersSpeed2 = centersSpeed;
        predPos = centersPosition2(maxBin);
        predPos(confidence==0) = NaN;
        predSpeed = centersSpeed2(maxBin_speed);
        predSpeed(confidence_speed==0) = NaN;

        downsampledPosition = interp1(this.time, this.position_norm, timeCenters,'nearest');
        downsampledSpeed = interp1(this.time, this.speed, timeCenters,'nearest');
        downsampledRunState = interp1(this.time, 1*(this.run_state==1 & this.trialType>0), timeCenters,'nearest');
        downsampledPosition(downsampledRunState==0) = NaN;
        downsampledSpeed(downsampledRunState==0) = NaN;
        downsampledTrialType = interp1(this.time, this.trialType, timeCenters,'nearest');
        downsampledTrialType(downsampledRunState==0) = NaN;

        % Error computation
        pp2 = predPos(downsampledRunState==1)*200;
        ps2 = predSpeed(downsampledRunState==1);
        dp2 = downsampledPosition(downsampledRunState==1)*200;
        ds2 = downsampledSpeed(downsampledRunState==1);

        b2 = linspace(0,200,N_BINS+1);
        count = histc(dp2(:),b2);
        count = count(1:(length(b2)-1));
        error = 100*abs(angDiff(2*pi*pp2/200,2*pi*dp2/200))/pi;
        E = histcn(dp2(:),b2,'AccumData',error,'Fun',@nanmedian);
        E = E(1:(length(b2)-1));
        E(count==0) = NaN;
        ERROR(i_ses) = nanmedian(error);
        E(isnan(E)) = 0;
        E2 = jmm_smooth_1d_cor_circ(E,2);
        E2(count==0) = NaN;        
        E(count==0) = NaN;
        ERROR_allBin{i_ses}=E2;

        b2 = linspace(-5,35,N_BINS+1);
        count = histc(ds2(:),b2);
        count = count(1:(length(b2)-1));
        error = 35*abs(angDiff(2*pi*(ps2+5)/35,2*pi*(ds2+5)/35))/(2*pi);
        E = histcn(ds2(:),b2,'AccumData',error,'Fun',@nanmedian);
        E = E(1:(length(b2)-1));
        ERROR_SPEED(i_ses) = nanmedian(error);        
        E(isnan(E)) = 0;
        E2 = jmm_smooth_1d_cor(E,2);
        E2(count==0) = NaN;
        E(count==0) = NaN;
        ERROR_SPEED_allBin{i_ses}=E2;
    end

    % Package results
    result = struct();
    if perfValue ==1
        result.performance = PERFORMANCE;
    else
    end
    result.error = ERROR;
    result.error_speed = ERROR_SPEED;
    result.error_allBin = ERROR_allBin;
    result.error_speed_allBin = ERROR_SPEED_allBin;
end
%% FOR VISUALIZATION
 % subplot(2,2,1);
 %        plot(t2, dp2, 'b.');
 %        hold on;
 %        plot(t2, pp2, 'r.');
 %        xlabel('Running Time (s)');
 %        ylabel('Position (cm)');
 %        axis tight;
 %        plot(xlim,200*[1 1],'k');
 %        legend('Actual','Decoded');
 %        set(gca,'ytick',0:50:200);
 %        set(gca,'yticklabel',{[],'50','100','150','200'});
 % 
 %        subplot(2,2,2);
 %        plot(t2, ds2, 'b.');
 %        hold on;
 %        plot(t2, ps2, 'r.');
 %        xlabel('Running Time (s)');
 %        ylabel('Speed (cm/s)');
 %        axis tight;
 %        legend('Actual','Decoded');
 %        set(gca,'ytick',[0 15 30 ]);
 %        set(gca,'yticklabel',{'0','15','30'});
 % 
 %        subplot(2,6,7);
 %        set(gca,'ydir','normal');
 %        axis square;
 %        xlabel('Actual Position (cm)');
 %        ylabel('Decoded Position (cm)');
 %        set(gca,'xtick',0:50:200);
 %        set(gca,'xticklabel',{'','50','100','150','200'});
 %        set(gca,'ytick',0:50:200);
 %        set(gca,'yticklabel',{'','50','100','150','200'});
 %        hold on;
 %        p = get(gca,'position');        
 %        set(gca,'position',p+[-0.02 0 0 0]);
 %        plot(dp2+randn(size(dp2)),pp2+randn(size(dp2)),'o','Color','k','Markersize',3);
 %        c = corrcoef(dp2,pp2,'rows','complete');
 %        title(sprintf('Cells: %d\nR = %.02f', N_selectCells, c(1,2)));
 % 
 %        subplot(2,6,10);
 %        set(gca,'ydir','normal');
 %        axis square;
 %        xlabel('Actual Speed (cm/s)');
 %        ylabel('Decoded Speed (cm/s)');
 %        xlim([-5 35]); ylim([-5 35]);
 %        set(gca,'xtick',[0 15 30]);
 %        set(gca,'xticklabel',{'0','15','30'});
 %        set(gca,'ytick',[0 15 30]);
 %        set(gca,'yticklabel',{'0','15','30'});
 %        hold on;
 %        p = get(gca,'position');        
 %        set(gca,'position',p+[-0.02 0 0 0]);
 %        plot(ds2+randn(size(ds2)),ps2+randn(size(ds2)),'o','Color','k','Markersize',3);
 %        c = corrcoef(ds2,ps2,'rows','complete');
 %        title(sprintf('Cells: %d\nR = %.02f', N_selectCells, c(1,2)));
 % 
 %        %
 %        subplot(2,6,8);
 %        b2 = linspace(0,200,N_BINS+1);
 %        count = histc(dp2(:),b2);
 %        count = count(1:(length(b2)-1));
 %        error = 100*abs(angDiff(2*pi*pp2/200,2*pi*dp2/200))/pi;
 %        E = histcn(dp2(:),b2,'AccumData',error,'Fun',@nanmedian);
 %        E = E(1:(length(b2)-1));
 %        E(count==0) = NaN;
 %        ERROR(i_ses) = nanmedian(error);
 %        E(isnan(E)) = 0;
 %        E2 = jmm_smooth_1d_cor_circ(E,2);        
 %        E2(count==0) = NaN;        
 %        E(count==0) = NaN;
 %        ERROR_allBin{i_ses}=E2;
 %        plot(center(b2),E2);
 %        jAXIS;
 %        xlim([0 200]);
 %        ylim([0 max(ylim)]);
 %        xlabel('Position (cm)');
 %        ylabel('Median Decoding Error (cm)');
 %        title(sprintf('Median Error: %.02f cm', ERROR(i_ses)));
 %        axis square;
 %        set(gca,'xtick',0:50:200);
 %        set(gca,'xticklabel',{'','50','100','150','200'});
 % 
 %        subplot(2,6,11);
 %        b2 = linspace(-5,35,N_BINS+1);
 %        count = histc(ds2(:),b2);
 %        count = count(1:(length(b2)-1));
 %        error = 35*abs(angDiff(2*pi*(ps2+5)/35,2*pi*(ds2+5)/35))/(2*pi);
 %        E = histcn(ds2(:),b2,'AccumData',error,'Fun',@nanmedian);
 %        E = E(1:(length(b2)-1));
 %        ERROR_SPEED(i_ses) = nanmedian(error);        
 %        E(isnan(E)) = 0;
 %        E2 = jmm_smooth_1d_cor(E,2);
 %        E2(count==0) = NaN;
 %        E(count==0) = NaN;
 %        ERROR_SPEED_allBin{i_ses}=E2;
 %        plot(center(b2),E2);
 %        jAXIS;
 %        xlim([-5 35]);
 %        ylim([0 max(ylim)]);
 %        xlabel('Speed (cm/s)');
 %        ylabel('Median Decoding Error (cm/s)');
 %        title(sprintf('Median Error: %.02f cm/s', ERROR_SPEED(i_ses)));
 %        axis square;
 %        set(gca,'xtick',[0 15 30]);
 %        set(gca,'xticklabel',{'0','15','30'});
