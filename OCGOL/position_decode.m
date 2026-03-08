%NOT USED ANYMORE
%Loop through files in directory 
%Find folders that have matching transient file in folders 1 and 2

%Create list of mouse names

totalMice = 1;
maxSessions = 2;

%Matrices for output or where function below will output
PPP = NaN(totalMice,maxSessions);
EEE = NaN(totalMice,maxSessions);
EEE_allBin=cell(totalMice,maxSessions);
EEE_SPEED = NaN(totalMice,maxSessions);
EEE_SPEED_allBin=cell(totalMice,maxSessions);

%%

for i_mouse=1:length(mice)
    load(fullfile(base,mice{i_mouse},'matched_transients_all_ses.mat'),'matching_ROI_bin_transient_lap_data')
    these = matching_ROI_bin_transient_lap_data;

    PERFORMANCE = NaN(1,maxSessions);
    ERROR = NaN(1,maxSessions);
    ERROR_SPEED = NaN(1,maxSessions);
    ERROR_allBin = cell(1,maxSessions);
    ERROR_SPEED_allBin = cell(1,maxSessions);

    for i_ses = 1:length(these)
        this = these{i_ses};
        
        %Binning for position and speed
        N_BINS = 40;
        edgesPosition = linspace(0,1,N_BINS+1);
        centersPosition = center(edgesPosition);
        edgesSpeed = linspace(-5,30,N_BINS+1);
        centersSpeed = center(edgesSpeed);
        
        SM = 1;
        DT = nanmedian(diff(this.time));
        N_CELLS = size(this.transient_mat,1);
        
        %Extract appropriate trial types and subset data to that trial type
        indice= find(this.trialType==3);
        
        this.run_state = this.run_state(indice);
        this.position_cm = this.position_cm(indice);
        this.position_norm = this.position_norm(indice);
        this.speed = this.speed(indice);
        this.lap_nb = this.lap_nb(indice);
        this.lick = this.lick(indice);
        this.trialType = this.trialType(indice);
        %this.trialCorr = this.trialCorr(indice);
        this.transient_mat = this.transient_mat(:, indice);
        end_time= 1+(length(indice)-1)*DT;
        this.time= 1:DT:end_time;
        
        % %Extract performance in OCGOL cases
        % correctIncorrect = this.lap_data.performance.trialCorrect;
        % perf = sum(correctIncorrect==1)/sum(correctIncorrect>=0);
        % PERFORMANCE(i_ses) = perf;
        
        %Split trials in half for training and testing
        cumulativeDistance = unwrap(this.position_norm*2*pi)/(2*pi);
        midDistance = cumulativeDistance(jzeroCrossing(cumulativeDistance-cumulativeDistance(end)/2));
        
        HALF = 1;
        if(HALF==1)
            valid1 = cumulativeDistance<midDistance;    
            valid2 = cumulativeDistance>=midDistance;    
        elseif(HALF==2)
            valid1 = cumulativeDistance>=midDistance;
            valid2 = cumulativeDistance<midDistance;    
        else
            valid1 = true(size(cumulativeDistance));
            valid2 = true(size(cumulativeDistance));
        end
        
        %Occupancy histograms for position and speed during training
        occA = DT*histcn(this.position_norm(this.run_state==1 & this.trialType==3 & valid1),edgesPosition);
        occA = jmm_smooth_1d_cor_circ(occA,SM);
        occA = occA(1:N_BINS);
        
        occA_speed = DT*histcn(this.speed(this.run_state==1 & this.trialType==3 & valid1),edgesSpeed);
        occA_speed = jmm_smooth_1d_cor_circ(occA_speed,SM);
        occA_speed = occA_speed(1:N_BINS);
        
        timeBin = 0.25;
        SM2 = ceil(timeBin/DT);
        
        %Decoding variables
        timeEdges = this.time(1):timeBin:this.time(end)+timeBin;
        timeCenters = center(timeEdges);
        coarseRate = NaN(N_CELLS,length(timeEdges)-1); %Smoothed neural activity (per coarse bin)
        eventsA = NaN(N_CELLS,N_BINS); %Spike counts per position bin (training)
        eventsA_speed = NaN(N_CELLS,N_BINS); %Spike counts per speed bin (training)
        
        for i_cell = 1:N_CELLS
            %Spike events during test
            eventBinaryAll = (this.transient_mat(i_cell,:).*(this.run_state==1 & valid2)'==1);
        
            %Spike events during training
            eventBinaryA = (this.transient_mat(i_cell,:).*(this.run_state==1 & this.trialType==3 & valid1)'==1);
        
            %Position and speed where events occurred
            eventPosA = this.position_norm(eventBinaryA);
            eventSpeedA = this.speed(eventBinaryA);
            
            %Histogram of events per position bin
            eventA = histcn(eventPosA,edgesPosition);
            eventA = jmm_smooth_1d_cor_circ(eventA,SM);
            eventA = eventA(1:N_BINS);
            eventsA(i_cell,:) = eventA;
            
            %Histogram of events per speed bin
            eventA_speed = histcn(eventSpeedA,edgesSpeed);
            eventA_speed = jmm_smooth_1d_cor(eventA_speed,SM);
            eventA_speed = eventA_speed(1:N_BINS);
            eventsA_speed(i_cell,:) = eventA_speed;
            
            %Smoothed event rate during test phase (for decoding)
            smoothedEventRate = jmm_smooth_1d_cor(eventBinaryAll, 2*SM2)/timeBin;
            coarseRate(i_cell,:) = interp1(this.time,smoothedEventRate,timeCenters);
        end
        
        %Compute rate maps by normalizing with occupancy
        rateA = bsxfun(@rdivide, eventsA, occA);
        rateTogether = rateA;
        
        rateA_speed = bsxfun(@rdivide, eventsA_speed, occA_speed);
        rateTogether_speed = rateA_speed;
        
        selectRateTogether = rateTogether;
        selectRateTogether_speed = rateTogether_speed;
        selectCoarseRate = coarseRate; %Neural activity to decode
        N_selectCells = N_CELLS;
        
        %Decode position/speed with population vector correlation
        instCorr = (zscore(selectRateTogether)'*zscore(selectCoarseRate))/(N_selectCells-1);
        instCorr_speed = (zscore(selectRateTogether_speed)'*zscore(selectCoarseRate))/(N_selectCells-1);
        [~, maxBin] = max(instCorr); %Most likely decoded position bin
        [~, maxBin_speed] = max(instCorr_speed); %Most likely decoded speed bin
        
        confidence = max(instCorr) - quantile(instCorr,0.85); %Confidence in decoded position
        confidence_speed = max(instCorr_speed) - quantile(instCorr_speed,0.85);
        centersPosition2 = centersPosition;
        centersSpeed2 = centersSpeed;
        predPos = centersPosition2(maxBin);
        predPos(confidence==0) = NaN;
        predSpeed = centersSpeed2(maxBin_speed);
        predSpeed(confidence_speed==0) = NaN;
        
        %Downsample ground truth for comparison
        downsampledPosition = interp1(this.time, this.position_norm, timeCenters,'nearest');
        downsampledSpeed = interp1(this.time, this.speed, timeCenters,'nearest');
        downsampledRunState = interp1(this.time, 1*(this.run_state==1 & this.trialType>0), timeCenters,'nearest');
        downsampledPosition(downsampledRunState==0) = NaN;
        downsampledSpeed(downsampledRunState==0) = NaN;
        downsampledTrialType = interp1(this.time, this.trialType, timeCenters,'nearest');
        downsampledTrialType(downsampledRunState==0) = NaN;
        %%
        clf;
        % subplot(2,1,1);
        % plot(timeCenters, downsampledPosition, 'b.');
        % hold on;
        % plot(timeCenters, predPos, 'r.');
        pp2 = predPos(downsampledRunState==1)*200;
        ps2 = predSpeed(downsampledRunState==1);
        ic2 = instCorr(:,downsampledRunState==1);
        ics2 = instCorr_speed(:,downsampledRunState==1);
        cf2 = confidence(downsampledRunState==1);
        cfs2 = confidence_speed(downsampledRunState==1);
        tt2 = downsampledTrialType(downsampledRunState==1);
        dp2 = downsampledPosition(downsampledRunState==1)*200;
        ds2 = downsampledSpeed(downsampledRunState==1);
        t2 = timeBin*(1:length(pp2));
        subplot(2,2,1);
        plot(t2, dp2, 'b.');
        hold on;
        plot(t2, pp2, 'r.');
        xlabel('Running Time (s)');
        ylabel('Position (cm)');
        axis tight;
        plot(xlim,200*[1 1],'k');
        legend('Actual','Decoded');
        set(gca,'ytick',0:50:200);
        set(gca,'yticklabel',{[],'50','100','150','200'});
        
        subplot(2,2,2);
        plot(t2, ds2, 'b.');
        hold on;
        plot(t2, ps2, 'r.');
        xlabel('Running Time (s)');
        ylabel('Speed (cm/s)');
        axis tight;
        legend('Actual','Decoded');
        set(gca,'ytick',[0 15 30 ]);
        set(gca,'yticklabel',{'0','15','30'});
        
        subplot(2,6,7);
        set(gca,'ydir','normal');
        axis square;
        xlabel('Actual Position (cm)');
        ylabel('Decoded Position (cm)');
        set(gca,'xtick',0:50:200);
        set(gca,'xticklabel',{'','50','100','150','200'});
        set(gca,'ytick',0:50:200);
        set(gca,'yticklabel',{'','50','100','150','200'});
        hold on;
        p = get(gca,'position');        
        set(gca,'position',p+[-0.02 0 0 0]);
        plot(dp2+randn(size(dp2)),pp2+randn(size(dp2)),'o','Color','k','Markersize',3);
        c = corrcoef(dp2,pp2,'rows','complete');
        title(sprintf('Cells: %d\nR = %.02f', N_selectCells, c(1,2)));
        
        subplot(2,6,10);
        set(gca,'ydir','normal');
        axis square;
        xlabel('Actual Speed (cm/s)');
        ylabel('Decoded Speed (cm/s)');
        xlim([-5 35]); ylim([-5 35]);
        set(gca,'xtick',[0 15 30]);
        set(gca,'xticklabel',{'0','15','30'});
        set(gca,'ytick',[0 15 30]);
        set(gca,'yticklabel',{'0','15','30'});
        hold on;
        p = get(gca,'position');        
        set(gca,'position',p+[-0.02 0 0 0]);
        plot(ds2+randn(size(ds2)),ps2+randn(size(ds2)),'o','Color','k','Markersize',3);
        c = corrcoef(ds2,ps2,'rows','complete');
        title(sprintf('Cells: %d\nR = %.02f', N_selectCells, c(1,2)));
        
        %
        subplot(2,6,8);
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
        plot(center(b2),E2);
        jAXIS;
        xlim([0 200]);
        ylim([0 max(ylim)]);
        xlabel('Position (cm)');
        ylabel('Median Decoding Error (cm)');
        title(sprintf('Median Error: %.02f cm', ERROR(i_ses)));
        axis square;
        set(gca,'xtick',0:50:200);
        set(gca,'xticklabel',{'','50','100','150','200'});
                     
        subplot(2,6,11);
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
        plot(center(b2),E2);
        jAXIS;
        xlim([-5 35]);
        ylim([0 max(ylim)]);
        xlabel('Speed (cm/s)');
        ylabel('Median Decoding Error (cm/s)');
        title(sprintf('Median Error: %.02f cm/s', ERROR_SPEED(i_ses)));
        axis square;
        set(gca,'xtick',[0 15 30]);
        set(gca,'xticklabel',{'0','15','30'});
    end
    PPP(i_mouse,:) = PERFORMANCE;
    EEE(i_mouse,:) = ERROR;   
    EEE_SPEED(i_mouse,:) = ERROR_SPEED;
    EEE_allBin{i_mouse,:} = ERROR_allBin;
    EEE_SPEED_allBin{i_mouse,:} = ERROR_SPEED_allBin;

end