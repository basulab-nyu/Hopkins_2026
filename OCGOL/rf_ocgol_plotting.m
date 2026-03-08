%'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF\crossSession_update\PV_TC_corr.mat',...
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat'};
%must update the directories and the list here:
RF_mice = {'MH110','MH112','MH113','MH114','MH118','MH122','MH123','MH124','MH125','MH126','MH128','MH131','MH132','MH135','MH136','MH137','MH138'};

%'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\OCGOL\crossSession_update\PV_TC_corr.mat',...
OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\PV_TC_corr.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\PV_TC_corr.mat'};
%must update the directories and the list here:
OCGOL_mice = {'MH110','MH112','MH113','MH114','MH115','MH122','MH123','MH124','MH126','MH127','MH128','MH134','MH135','MH136','MH137','MH138'};

[matchedCells, idxInArray1, idxInArray2] = intersect(RF_mice, OCGOL_mice);
[nonMatchingInArray1, unique_idxInArray1] = setdiff(RF_mice, OCGOL_mice);
[nonMatchingInArray2, unique_idxInArray2] = setdiff(OCGOL_mice, RF_mice);
%%
cmap_blue=cbrewer('seq', 'Blues', 16);
cmap_red=cbrewer('seq', 'Reds', 16);
cmap_purple=cbrewer('seq','Purples',16);

%% Run this section if you want to visualize only mice that have data for both RF and OCGOL
RF_files_match = RF_files(idxInArray1);
OCGOL_files_match = OCGOL_files(idxInArray2);
RF_mice_match = RF_mice(idxInArray1);
OCGOL_mice_match = OCGOL_mice(idxInArray2);
sb = 0:2:200;

figure(1)
for mouse=1:length(RF_files_match)
    load(RF_files_match{mouse})
    subplot(3,length(RF_files_match),mouse)
    imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{1, 2})
    caxis([-.25 1]);
    title([RF_mice_match{mouse} ': RF'])
end 

for mouse=1:length(OCGOL_files_match)
    load(OCGOL_files_match{mouse})
    subplot(3,length(OCGOL_files_match),mouse+length(RF_files_match))
    imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{1, 2})
    %colormap(gca,cmap_blue);
    caxis([-.25 1]);
    title([OCGOL_mice_match{mouse} ': A Trial'])
    subplot(3,length(OCGOL_files_match),length(RF_files_match)+length(OCGOL_files_match)+mouse)
    imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.B{1, 2})
    %colormap(gca,cmap_red);
    caxis([-.25 1]);
    title([OCGOL_mice_match{mouse} ': B Trial'])
end
%% Creates PV/TC matrices for all mice using 100 spatial bins (~2 cm) and plots correlograms for all mice not just matching
totals_sbs=100;
RF.meanPV_rel_d1 = NaN(1,length(RF_files));
RF.meanTC_rel_d1.si=NaN(1,length(RF_files)); 
RF.meanTC_rel_d1.ts=NaN(1,length(RF_files));
RF.PV_count= NaN(1,length(RF_files));
RF.TC_count.si=NaN(1,length(RF_files));
RF.TC_count.ts=NaN(1,length(RF_files));
RF.PV_allsb=NaN(length(RF_files),totals_sbs);
RF.PV_offdiag=NaN(length(RF_files),totals_sbs-1);

figure(2)
for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF.meanPV_rel_d1(mouse)=PV_TC_corr.meanPV_rel_d1.A;
    RF.PV_allsb(mouse,:)=diag(PV_TC_corr.PVcorr_all_ses.A{1, 2});
    RF.meanTC_rel_d1.si(mouse)=PV_TC_corr.meanTC_rel_d1.si.A;  
    RF.meanTC_rel_d1.ts(mouse)=PV_TC_corr.meanTC_rel_d1.ts.A;
    RF.PV_count(mouse)=PV_TC_corr.PV_corr_ROI_count.A(1,2);
    RF.TC_count.si(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.si.A(1,2);
    RF.TC_count.ts(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.ts.A(1,2);
    for ii=1:totals_sbs-1
        RF.PV_offdiag(mouse,ii)=mean(diag(PV_TC_corr.PVcorr_all_ses.A{1, 2},ii));
    end
    subplot(3,length(RF_files),mouse)
    imagesc(PV_TC_corr.PVcorr_all_ses.A{1, 2})
    caxis([0 1]);
    title([RF_mice{mouse} ': RF'])
end  

OCGOL.meanPV_rel_d1.A = NaN(1,length(OCGOL_files));
OCGOL.meanPV_rel_d1.B = NaN(1,length(OCGOL_files));
OCGOL.meanTC_rel_d1.si.A=NaN(1,length(OCGOL_files)); 
OCGOL.meanTC_rel_d1.si.B=NaN(1,length(OCGOL_files)); 
OCGOL.meanTC_rel_d1.ts.A=NaN(1,length(OCGOL_files));
OCGOL.meanTC_rel_d1.ts.B=NaN(1,length(OCGOL_files));
OCGOL.PV_allsb.A=NaN(length(OCGOL_files),totals_sbs);
OCGOL.PV_allsb.B=NaN(length(OCGOL_files),totals_sbs);
OCGOL.PV_offdiag.A=NaN(length(OCGOL_files),totals_sbs-1);
OCGOL.PV_offdiag.B=NaN(length(OCGOL_files),totals_sbs-1);

OCGOL.PV_count.A= NaN(1,length(OCGOL_files));
OCGOL.PV_count.B= NaN(1,length(OCGOL_files));
OCGOL.TC_count.si.A=NaN(1,length(OCGOL_files));
OCGOL.TC_count.si.B=NaN(1,length(OCGOL_files));
OCGOL.TC_count.ts.A=NaN(1,length(OCGOL_files));
OCGOL.TC_count.ts.B=NaN(1,length(OCGOL_files));

for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL.meanPV_rel_d1.A(mouse)=PV_TC_corr.meanPV_rel_d1.A;
    OCGOL.meanPV_rel_d1.B(mouse)=PV_TC_corr.meanPV_rel_d1.B;
    OCGOL.meanTC_rel_d1.si.A(mouse)=PV_TC_corr.meanTC_rel_d1.si.A;   
    OCGOL.meanTC_rel_d1.si.B(mouse)=PV_TC_corr.meanTC_rel_d1.si.B;   
    OCGOL.meanTC_rel_d1.ts.A(mouse)=PV_TC_corr.meanTC_rel_d1.ts.A;
    OCGOL.meanTC_rel_d1.ts.B(mouse)=PV_TC_corr.meanTC_rel_d1.ts.B;
    OCGOL.PV_allsb.A(mouse,:)=diag(PV_TC_corr.PVcorr_all_ses.A{1, 2});
    OCGOL.PV_allsb.B(mouse,:)=diag(PV_TC_corr.PVcorr_all_ses.B{1, 2});
    for ii=1:totals_sbs-1
        OCGOL.PV_offdiag.A(mouse,ii)=mean(diag(PV_TC_corr.PVcorr_all_ses.A{1, 2},ii));
        OCGOL.PV_offdiag.B(mouse,ii)=mean(diag(PV_TC_corr.PVcorr_all_ses.B{1, 2},ii));
    end
    
    OCGOL.PV_count.A(mouse)=PV_TC_corr.PV_corr_ROI_count.A(1,2)
    OCGOL.PV_count.B(mouse)=PV_TC_corr.PV_corr_ROI_count.B(1,2)
    OCGOL.TC_count.si.A(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.si.A(1,2);
    OCGOL.TC_count.si.B(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.si.B(1,2);
    OCGOL.TC_count.ts.A(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.ts.A(1,2);
    OCGOL.TC_count.ts.B(mouse)=PV_TC_corr.TCcorr_all_ses_neuron_count.ts.B(1,2);
    
    subplot(3,length(RF_files),mouse+length(RF_files))
    imagesc(PV_TC_corr.PVcorr_all_ses.A{1, 2})
    colormap(gca,cmap_blue);
    caxis([0 1]);
    title([OCGOL_mice{mouse} ': A Trial'])
    subplot(3,length(RF_files),2*length(RF_files)+mouse)
    imagesc(PV_TC_corr.PVcorr_all_ses.B{1, 2})
    colormap(gca,cmap_red);
    caxis([0 1]);
    title([OCGOL_mice{mouse} ': B Trial'])
end
%% Creates matrices for PV correlogram plots across all spatial bins (values of the diagonal)
RF_PV_allsb_SEM= NaN(1,size(RF.PV_allsb,2));
OCGOL_PV_allsb_A_SEM= NaN(1,size(OCGOL.PV_allsb.A,2));
OCGOL_PV_allsb_B_SEM= NaN(1,size(OCGOL.PV_allsb.B,2));

for sb=1:size(RF.PV_allsb,2)
    RF_PV_allsb_SEM(sb)=std(RF.PV_allsb(:,sb))/sqrt(length(RF.PV_allsb(:,sb)));
    OCGOL_PV_allsb_A_SEM(sb)= std(OCGOL.PV_allsb.A(:,sb))/sqrt(length(OCGOL.PV_allsb.A(:,sb)));
    OCGOL_PV_allsb_B_SEM(sb)= std(OCGOL.PV_allsb.B(:,sb))/sqrt(length(OCGOL.PV_allsb.B(:,sb)));
end

OCGOL_PV_A_SEM = std(OCGOL.meanPV_rel_d1.A)/sqrt(length(OCGOL.meanPV_rel_d1.A));
OCGOL_PV_B_SEM = std(OCGOL.meanPV_rel_d1.B)/sqrt(length(OCGOL.meanPV_rel_d1.B));
RF_PV_SEM = std(RF.meanPV_rel_d1)/sqrt(length(RF.meanPV_rel_d1));

match_PV = [RF.meanPV_rel_d1(idxInArray1)',OCGOL.meanPV_rel_d1.A(idxInArray2)',OCGOL.meanPV_rel_d1.B(idxInArray2)'];

%Creates matrices for PV correlogram plots of the off diagonal (distance between spatial bins)- includes last distance sb1 vs sb100 
RF_PV_offdiag_SEM= NaN(1,size(RF.PV_offdiag,2));
OCGOL_PV_offdiag_A_SEM= NaN(1,size(OCGOL.PV_offdiag.A,2));
OCGOL_PV_offdiag_B_SEM= NaN(1,size(OCGOL.PV_offdiag.B,2));

for sb=1:size(RF.PV_offdiag,2)
    RF_PV_offdiag_SEM(sb)=std(RF.PV_offdiag(:,sb))/sqrt(length(RF.PV_offdiag(:,sb)));
    OCGOL_PV_offdiag_A_SEM(sb)= std(OCGOL.PV_offdiag.A(:,sb))/sqrt(length(OCGOL.PV_offdiag.A(:,sb)));
    OCGOL_PV_offdiag_B_SEM(sb)= std(OCGOL.PV_offdiag.B(:,sb))/sqrt(length(OCGOL.PV_offdiag.B(:,sb)));
end
%% Plots PV correlation values as bar graph
x_num = [1:3];
y = mean(match_PV);
figure(2)
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
title('PV Correlation')
xlabel('Session Type')
ylabel('PV Correlation')
ylim([0 1]);
box off
hold on
for i=1:size(match_PV,1)
    plot(match_PV(i,:),'Color',[.5 .5 .5])
end
% plot(ones(1,length(unique_idxInArray2))*1,OCGOL.meanPV_rel_d1.A(unique_idxInArray2),'ok')
% plot(ones(1,length(unique_idxInArray1))*2,RF.meanPV_rel_d1(unique_idxInArray1),'ok')
% plot(ones(1,length(unique_idxInArray2))*3,OCGOL.meanPV_rel_d1.B(unique_idxInArray2),'ok')
errorbar(x_num,y,SEM_col(match_PV),'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'RF','OCGOL-A','OCGOL-B'})

%% Plots PV correlation across spatial bins in line plot
sb=[1:2:200];
figure()

subplot(1,3,1)
plot(sb,mean(RF.PV_allsb),'Color',[0 0.5 0])
hold on
plot(sb,mean(OCGOL.PV_allsb.A),'Color',cmap_blue(12,:))
ylim([0 1]);
errorbar(sb,mean(RF.PV_allsb),RF_PV_allsb_SEM,'.','CapSize',0,'Color', [0 0.5 0]);
errorbar(sb,mean(OCGOL.PV_allsb.A),OCGOL_PV_allsb_A_SEM,'.','CapSize',0,'Color', cmap_blue(12,:));
xlabel('Position (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Spatial Bin')
legend({'RF','OCGOL-A','',''})
box off

subplot(1,3,2)
plot(sb,mean(RF.PV_allsb),'Color',[0 0.5 0])
hold on
plot(sb,mean(OCGOL.PV_allsb.B),'Color',cmap_red(12,:))
errorbar(sb,mean(RF.PV_allsb),RF_PV_allsb_SEM,'.','CapSize',0,'Color', [0 0.5 0]);
ylim([0 1]);
errorbar(sb,mean(OCGOL.PV_allsb.B),OCGOL_PV_allsb_B_SEM,'.','CapSize',0,'Color', cmap_red(12,:));
xlabel('Position (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Spatial Bin')
legend({'RF','OCGOL-B','',''})
box off

subplot(1,3,3)
plot(sb,mean(OCGOL.PV_allsb.A),'Color',cmap_blue(12,:))
ylim([0 1]);
hold on
plot(sb,mean(OCGOL.PV_allsb.B),'Color',cmap_red(12,:))
errorbar(sb,mean(OCGOL.PV_allsb.A),OCGOL_PV_allsb_A_SEM,'.','CapSize',0,'Color', cmap_blue(12,:));
errorbar(sb,mean(OCGOL.PV_allsb.B),OCGOL_PV_allsb_B_SEM,'.','CapSize',0,'Color', cmap_red(12,:));
xlabel('Position (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Spatial Bin')
legend({'OCGOL-A','OCGOL-B','',''})
box off
%% Plots PV correlation off diagonal values
sb=[2:2:199];
figure()

subplot(1,3,1)
plot(sb,mean(RF.PV_offdiag),'Color',[0 0.5 0])
hold on
plot(sb,mean(OCGOL.PV_offdiag.A),'Color',cmap_blue(12,:))
ylim([-.2 1]);
errorbar(sb,mean(RF.PV_offdiag),RF_PV_offdiag_SEM,'.','CapSize',0,'Color', [0 0.5 0]);
errorbar(sb,mean(OCGOL.PV_offdiag.A),OCGOL_PV_offdiag_A_SEM,'.','CapSize',0,'Color', cmap_blue(12,:));
xlabel('Distance (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Distance (cm)')
legend({'RF','OCGOL-A','',''})
box off

subplot(1,3,2)
plot(sb,mean(RF.PV_offdiag),'Color',[0 0.5 0])
hold on
plot(sb,mean(OCGOL.PV_offdiag.B),'Color',cmap_red(12,:))
errorbar(sb,mean(RF.PV_offdiag),RF_PV_offdiag_SEM,'.','CapSize',0,'Color', [0 0.5 0]);
ylim([-.2 1]);
errorbar(sb,mean(OCGOL.PV_offdiag.B),OCGOL_PV_offdiag_B_SEM,'.','CapSize',0,'Color', cmap_red(12,:));
xlabel('Distance (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Distance (cm)')
legend({'RF','OCGOL-B','',''})
box off

subplot(1,3,3)
plot(sb,mean(OCGOL.PV_offdiag.A),'Color',cmap_blue(12,:))
ylim([-.2 1]);
hold on
plot(sb,mean(OCGOL.PV_offdiag.B),'Color',cmap_red(12,:))
errorbar(sb,mean(OCGOL.PV_offdiag.A),OCGOL_PV_offdiag_A_SEM,'.','CapSize',0,'Color', cmap_blue(12,:));
errorbar(sb,mean(OCGOL.PV_offdiag.B),OCGOL_PV_offdiag_B_SEM,'.','CapSize',0,'Color', cmap_red(12,:));
xlabel('Distance (cm)')
ylabel('PV Correlation')
title('PV Correlation v. Distance (cm)')
legend({'OCGOL-A','OCGOL-B','',''})
box off
%% Plots TC correlation (SI and TS) as bar graph
OCGOL_TC_A_SEM_si = std(OCGOL.meanTC_rel_d1.si.A)/sqrt(length(OCGOL.meanTC_rel_d1.si.A));
OCGOL_TC_B_SEM_si = std(OCGOL.meanTC_rel_d1.si.B)/sqrt(length(OCGOL.meanTC_rel_d1.si.B));
RF_TC_SEM_si = std(RF.meanTC_rel_d1.si)/sqrt(length(RF.meanTC_rel_d1.si));

OCGOL_TC_A_SEM_ts = std(OCGOL.meanTC_rel_d1.ts.A)/sqrt(length(OCGOL.meanTC_rel_d1.ts.A));
OCGOL_TC_B_SEM_ts = std(OCGOL.meanTC_rel_d1.ts.B)/sqrt(length(OCGOL.meanTC_rel_d1.ts.B));
RF_TC_SEM_ts = nanstd(RF.meanTC_rel_d1.ts)/sqrt(length(RF.meanTC_rel_d1.ts));

match_TC_si = [OCGOL.meanTC_rel_d1.si.A(idxInArray2)', RF.meanTC_rel_d1.si(idxInArray1)',OCGOL.meanTC_rel_d1.si.B(idxInArray2)'];
match_TC_ts = [OCGOL.meanTC_rel_d1.ts.A(idxInArray2)', RF.meanTC_rel_d1.ts(idxInArray1)',OCGOL.meanTC_rel_d1.ts.B(idxInArray2)'];

x_num = [1:3];
y = [mean(OCGOL.meanTC_rel_d1.si.A), mean(RF.meanTC_rel_d1.si), mean(OCGOL.meanTC_rel_d1.si.B) ];
figure(3)
subplot(1,2,1)
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [0 0.5 0];
b.CData(3,:)= [cmap_red(12,:)];
title('TC Correlation - SI')
xlabel('Session Type')
ylabel('TC Correlation')
ylim([0 1]);
box off
hold on
for i=1:size(match_TC_si,1)
    plot(match_TC_si(i,:),'Color',[.5 .5 .5])
end
plot(ones(1,length(unique_idxInArray2))*1,OCGOL.meanTC_rel_d1.si.A(unique_idxInArray2),'ok')
plot(ones(1,length(unique_idxInArray1))*2, RF.meanTC_rel_d1.si(unique_idxInArray1),'ok')
plot(ones(1,length(unique_idxInArray2))*3,OCGOL.meanTC_rel_d1.si.B(unique_idxInArray2),'ok')
errorbar(x_num,y,[OCGOL_TC_A_SEM_si RF_TC_SEM_si OCGOL_TC_B_SEM_si],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'OCGOL-A','RF','OCGOL-B'})

x_num = [1:3];
y = [mean(OCGOL.meanTC_rel_d1.ts.A), nanmean(RF.meanTC_rel_d1.ts), mean(OCGOL.meanTC_rel_d1.ts.B) ];
subplot(1,2,2)
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [cmap_blue(12,:)];
b.CData(2,:)= [0 0.5 0];
b.CData(3,:)= [cmap_red(12,:)];
title('TC Correlation - TS')
xlabel('Session Type')
ylabel('TC Correlation')
ylim([0 1]);
box off
hold on
for i=1:size(match_TC_ts,1)
    plot(match_TC_ts(i,:),'Color',[.5 .5 .5])
end
plot(ones(1,length(unique_idxInArray2))*1,OCGOL.meanTC_rel_d1.ts.A(unique_idxInArray2),'ok')
plot(ones(1,length(unique_idxInArray1))*2, RF.meanTC_rel_d1.ts(unique_idxInArray1),'ok')
plot(ones(1,length(unique_idxInArray2))*3,OCGOL.meanTC_rel_d1.ts.B(unique_idxInArray2),'ok')
errorbar(x_num,y,[OCGOL_TC_A_SEM_ts RF_TC_SEM_ts OCGOL_TC_B_SEM_ts],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'OCGOL-A','RF','OCGOL-B'})
%% Recurrence files
%Works if recurrence is only between two registered sessions
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\recurrence.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\recurrence.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\recurrence.mat'};

RF.recurr.ts=NaN([length(RF_files),1]);
RF.recurr.si=NaN([length(RF_files),1]);
OCGOL.recurr.ts.A=NaN([length(OCGOL_files),1]);
OCGOL.recurr.ts.B=NaN([length(OCGOL_files),1]);
OCGOL.recurr.ts.AorB=NaN([length(OCGOL_files),1]);
OCGOL.recurr.si.A=NaN([length(OCGOL_files),1]);
OCGOL.recurr.si.B=NaN([length(OCGOL_files),1]);
OCGOL.recurr.si.AorB=NaN([length(OCGOL_files),1]);

for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF.recurr.ts(mouse)=recurr.ts.A(1,2);
    RF.recurr.si(mouse)=recurr.si.A(1,2);
end

for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL.recurr.ts.A(mouse)=recurr.ts.A(1,2);
    OCGOL.recurr.ts.B(mouse)=recurr.ts.B(1,2);
    OCGOL.recurr.ts.AorB(mouse)=recurr.ts.AorB(1,2);
    OCGOL.recurr.si.A(mouse)=recurr.si.A(1,2);
    OCGOL.recurr.si.B(mouse)=recurr.si.B(1,2);
    OCGOL.recurr.si.AorB(mouse)=recurr.si.AorB(1,2);
end

OCGOL_recurr_A_SEM_si = std(OCGOL.recurr.si.A)/sqrt(length(OCGOL.recurr.si.A));
OCGOL_recurr_B_SEM_si = std(OCGOL.recurr.si.B)/sqrt(length(OCGOL.recurr.si.B));
OCGOL_recurr_AorB_SEM_si = std(OCGOL.recurr.si.AorB)/sqrt(length(OCGOL.recurr.si.AorB));
RF_recurr_SEM_si = std(RF.recurr.si)/sqrt(length(RF.recurr.si));

OCGOL_recurr_A_SEM_ts = std(OCGOL.recurr.ts.A)/sqrt(length(OCGOL.recurr.ts.A));
OCGOL_recurr_B_SEM_ts = std(OCGOL.recurr.ts.B)/sqrt(length(OCGOL.recurr.ts.B));
OCGOL_recurr_AorB_SEM_ts = std(OCGOL.recurr.ts.AorB)/sqrt(length(OCGOL.recurr.ts.AorB));
RF_recurr_SEM_ts = nanstd(RF.recurr.ts)/sqrt(length(RF.recurr.ts));

match_recurr_si = [RF.recurr.si(idxInArray1),OCGOL.recurr.si.A(idxInArray2), OCGOL.recurr.si.B(idxInArray2),OCGOL.recurr.si.AorB(idxInArray2)];
match_recurr_ts = [RF.recurr.ts(idxInArray1),OCGOL.recurr.ts.A(idxInArray2),OCGOL.recurr.ts.B(idxInArray2),OCGOL.recurr.ts.AorB(idxInArray2)];

y = [mean(RF.recurr.si),mean(OCGOL.recurr.si.A), mean(OCGOL.recurr.si.B),mean(OCGOL.recurr.si.AorB)];

%Plots recurrence bar graphs
figure(4)
subplot(1,2,1)
b=bar([1 2 3 4],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
b.CData(4,:)= [cmap_purple(13,:)];
title('Recurrence - SI')
xlabel('Session Type')
ylabel('Recurrence')
ylim([0 1]);
box off
hold on
for i=1:size(match_recurr_si,1)
    plot(match_recurr_si(i,:),'Color',[.5 .5 .5])
end
% plot(ones(1,length(unique_idxInArray2))*1,OCGOL.recurr.si.AorB(unique_idxInArray2),'ok')
% plot(ones(1,length(unique_idxInArray1))*2,RF.recurr.si(unique_idxInArray1),'ok')
% plot(ones(1,length(unique_idxInArray2))*3,OCGOL.recurr.si.A(unique_idxInArray2),'ok')
% plot(ones(1,length(unique_idxInArray2))*4,OCGOL.recurr.si.B(unique_idxInArray2),'ok')
errorbar([1 2 3 4],y,[RF_recurr_SEM_si OCGOL_recurr_A_SEM_si OCGOL_recurr_B_SEM_si OCGOL_recurr_AorB_SEM_si],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'RF','OCGOL-A','OCGOL-B','OCGOL-AorB',})

y = [mean(RF.recurr.ts),mean(OCGOL.recurr.ts.A), mean(OCGOL.recurr.ts.B),mean(OCGOL.recurr.ts.AorB) ];

subplot(1,2,2)
b=bar([1 2 3 4],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
b.CData(4,:)= [cmap_purple(13,:)];
title('Recurrence - TS')
xlabel('Session Type')
ylabel('Recurrence')
ylim([0 1]);
box off
hold on
for i=1:size(match_recurr_ts,1)
    plot(match_recurr_ts(i,:),'Color',[.5 .5 .5])
end
% plot(ones(1,length(unique_idxInArray2))*1,OCGOL.recurr.ts.AorB(unique_idxInArray2),'ok')
% plot(ones(1,length(unique_idxInArray1))*2,RF.recurr.ts(unique_idxInArray1),'ok')
% plot(ones(1,length(unique_idxInArray2))*3,OCGOL.recurr.ts.A(unique_idxInArray2),'ok')
% plot(ones(1,length(unique_idxInArray2))*4,OCGOL.recurr.ts.B(unique_idxInArray2),'ok')
errorbar([1 2 3 4],y,[RF_recurr_SEM_ts OCGOL_recurr_A_SEM_ts OCGOL_recurr_B_SEM_ts OCGOL_recurr_AorB_SEM_ts],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'OCGOL-AorB','RF','OCGOL-A','OCGOL-B'})

%%
%'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF\crossSession_update\PV_TC_corr.mat',...
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_29-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\MH112_23_04_30-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\MH112_23_05_01-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\MH113_23_04_29-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\MH113_23_04_30-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\MH114_23_04_30-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\MH114_23_05_01-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\MH118_23_07_13_RF-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\MH118_23_07_14_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\MH122_2024_04_16_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\MH122_2024_04_17_RF-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_16_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_17_RF-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\MH124_2024_04_16_RF-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\MH124_2024_04_17_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\MH125_2024_04_16_RF-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\MH125_2024_04_17_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\MH126_2024_04_16_RF-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\MH126_2024_04_17_RF-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\MH128_2024_04_17_RF-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\MH128_2024_04_18_3R-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\MH131_2024_10_11_RF_3R_FOV2-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\MH131_2024_10_12_RF_3R-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\MH132_2024_10_11_RF_3R-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\MH132_2024_10_12_RF_3R-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_11_RF_3R-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_12_RF_3R-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_11_RF_3R-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_12_RF_3R-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_11_RF_3R-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_12_RF_3R-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_11_RF_3R-002_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_12_RF_3R-001_1\output\Behavior.mat'};

RF_speed=NaN(length(RF_files),1);
RF_lap=NaN(length(RF_files),1);
for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF_speed(mouse)= length(Behavior.time_idx_lap)/(Behavior.time(end)/60);
    RF_lap(mouse)=length(Behavior.time_idx_lap);
end

%'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\OCGOL\crossSession_update\PV_TC_corr.mat',...
OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_27_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\MH112_23_05_17_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\MH112_23_05_18_Random-001_4\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\MH113_23_05_23-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\MH113_23_05_24_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\MH114_23_05_24_Random-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\MH114_23_05_25_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\MH115_23_08_07_Random-001_6\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\MH115_23_08_08_Random-001_7\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\MH122_2024_05_01_Random-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\MH122_2024_05_02_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_01_Random-001_6\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_02_Random-001_7\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\MH124_2024_04_30_Random-001_6\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\MH124_2024_05_01_Random-001_7\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\MH126_2024_05_01_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\MH126_2024_05_02_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\MH127_2024_04_30_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\MH127_2024_05_01_Random-001_4\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\MH128_2024_05_04_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\MH128_2024_05_05_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\MH134_2024_10_28_Random-001_4\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\MH134_2024_10_29_Random-001_1\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_28_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_29_Random-001_4\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_25_Random-001_7\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_26_Random-001_2\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_27_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_28_Random-001_4\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_27_Random-001_3\output\Behavior.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_28_Random-001_4\output\Behavior.mat'};
    
OCGOL_speed=NaN(length(OCGOL_files),1);
OCGOL_lap_A=NaN(length(OCGOL_files),1);
OCGOL_lap_B=NaN(length(OCGOL_files),1);
for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL_speed(mouse)= length(Behavior.time_idx_lap)/(Behavior.time(end)/60);
    OCGOL_lap_A(mouse)=length(Behavior.rewards{1, 2}.full_laps.position);
    OCGOL_lap_B(mouse)=length(Behavior.rewards{1, 1}.full_laps.position);
end
%% Calculates average laps/min between the two sessions
RF_speed_paired = reshape(RF_speed,2,[]);
RF_speed_paired= mean(RF_speed_paired, 1);
OCGOL_speed_paired = reshape(OCGOL_speed,2,[]);
OCGOL_speed_paired= mean(OCGOL_speed_paired, 1);

RF_lap_paired= reshape(RF_lap,2,[]);
RF_lap_paired= mean(RF_lap_paired, 1);
OCGOL_lap_paired_A= reshape(OCGOL_lap_A,2,[]);
OCGOL_lap_paired_A= mean(OCGOL_lap_paired_A, 1);
OCGOL_lap_paired_B= reshape(OCGOL_lap_B,2,[]);
OCGOL_lap_paired_B= mean(OCGOL_lap_paired_B, 1);

RF_speed_label = [110 112 113 114 118 122 123 124 125 126 128];
OCGOL_speed_label = [110 112 113 114 115 122 123 124 126 127 128];

%%
%RF v OCGOL (PV score vs.speed) for RF, A, and B   
figure(4)
subplot(1,3,1);
scatter(OCGOL_speed_paired,OCGOL.meanPV_rel_d1.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_speed_paired,OCGOL.meanPV_rel_d1.B,[],[cmap_red(12,:)],'filled');
scatter(RF_speed_paired, RF.meanPV_rel_d1,[],[0 0.5 0 ],'filled');
title('PV vs. Speed')
legend({'OCGOL-A','OCGOL-B','RF'})
ylabel('PV Correlation')
xlabel('Speed (laps/min)')
box off
%RF v OCGOL (PV score vs.number of matched cells)
subplot(1,3,3);
scatter(OCGOL.PV_count.A,OCGOL.meanPV_rel_d1.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL.PV_count.B,OCGOL.meanPV_rel_d1.B,[],[cmap_red(12,:)],'filled');
scatter(RF.PV_count, RF.meanPV_rel_d1,[],[0 0.5 0 ],'filled');
title('PV vs. Number Matched Cells')
legend({'OCGOL-A','OCGOL-B','RF'})
ylabel('PV Correlation')
xlabel('Number Matched Active Cells')
subplot(1,3,2);
scatter(OCGOL_lap_paired_A,OCGOL.meanPV_rel_d1.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_lap_paired_B,OCGOL.meanPV_rel_d1.B,[],[cmap_red(12,:)],'filled');
scatter(RF_lap_paired, RF.meanPV_rel_d1,[],[0 0.5 0 ],'filled');
title('PV vs. Lap')
legend({'OCGOL-A','OCGOL-B','RF'})
ylabel('PV Correlation')
xlabel('Number of Laps')
%%

%RF v OCGOL (TC score vs.speed)
figure(5)
subplot(2,3,1);
scatter(OCGOL_speed_paired,OCGOL.meanTC_rel_d1.si.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_speed_paired,OCGOL.meanTC_rel_d1.si.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF_speed_paired, RF.meanTC_rel_d1.si  ,[],[0 0.5 0 ],'filled');
title('TC Corr (SI) vs. Speed')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Speed (Laps/min)')
ylabel('TC Correlation (SI)')
box off

subplot(2,3,4);
scatter(OCGOL_speed_paired,OCGOL.meanTC_rel_d1.ts.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_speed_paired,OCGOL.meanTC_rel_d1.ts.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF_speed_paired, RF.meanTC_rel_d1.ts  ,[],[0 0.5 0 ],'filled');
title('TC Corr (TS) vs. Speed')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Speed (Laps/min)')
ylabel('TC Correlation (TS)')

subplot(2,3,2);
scatter(OCGOL_lap_paired_A,OCGOL.meanTC_rel_d1.si.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_lap_paired_B,OCGOL.meanTC_rel_d1.si.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF_lap_paired, RF.meanTC_rel_d1.si  ,[],[0 0.5 0 ],'filled');
title('TC Corr (SI) vs. Lap')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Number of Laps')
ylabel('TC Correlation (SI)')


subplot(2,3,5);
scatter(OCGOL_lap_paired_A,OCGOL.meanTC_rel_d1.ts.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL_lap_paired_B,OCGOL.meanTC_rel_d1.ts.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF_lap_paired, RF.meanTC_rel_d1.ts  ,[],[0 0.5 0 ],'filled');
title('TC Corr (TS) vs. Lap')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Number of Laps')
ylabel('TC Correlation (TS)')

subplot(2,3,3);
scatter(OCGOL.TC_count.si.A,OCGOL.meanTC_rel_d1.si.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL.TC_count.si.B,OCGOL.meanTC_rel_d1.si.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF.TC_count.si, RF.meanTC_rel_d1.si  ,[],[0 0.5 0 ],'filled');
title('TC Corr (SI) vs. Number of Matched Tuned Cells')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Number of Matched Tuned Cells')
ylabel('TC Correlation (SI)')

subplot(2,3,6);
scatter(OCGOL.TC_count.ts.A,OCGOL.meanTC_rel_d1.ts.A,[],[cmap_blue(12,:)],'filled');
ylim([0 1])
hold on
scatter(OCGOL.TC_count.ts.B,OCGOL.meanTC_rel_d1.ts.B  ,[],[cmap_red(12,:)],'filled');
scatter(RF.TC_count.ts, RF.meanTC_rel_d1.ts  ,[],[0 0.5 0 ],'filled');
title('TC Corr (TS) vs. Number of Matched Tuned Cells')
legend({'OCGOL-A','OCGOL-B','RF'})
xlabel('Number of Matched Tuned Cells')
ylabel('TC Correlation (TS)')


%% TODO for event rate?
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\MH110_23_04_30-001_2\output\15_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\MH112_23_05_01-001_2\output\22_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\MH113_23_04_30-001_2\output\15_Aug_2024_ca_analysis',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\MH114_23_05_01-001_2\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\MH118_23_07_14_RF-001_2\output\09_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\MH122_2024_04_17_RF-001_3\output\06_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\MH123_2024_04_17_RF-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\MH124_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\MH125_2024_04_17_RF-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\MH126_2024_04_17_RF-001_2\output\06_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\MH128_2024_04_18_3R-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\MH131_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\MH132_2024_10_12_RF_3R-001_1\output\18_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_12_RF_3R-001_1\output\24_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_12_RF_3R-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_12_RF_3R-001_1\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_12_RF_3R-001_1\output\19_Jan_2025_ca_analysis.mat'};

%'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\OCGOL\crossSession_update\PV_TC_corr.mat',...
OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\MH110_23_05_26_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\MH112_23_05_17_Random-001_3\output\23_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\MH113_23_05_23-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\MH114_23_05_24_Random-001_1\output\16_Aug_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\MH115_23_08_07_Random-001_6\output\09_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\MH122_2024_05_01_Random-001_1\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\MH123_2024_05_01_Random-001_6\output\07_Sep_2024_ca_analysis',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\MH124_2024_04_30_Random-001_6\output\08_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\MH126_2024_05_01_Random-001_2\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\MH127_2024_04_30_Random-001_3\output\07_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\MH128_2024_05_04_Random-001_2\output\10_Sep_2024_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\MH134_2024_10_28_Random-001_4\output\16_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\MH135_2024_10_28_Random-001_3\output\24_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\MH136_2024_10_25_Random-001_7\output\27_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\MH137_2024_10_27_Random-001_3\output\25_Jan_2025_ca_analysis.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\MH138_2024_10_27_Random-001_3\output\16_Jan_2025_ca_analysis.mat'};

RF.event_rate_mean= NaN([length(RF_files),1]);
RF.event_rate_all= cell(1,length(RF_files));
OCGOL.event_rate_A_mean=NaN([length(OCGOL_files),1]);
OCGOL.event_rate_B_mean=NaN([length(OCGOL_files),1]);
OCGOL.event_rate_A_all=cell(1,length(OCGOL_files));
OCGOL.event_rate_B_all=cell(1,length(OCGOL_files));

RF.eventAUC_mean=NaN([length(RF_files),1]);
RF.eventAUC_all=cell(1,length(RF_files));
OCGOL.eventAUC_A_mean=NaN([length(OCGOL_files),1]);
OCGOL.eventAUC_B_mean=NaN([length(OCGOL_files),1]);
OCGOL.eventAUC_A_all=cell(1,length(OCGOL_files));
OCGOL.eventAUC_B_all=cell(1,length(OCGOL_files));

RF.eventAUC_mean=NaN([length(RF_files),1]);
RF.eventAUC_all=cell(1,length(RF_files));
OCGOL.eventAUC_A_mean=NaN([length(OCGOL_files),1]);
OCGOL.eventAUC_B_mean=NaN([length(OCGOL_files),1]);
OCGOL.eventAUC_A_all=cell(1,length(OCGOL_files));
OCGOL.eventAUC_B_all=cell(1,length(OCGOL_files));

RF.amp_mean=NaN([length(RF_files),1]);
RF.amp_all=cell(1,length(RF_files));
OCGOL.amp_A_mean=NaN([length(OCGOL_files),1]);
OCGOL.amp_B_mean=NaN([length(OCGOL_files),1]);
OCGOL.amp_A_all=cell(1,length(OCGOL_files));
OCGOL.amp_B_all=cell(1,length(OCGOL_files));

for mouse=1:length(RF_files)
    load(RF_files{mouse},'Behavior_split','Events_split')
    %Calculating events/min for RF during run
    run_dur=(sum(Behavior_split{1, 1}.run_ones)*.0334)/60;
    RF.event_rate_all{mouse}=Events_split{1, 1}.Run.properties.nb_events/run_dur;
    mean_event_rate= mean(Events_split{1, 1}.Run.properties.nb_events/run_dur); 
    RF.event_rate_mean(mouse)=mean_event_rate;   
    
    %Calculating event AUCs for RF during run
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 1}.Run.properties.AUC);
    averages = cellfun(@mean, Events_split{1, 1}.Run.properties.AUC(nonEmptyCells));
    RF.eventAUC_all{mouse}=averages;
    RF.eventAUC_mean(mouse)=mean(averages);

    %Calculating event amplitudes for RF during run
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 1}.Run.properties.amplitude);
    averages = cellfun(@mean, Events_split{1, 1}.Run.properties.amplitude(nonEmptyCells));
    RF.amp_all{mouse}=averages;
    RF.amp_mean(mouse)=mean(averages);
end

for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse},'Behavior_split','Events_split')
    %Calculating events/min for OCGOL during run
    run_dur_A=(sum(Behavior_split{1, 4}.run_ones)*.0334)/60;
    OCGOL.event_rate_A_all{mouse}=Events_split{1, 4}.Run.properties.nb_events/run_dur_A;
    mean_event_rate_A= mean(Events_split{1, 4}.Run.properties.nb_events/run_dur_A); 
    OCGOL.event_rate_A_mean(mouse)=mean_event_rate_A;   
    run_dur_B=(sum(Behavior_split{1, 5}.run_ones)*.0334)/60;
    OCGOL.event_rate_B_all{mouse}=Events_split{1, 5}.Run.properties.nb_events/run_dur_B;
    mean_event_rate_B= mean(Events_split{1, 5}.Run.properties.nb_events/run_dur_B); 
    OCGOL.event_rate_B_mean(mouse)=mean_event_rate_B;

    %Calculating event AUCs for OCGOL during run
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 4}.Run.properties.AUC);
    averages = cellfun(@mean, Events_split{1, 4}.Run.properties.AUC(nonEmptyCells));
    OCGOL.eventAUC_A_all{mouse}=averages;
    OCGOL.eventAUC_A_mean(mouse)=mean(averages);
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 5}.Run.properties.AUC);
    averages = cellfun(@mean, Events_split{1, 5}.Run.properties.AUC(nonEmptyCells));
    OCGOL.eventAUC_B_all{mouse}=averages;
    OCGOL.eventAUC_B_mean(mouse)=mean(averages);

    %Calculating event amplitudes for OCGOL during run
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 4}.Run.properties.amplitude);
    averages = cellfun(@mean, Events_split{1, 4}.Run.properties.amplitude(nonEmptyCells));
    OCGOL.amp_A_all{mouse}=averages;
    OCGOL.amp_A_mean(mouse)=mean(averages);
    nonEmptyCells = ~cellfun(@isempty, Events_split{1, 5}.Run.properties.amplitude);
    averages = cellfun(@mean, Events_split{1, 5}.Run.properties.amplitude(nonEmptyCells));
    OCGOL.amp_B_all{mouse}=averages;
    OCGOL.amp_B_mean(mouse)=mean(averages);
end
%%
figure()
rate_paired=[RF.event_rate_mean(idxInArray1),OCGOL.event_rate_A_mean(idxInArray2),OCGOL.event_rate_B_mean(idxInArray2)];
y=[mean(RF.event_rate_mean(idxInArray1)),mean(OCGOL.event_rate_A_mean(idxInArray2)),mean(OCGOL.event_rate_B_mean(idxInArray2))];
b=bar([1 2 3],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
ylim([0 6])
hold on
for ii=1:size(rate_paired,1)
    plot(rate_paired(ii,:),'Color',[0.5 0.5 0.5],'LineWidth',1)
end
errorbar([1 2 3],y,SEM_col(rate_paired),'Color', 'k','LineWidth',2.5);
xticklabels({'RF','OCGOL-A','OCGOL-B'})
ylabel('Event Rate (events/min)')
title('Event Rate')

figure()
AUC_paired=[RF.eventAUC_mean(idxInArray1),OCGOL.eventAUC_A_mean(idxInArray2),OCGOL.eventAUC_B_mean(idxInArray2)];
y=[mean(RF.eventAUC_mean(idxInArray1)),mean(OCGOL.eventAUC_A_mean(idxInArray2)),mean(OCGOL.eventAUC_B_mean(idxInArray2))];
b=bar([1 2 3],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
ylim([0 2])
hold on
for ii=1:size(AUC_paired,1)
    plot(AUC_paired(ii,:),'Color',[0.5 0.5 0.5],'LineWidth',1)
end
errorbar([1 2 3],y,SEM_col(AUC_paired),'Color', 'k','LineWidth',2.5);
xticklabels({'RF','OCGOL-A','OCGOL-B'})
ylabel('AUC/event')
title('AUC')

figure()
amp_paired=[RF.amp_mean(idxInArray1),OCGOL.amp_A_mean(idxInArray2),OCGOL.amp_B_mean(idxInArray2)];
y=[mean(RF.amp_mean(idxInArray1)),mean(OCGOL.amp_A_mean(idxInArray2)),mean(OCGOL.amp_B_mean(idxInArray2))];
b=bar([1 2 3],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
ylim([0 1.2])
hold on
for ii=1:size(amp_paired,1)
    plot(amp_paired(ii,:),'Color',[0.5 0.5 0.5],'LineWidth',1)
end
errorbar([1 2 3],y,SEM_col(amp_paired),'Color', 'k','LineWidth',2.5);
xticklabels({'RF','OCGOL-A','OCGOL-B'})
ylabel('Amplitude/event')
title('Amplitude')
%% Plots fraction tuned as bar graphs
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\tuned_logicals.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\tuned_logicals.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\tuned_logicals.mat'};

RF_fracTuned_ts = NaN([length(RF_files),1]);
OCGOL_A_fracTuned_ts = NaN([length(OCGOL_files),1]);
OCGOL_B_fracTuned_ts = NaN([length(OCGOL_files),1]);
RF_fracTuned_si = NaN([length(RF_files),1]);
OCGOL_B_fracTuned_ts = NaN([length(OCGOL_files),1]);
OCGOL_B_fracTuned_si = NaN([length(OCGOL_files),1]);

RF_siScore=NaN([length(RF_files_scores),1]);
OCGOL_A_siScore=NaN([length(OCGOL_files_scores),1]);
OCGOL_B_siScore=NaN([length(OCGOL_files_scores),1]);

RF_tsScore=NaN([length(RF_files_scores),1]);
OCGOL_A_tsScore=NaN([length(OCGOL_files_scores),1]);
OCGOL_B_tsScore=NaN([length(OCGOL_files_scores),1]);

for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF_fracTuned_ts(mouse)=sum(tuned_logicals.tuned_log_filt_ts{1, 2}.allA)/length(tuned_logicals.tuned_log_filt_ts{1, 2}.allA);
    RF_fracTuned_si(mouse)=sum(tuned_logicals.tuned_log_filt_si{1, 2}.allA)/length(tuned_logicals.tuned_log_filt_si{1, 2}.allA);
    
    load(RF_files_scores{mouse},'Place_cell')
    allSIScores=Place_cell{1, 1}.Spatial_Info.Spatial_Info_Skaggs(end,:);
    sigCells= find(tuned_logicals.tuned_log_filt_si{1, 2}.allA);
    RF_siScore(mouse)= mean(allSIScores(sigCells));
    
    allTSScores=Place_cell{1, 1}.Tuning_Specificity.tuning_specificity  ;
    sigCells= find(tuned_logicals.tuned_log_filt_ts{1, 2}.allA);
    RF_tsScore(mouse)= mean(allTSScores(sigCells));
end

for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL_A_fracTuned_ts(mouse)=sum(tuned_logicals.tuned_log_filt_ts{1, 1}.allA)/length(tuned_logicals.tuned_log_filt_ts{1, 1}.allA);
    OCGOL_B_fracTuned_ts(mouse)=sum(tuned_logicals.tuned_log_filt_ts{1, 1}.allB)/length(tuned_logicals.tuned_log_filt_ts{1, 1}.allB);
    OCGOL_A_fracTuned_si(mouse)=sum(tuned_logicals.tuned_log_filt_si{1, 1}.allA)/length(tuned_logicals.tuned_log_filt_si{1, 1}.allA);
    OCGOL_B_fracTuned_si(mouse)=sum(tuned_logicals.tuned_log_filt_si{1, 1}.allB)/length(tuned_logicals.tuned_log_filt_si{1, 1}.allB);
    
    load(OCGOL_files_scores{mouse},'Place_cell')
    allSIScores_A=Place_cell{1, 4}.Spatial_Info.Spatial_Info_Skaggs(end,:);
    allSIScores_B=Place_cell{1, 5}.Spatial_Info.Spatial_Info_Skaggs(end,:);
    sigCells_A= find(tuned_logicals.tuned_log_filt_si{1, 1}.allA);
    sigCells_B= find(tuned_logicals.tuned_log_filt_si{1, 1}.allB);
    OCGOL_A_siScore(mouse)= mean(allSIScores_A(sigCells_A));
    OCGOL_B_siScore(mouse)= mean(allSIScores_B(sigCells_B));
    
    allTSScores_A=Place_cell{1, 4}.Tuning_Specificity.tuning_specificity;
    allTSScores_B=Place_cell{1, 5}.Tuning_Specificity.tuning_specificity;
    sigCells_A= find(tuned_logicals.tuned_log_filt_ts{1, 1}.allA);
    sigCells_B= find(tuned_logicals.tuned_log_filt_ts{1, 1}.allB);
    OCGOL_A_tsScore(mouse)= mean(allTSScores_A(sigCells_A));
    OCGOL_B_tsScore(mouse)= mean(allTSScores_B(sigCells_B));
end

%%
fracTuned_si_paired=[RF_fracTuned_si(idxInArray1), OCGOL_A_fracTuned_si(idxInArray2)', OCGOL_B_fracTuned_si(idxInArray2)];
fracTuned_ts_paired=[RF_fracTuned_ts(idxInArray1), OCGOL_A_fracTuned_ts(idxInArray2), OCGOL_B_fracTuned_ts(idxInArray2)];


x_num = [1:3];
y = mean(fracTuned_si_paired);

figure('Renderer', 'painters', 'Position', [10 10 700 600])
subplot(1,1,1)
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
ylim([0 1])
hold on
for ii=1:size(fracTuned_si_paired,1)
    plot(fracTuned_si_paired(ii,:),'Color',[0.5 0.5 0.5],'LineWidth',1)
end
errorbar(x_num,y,SEM_col(fracTuned_si_paired),'Color', 'k','LineWidth',2.5);
box off
xticklabels({'RF','A-Far','B-Near'})
xtickangle(45);
ylabel('Fraction Tuned')
title('Fraction of Tuned Neurons')

% y = mean(fracTuned_ts_paired);
% 
% subplot(1,2,2)
% b=bar(x_num,y,0.4);
% b.FaceColor='flat';
% b.CData(1,:)= [0 0.5 0];
% b.CData(2,:)= [cmap_blue(12,:)];
% b.CData(3,:)= [cmap_red(12,:)];
% ylim([0 1])
% hold on
% for ii=1:size(fracTuned_ts_paired,1)
%     plot(fracTuned_ts_paired(ii,:),'Color',[0.5 0.5 0.5],'LineWidth',1.1)
% end
% errorbar(x_num,y,SEM_col(fracTuned_ts_paired),'Color', 'k','LineWidth',1.5);
% box off
% xticklabels({'RF','OCGOL-A','OCGOL-B'})
% xtickangle(45);
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')
%%
%plotting si and ts score
siScores_paired=[RF_siScore(idxInArray1), OCGOL_A_siScore(idxInArray2), OCGOL_B_siScore(idxInArray2)];
tsScores_paired=[RF_tsScore(idxInArray1), OCGOL_A_tsScore(idxInArray2), OCGOL_B_tsScore(idxInArray2)];

x_num = [1:3];
y = mean(siScores_paired);

figure('Renderer', 'painters', 'Position', [10 10 700 600])
subplot(1,1,1)
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
hold on
errorbar(x_num,y,SEM_col(siScores_paired),'Color','k','LineWidth',2.5);
for ii=1:size(siScores_paired,1)
    plot(siScores_paired(ii,:),'Color',[0.5 0.5 0.5])
end
box off
xticklabels({'RF','A-Far','B-Near'})
xtickangle(45);
ylabel('Spatial Information Score')
title('Spatial Information')
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')

% y = mean(tsScores_paired);
% 
% subplot(1,2,2)
% b=bar(x_num,y,0.4);
% b.FaceColor='flat';
% b.CData(1,:)= [0 0.5 0];
% b.CData(2,:)= [cmap_blue(12,:)];
% b.CData(3,:)= [cmap_red(12,:)];
% hold on
% errorbar(x_num,y,SEM_col(tsScores_paired),'Color','k');
% for ii=1:size(tsScores_paired,1)
%     plot(tsScores_paired(ii,:),'Color',[0.5 0.5 0.5])
% end
% box off
% xticklabels({'RF','OCGOL-A','OCGOL-B'})
% xtickangle(45);
% ylabel('Tuning Specificity')
%% RF/Br Only starts here can clear before 

% Define the base path to the folders
basePath = 'R:\MH\LEC_Bilateral_Silencing\Cohort_4\';

% Define the subdirectories
subDirs = {'MH131', 'MH132','MH135','MH137','MH138'};
numSes = 12;
numBrRF = numSes/2;
numBrRF_rel = numSes/2-1;
total_sbs=100;

% Initialize matrices for plotting all mouse data
%PV/TC data
RF.PV_D1 = NaN(length(subDirs),numBrRF_rel);
RF.PV_neighbor = NaN(length(subDirs),numBrRF_rel);
Br.PV_D1 = NaN(length(subDirs),numBrRF_rel);
Br.PV_neighbor = NaN(length(subDirs),numBrRF_rel);

RF.PV_neighbor_allsb = cell(1,numBrRF_rel);
RF.PV_neighbor_offdiag = cell(1,numBrRF_rel);
RF.PV_D1_offdiag = cell(1,numBrRF_rel);
Br.PV_neighbor_allsb = cell(1,numBrRF_rel);
Br.PV_neighbor_offdiag = cell(1,numBrRF_rel);
Br.PV_D1_offdiag = cell(1,numBrRF_rel);

RF.TC.si_D1 = NaN(length(subDirs),numBrRF_rel);
RF.TC.si_neighbor = NaN(length(subDirs),numBrRF_rel);
Br.TC.si_D1 = NaN(length(subDirs),numBrRF_rel);
Br.TC.si_neighbor = NaN(length(subDirs),numBrRF_rel);

RF.TC.ts_D1 = NaN(length(subDirs),numBrRF_rel);
RF.TC.ts_neighbor = NaN(length(subDirs),numBrRF_rel);
Br.TC.ts_D1 = NaN(length(subDirs),numBrRF_rel);
Br.TC.ts_neighbor = NaN(length(subDirs),numBrRF_rel);

RFvBr.PV_same = NaN(length(subDirs),numBrRF);
RFvBr.PV_same_allsb = cell(1,numBrRF);
RFvBr.PV_same_offdiag = cell(1,numBrRF);
RFvBr.TC.si_same = NaN(length(subDirs),numBrRF);
RFvBr.TC.ts_same = NaN(length(subDirs),numBrRF);

%Tuned fractions
RF.si.tunedfrac = NaN(length(subDirs),numBrRF);
Br.si.tunedfrac = NaN(length(subDirs),numBrRF);
RF.ts.tunedfrac = NaN(length(subDirs),numBrRF);
Br.ts.tunedfrac = NaN(length(subDirs),numBrRF);

%Recurrence
RF.si.recurr_D1 = NaN(length(subDirs),numBrRF_rel);
Br.si.recurr_D1 = NaN(length(subDirs),numBrRF_rel);
RFvBr.si.recurr = NaN(length(subDirs),numBrRF);

RF.ts.recurr_D1 = NaN(length(subDirs),numBrRF_rel);
Br.ts.recurr_D1 = NaN(length(subDirs),numBrRF_rel);
RFvBr.ts.recurr = NaN(length(subDirs),numBrRF);

RF.si.recurr_neighbor = NaN(length(subDirs),numBrRF_rel);
Br.si.recurr_neighbor = NaN(length(subDirs),numBrRF_rel);

RF.ts.recurr_neighbor = NaN(length(subDirs),numBrRF_rel);
Br.ts.recurr_neighbor = NaN(length(subDirs),numBrRF_rel);

Br_d1_ind= [2 4 6 8 10]; % only used for Br relative to d1 corr values

RF_ind = [2 4 6 8 10 12];
Br_ind = [1 3 5 7 9 11];
all_ind = 1:12;
sb = 0:2:200;

figure()
hold on
% Loop through each subdirectory
for i = 1:length(subDirs)
    % Construct the full path for the current directory
    dirPath = fullfile(basePath, subDirs{i}, 'BrvsRF_BrRFSes', 'crossSession_update');
    
    % Check if the directory exists
    if exist(dirPath, 'dir')
        % List of .mat files to load
        matFiles = {'PV_TC_corr.mat', 'tuned_logicals.mat', 'recurrence.mat'};
        
        % Loop through each .mat file
        for j = 1:length(matFiles)
            % Construct the full path for the current .mat file
            matFilePath = fullfile(dirPath, matFiles{j});
            
            % Check if the .mat file exists
            if exist(matFilePath, 'file')
                % Load the .mat file
                disp(['Loading file: ' matFilePath]);
                load(matFilePath);
                if j==1 %Requires sessions to be in the correct order
                    if ~strcmp(subDirs{i},'MH134')
                        RF.PV_D1(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,1);
                        RF.PV_neighbor(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        Br.PV_D1(i,:) = PV_TC_corr.meanPV_rel_d1.A(Br_d1_ind);  
                        Br.PV_neighbor(i,:) = PV_TCcorr_pickSes(Br_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        
                        temp_neighbor= PV_allsb_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        for kk=1:numBrRF_rel
                            RF.PV_neighbor_allsb{1,kk}(i,:)=temp_neighbor{kk};
                        end
                        temp_neighbor= PV_allsb_pickSes(Br_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        for kk=1:numBrRF_rel
                            Br.PV_neighbor_allsb{1,kk}(i,:)=temp_neighbor{kk};
                        end
                        temp_neighbor= PV_allsb_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,1);
                        for kk=1:numBrRF_rel
                            RF.PV_D1_allsb{1,kk}(i,:)=temp_neighbor{kk};
                        end
                        temp_neighbor= PV_allsb_pickSes(Br_ind,PV_TC_corr.PVcorr_all_ses.A,1);
                        for kk=1:numBrRF_rel
                            Br.PV_D1_allsb{1,kk}(i,:)=temp_neighbor{kk};
                        end

                        temp_neighbor= PV_allsb_offdiag_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        for kk=1:numBrRF_rel
                            RF.PV_neighbor_offdiag{1,kk}(i,:)=temp_neighbor{kk};
                        end
                        temp_neighbor= PV_allsb_offdiag_pickSes(Br_ind,PV_TC_corr.PVcorr_all_ses.A,2);
                        for kk=1:numBrRF_rel
                            Br.PV_neighbor_offdiag{1,kk}(i,:)=temp_neighbor{kk};
                        end
                        temp_neighbor= PV_allsb_offdiag_pickSes(RF_ind,PV_TC_corr.PVcorr_all_ses.A,1);
                        for kk=1:numBrRF_rel
                            RF.PV_D1_offdiag{1,kk}(i,:)=temp_neighbor{kk};
                        end  
                        temp_neighbor= PV_allsb_offdiag_pickSes(Br_ind,PV_TC_corr.PVcorr_all_ses.A,1);
                        for kk=1:numBrRF_rel
                            Br.PV_D1_offdiag{1,kk}(i,:)=temp_neighbor{kk};
                        end    

                        RF.TC.si_D1(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.TCcorr_all_ses.si.A,1);
                        RF.TC.si_neighbor(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.TCcorr_all_ses.si.A,2);
                        Br.TC.si_D1(i,:) = PV_TC_corr.meanTC_rel_d1.si.A(Br_d1_ind);
                        Br.TC.si_neighbor(i,:) = PV_TCcorr_pickSes(Br_ind,PV_TC_corr.TCcorr_all_ses.si.A,2);;

                        RF.TC.ts_D1(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.TCcorr_all_ses.ts.A,1);
                        RF.TC.ts_neighbor(i,:) = PV_TCcorr_pickSes(RF_ind,PV_TC_corr.TCcorr_all_ses.ts.A,2);
                        Br.TC.ts_D1(i,:) = PV_TC_corr.meanTC_rel_d1.ts.A(Br_d1_ind);
                        Br.TC.ts_neighbor(i,:) = PV_TCcorr_pickSes(Br_ind,PV_TC_corr.TCcorr_all_ses.ts.A,2);

                        RFvBr.PV_same(i,:) = PV_TCcorr_pickSes(all_ind,PV_TC_corr.PVcorr_all_ses.A,3);
                        
                        subplot(length(subDirs),4,i*4-3)
                        imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{2, 4})
                        caxis([0 1]);
                        title([subDirs{i} ': RF D1vD2'])
                        subplot(length(subDirs),4,i*4-2)
                        imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{8, 10})
                        caxis([0 1]);
                        title([subDirs{i} ': RF D4vD5'])
                        subplot(length(subDirs),4,i*4-1)
                        imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{1, 3})
                        caxis([0 1]);
                        title([subDirs{i} ': Br D1vD2'])  
                        subplot(length(subDirs),4,i*4)
                        imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{7, 9})
                        caxis([0 1]);
                        title([subDirs{i} ': Br D4vD5'])                            
%                         RFvBr.PV_same_offdiag = ;
%                         RFvBr.TC.si_same = ;
%                         RFvBr.TC.ts_same = ;

                    end
                end
                        
                if j==2
                    for ses=1:length(RF_ind)
                        RF.si.tunedfrac(i,ses)=sum(tunedLogical(RF_ind(ses)).si.Atuned)/length(tunedLogical(RF_ind(ses)).si.Atuned);
                        RF.ts.tunedfrac(i,ses)=sum(tunedLogical(RF_ind(ses)).ts.Atuned)/length(tunedLogical(RF_ind(ses)).ts.Atuned);
                    end
                    for ses=1:length(Br_ind)
                        Br.si.tunedfrac(i,ses)=sum(tunedLogical(Br_ind(ses)).si.Atuned)/length(tunedLogical(Br_ind(ses)).si.Atuned);
                        Br.ts.tunedfrac(i,ses)=sum(tunedLogical(Br_ind(ses)).ts.Atuned)/length(tunedLogical(Br_ind(ses)).ts.Atuned);
                    end
                end
                    
                if j==3
                    if ~strcmp(subDirs{i},'MH134')
                        RF.si.recurr_D1(i,:) = recurr_pickSes(RF_ind,recurr.si.A,1);
                        Br.si.recurr_D1(i,:) = recurr_pickSes(Br_ind,recurr.si.A,1);
                        RFvBr.si.recurr(i,:) = recurr_pickSes(all_ind,recurr.si.A,3);

                        RF.ts.recurr_D1(i,:) = recurr_pickSes(RF_ind,recurr.ts.A,1);
                        Br.ts.recurr_D1(i,:) = recurr_pickSes(Br_ind,recurr.ts.A,1);
                        RFvBr.ts.recurr(i,:) = recurr_pickSes(all_ind,recurr.ts.A,3);

                        RF.si.recurr_neighbor(i,:) = recurr_pickSes(RF_ind,recurr.si.A,2);
                        Br.si.recurr_neighbor(i,:) = recurr_pickSes(Br_ind,recurr.si.A,2);

                        RF.ts.recurr_neighbor(i,:) = recurr_pickSes(RF_ind,recurr.ts.A,2);
                        Br.ts.recurr_neighbor(i,:) = recurr_pickSes(Br_ind,recurr.ts.A,2);
                    end
                end
            else
                disp(['File does not exist: ' matFilePath]);
            end
        end
    else
        disp(['Directory does not exist: ' dirPath]);
    end
end
%%
% y= [mean(RF.si.recurr_neighbor(:,4)) mean(Br.si.recurr_neighbor(:,4))]
% bar([1 2],y)
% ylim([0 1])
% error= [SEM_col(RF.si.recurr_neighbor(:,4)) SEM_col(Br.si.recurr_neighbor(:,4))]
% hold on
% errorbar([1 2],y,error)
%%
% errorbar(mean(RF.PV_neighbor_offdiag{1, 4}),SEM_col(RF.PV_neighbor_offdiag{1, 4}),'LineWidth',1.5)
% hold on
% errorbar(mean(Br.PV_neighbor_offdiag{1, 4}), SEM_col(Br.PV_neighbor_offdiag{1, 4}),'LineWidth',)
% ylim([-.2 1])
%% PV corr
subplot(3,3,1)
errorbar(1:5, mean(RF.PV_D1),SEM_col(RF.PV_D1),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
hold on
errorbar(1:5, mean(Br.PV_D1),SEM_col(Br.PV_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('PV Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')
box off
legend({'RF','Br'})

subplot(3,3,3)
hold on
errorbar(1:5, mean(Br.PV_D1),SEM_col(Br.PV_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.PV_D1,1)
    plot(Br.PV_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('PV Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')

subplot(3,3,2)
hold on
errorbar(1:5, mean(RF.PV_D1),SEM_col(RF.PV_D1),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.PV_D1,1)
    plot(RF.PV_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('PV Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')

subplot(3,3,4)
errorbar(1:5, mean(RF.PV_neighbor),SEM_col(RF.PV_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
hold on
errorbar(1:5, mean(Br.PV_neighbor),SEM_col(Br.PV_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('PV Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')
box off

subplot(3,3,5)
hold on
errorbar(1:5, mean(RF.PV_neighbor),SEM_col(RF.PV_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.PV_neighbor,1)
    plot(RF.PV_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('PV Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')

subplot(3,3,6)
hold on
errorbar(1:5, mean(Br.PV_neighbor),SEM_col(Br.PV_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.PV_neighbor,1)
    plot(Br.PV_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('PV Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')

subplot(3,3,7)
errorbar(1:6, mean(RFvBr.PV_same),SEM_col(RFvBr.PV_same),'LineWidth',1.5)
ylim([0 0.5])
xlim([0 7])
title('PV Same Day')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')
box off

subplot(3,3,8)
hold on
errorbar(1:6, mean(RFvBr.PV_same),SEM_col(RFvBr.PV_same),'LineWidth',1.5)
for i=1:size(RFvBr.PV_same,1)
    plot(RFvBr.PV_same(i,:),'Color',[.5 .5 .5])
end
ylim([0 0.5])
xlim([0 7])
title('PV Same Day')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('PV Corr')
box off
%% TC corr
subplot(2,2,1)
hold on
errorbar(1:5, mean(RF.TC.si_D1),SEM_col(RF.TC.si_D1),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.si_D1),SEM_col(Br.TC.si_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (SI) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})
ylabel('TC Corr')
box off

subplot(2,2,2)
hold on
errorbar(1:5, mean(RF.TC.si_neighbor),SEM_col(RF.TC.si_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.si_neighbor),SEM_col(Br.TC.si_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (SI) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,2,3)
hold on
errorbar(1:5, mean(RF.TC.ts_D1),SEM_col(RF.TC.ts_D1),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.ts_D1),SEM_col(Br.TC.ts_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (TS) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,2,4)
hold on
errorbar(1:5, mean(RF.TC.ts_neighbor),SEM_col(RF.TC.ts_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.ts_neighbor),SEM_col(Br.TC.ts_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (TS) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off
%% TC with individual plotted for Relative to D1
subplot(2,3,1)
hold on
errorbar(1:5, mean(RF.TC.si_D1),SEM_col(RF.TC.si_D1),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.si_D1),SEM_col(Br.TC.si_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (SI) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})
ylabel('TC Corr')
box off

subplot(2,3,2)
hold on
errorbar(1:5, mean(RF.TC.si_D1),SEM_col(RF.TC.si_D1),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.TC.si_D1,1)
    plot(RF.TC.si_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (SI) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})
ylabel('TC Corr')

subplot(2,3,3)
hold on
errorbar(1:5, mean(Br.TC.si_D1),SEM_col(Br.TC.si_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.TC.si_D1,1)
    plot(Br.TC.si_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (SI) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})
ylabel('TC Corr')

subplot(2,3,4)
hold on
errorbar(1:5, mean(RF.TC.ts_D1),SEM_col(RF.TC.ts_D1),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.ts_D1),SEM_col(Br.TC.ts_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (TS) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,5)
hold on
errorbar(1:5, mean(RF.TC.ts_D1),SEM_col(RF.TC.ts_D1),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.TC.ts_D1,1)
    plot(RF.TC.ts_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (TS) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,6)
hold on
errorbar(1:5, mean(Br.TC.ts_D1),SEM_col(Br.TC.ts_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.TC.ts_D1,1)
    plot(Br.TC.ts_D1(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (TS) Rel D1')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off
%% TC with individual plotted for neighbor
subplot(2,3,1)
hold on
errorbar(1:5, mean(RF.TC.si_neighbor),SEM_col(RF.TC.si_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.si_neighbor),SEM_col(Br.TC.si_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (SI) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,2)
hold on
errorbar(1:5, mean(RF.TC.si_neighbor),SEM_col(RF.TC.si_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.TC.si_neighbor,1)
    plot(RF.TC.si_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (SI) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,3)
hold on
errorbar(1:5, mean(Br.TC.si_neighbor),SEM_col(Br.TC.si_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.TC.si_neighbor,1)
    plot(Br.TC.si_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (SI) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,4)
hold on
errorbar(1:5, mean(RF.TC.ts_neighbor),SEM_col(RF.TC.ts_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
errorbar(1:5, mean(Br.TC.ts_neighbor),SEM_col(Br.TC.ts_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
title('TC (TS) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,5)
hold on
errorbar(1:5, mean(RF.TC.ts_neighbor),SEM_col(RF.TC.ts_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
for i=1:size(RF.TC.ts_neighbor,1)
    plot(RF.TC.ts_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (TS) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off

subplot(2,3,6)
hold on
errorbar(1:5, mean(Br.TC.ts_neighbor),SEM_col(Br.TC.ts_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
for i=1:size(Br.TC.ts_neighbor,1)
    plot(Br.TC.ts_neighbor(i,:),'Color',[.5 .5 .5])
end
ylim([0 1])
xlim([0 6])
title('TC (TS) Neighbor')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)
ylabel('TC Corr')
box off
%% Tuned Fraction
subplot(1,2,1)
hold on
errorbar(1:6, mean(RF.si.tunedfrac),SEM_col(RF.si.tunedfrac))
errorbar(1:6, mean(Br.si.tunedfrac),SEM_col(Br.si.tunedfrac))
ylim([0 1])
xlim([0 7])
title('Fraction Tuned (SI)')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})

subplot(1,2,2)
hold on
errorbar(1:6, mean(RF.ts.tunedfrac),SEM_col(RF.ts.tunedfrac))
errorbar(1:6, mean(Br.ts.tunedfrac),SEM_col(Br.ts.tunedfrac))
ylim([0 1])
xlim([0 7])
title('Fraction Tuned (TS)')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})

%%
subplot(2,3,1)
hold on
errorbar(1:5, mean(RF.si.recurr_D1),SEM_col(RF.si.recurr_D1),'Color',[0 0.5 0],'LineWidth',1.5)
errorbar(1:5, mean(Br.si.recurr_D1),SEM_col(Br.si.recurr_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
title('Recurr Rel D1 (SI)')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
legend({'RF','Br'})

subplot(2,3,2)
hold on
errorbar(1:5, mean(RF.si.recurr_neighbor),SEM_col(RF.si.recurr_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
errorbar(1:5, mean(Br.si.recurr_neighbor),SEM_col(Br.si.recurr_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
title('Recurr Neighbor (SI)')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)

subplot(2,3,3)
hold on
errorbar(1:6, mean(RFvBr.si.recurr),SEM_col(RFvBr.si.recurr),'LineWidth',1.5)
ylim([0 1])
xlim([0 7])
title('Recurr Same Day (SI)')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)

subplot(2,3,4)
hold on
errorbar(1:5, mean(RF.ts.recurr_D1),SEM_col(RF.ts.recurr_D1),'Color',[0 0.5 0],'LineWidth',1.5)
errorbar(1:5, mean(Br.ts.recurr_D1),SEM_col(Br.ts.recurr_D1),'Color',[cmap_red(12,:)],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
title('Recurr Rel D1 (TS)')
xticks(1:5)
xticklabels({'D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)

subplot(2,3,5)
hold on
errorbar(1:5, mean(RF.ts.recurr_neighbor),SEM_col(RF.ts.recurr_neighbor),'Color',[0 0.5 0],'LineWidth',1.5)
errorbar(1:5, mean(Br.ts.recurr_neighbor),SEM_col(Br.ts.recurr_neighbor),'Color',[cmap_red(12,:)],'LineWidth',1.5)
ylim([0 1])
xlim([0 6])
title('Recurr Neighbor (TS)')
xticks(1:5)
xticklabels({'D1 vs D2','D2 v D3','D3 v D4','D4 v D5','D5 v D6 (CNO)'})
xtickangle(45)

subplot(2,3,6)
hold on
errorbar(1:6, mean(RFvBr.ts.recurr),SEM_col(RFvBr.ts.recurr),'LineWidth',1.5)
ylim([0 1])
xlim([0 7])
title('Recurr Same Day (TS)')
xticks(1:6)
xticklabels({'D1','D2','D3','D4','D5','D6 (CNO)'})
xtickangle(45)
%%
% Define the root directory and subfolder names
rootDir = 'R:\MH\LEC_Bilateral_Silencing\Cohort_4';
sb = 0:2:200;

% Get all mouse directories (MH131 to MH138)
mouseDirs = dir(fullfile(rootDir, 'MH*'));
mouseDirs = mouseDirs([mouseDirs.isdir]); % Ensure only directories are selected

% Initialize figure
figure;

% Loop through each mouse directory
for i = 1:length(mouseDirs)
    mouseDir = mouseDirs(i).name; % Mouse folder name (e.g., MH131)

    % Get the BrvsRF_BrRFSes folder inside each mouse directory
    brvsRFDir = fullfile(rootDir, mouseDir, 'BrvsRF_BrRFSes');

    % Get all the subfolders inside BrvsRF_BrRFSes, excluding 'crossSession_update'
    subFolders = dir(brvsRFDir);
    subFolders = subFolders([subFolders.isdir] & ~ismember({subFolders.name}, {'crossSession_update', '.' '..'}));

    % Sort the subfolders alphabetically
    subFolders = sort({subFolders.name});

    % Loop through each of the 12 subfolders
    for j = 1:length(subFolders)
        subfolderPath = fullfile(brvsRFDir, subFolders{j}, 'output');
        
        % Load the Behavior.mat file
        behaviorFile = fullfile(subfolderPath, 'Behavior.mat');
        if exist(behaviorFile, 'file')
            % Load the .mat file (assuming it's a structure with a field of interest)
            load(behaviorFile)

            % Plot data in the corresponding subplot for the mouse and subfolder
            subplot(length(mouseDirs), length(subFolders), (i-1) * length(subFolders) + j);
            imagesc([sb(1) sb(end)],[1 size(Behavior.lick.bin_licks_lap,1)], Behavior.lick.bin_licks_lap)
            caxis([0 10])
            title([mouseDir,' - ',num2str(j)]); % Title with mouse folder and subfolder name
            xlabel('Spatial Bin');
            ylabel('Lap');
        else
            disp(['Behavior.mat not found for: ', behaviorFile]);
        end
    end
end
%% Plots with RF1 and RF2 PV and LEC silencing - paired data only
x_num = [1:9];
y = [mean(match_PV), mean(RF.PV_neighbor(:,4)), mean(Br.PV_neighbor(:,4)), mean(y_comb(:,1)),mean(y_comb(:,2)),mean(y_comb(:,3)),mean(y_comb(:,4)) ];
figure()
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
b.CData(4,:)= [0 0.25 0];
b.CData(5,:)= [cmap_red(15,:)];
b.CData(6,:)= [cmap_blue(12,:)];
b.CData(7,:)= [cmap_blue(9,:)];
b.CData(8,:)= [cmap_red(12,:)];
b.CData(9,:)= [cmap_red(9,:)];
title('PV Correlation')
xlabel('Session Type')
ylabel('PV Correlation')
ylim([0 1]);
box off
hold on
match_int=[RF.PV_neighbor(:,4) Br.PV_neighbor(:,4)]; 
for i=1:size(match_int,1)
    plot([4 5],match_int(i,:),'Color',[.5 .5 .5],'LineWidth',1.1)
end
for i=1:size(match_PV,1)
    plot(match_PV(i,:),'Color',[.5 .5 .5],'LineWidth',1.1)
end
for i=1:size(y_comb,1)
    plot([6,7],y_comb(:,1:2),'Color',[.5 .5 .5])
end
for i=1:size(y_comb,1)
    plot([8,9],y_comb(:,3:4),'Color',[.5 .5 .5])
end
errorbar(x_num,y,[SEM_col(match_PV) SEM_col(RF.PV_neighbor(:,4)) SEM_col(Br.PV_neighbor(:,4)) SEM_col(y_comb(:,1)) SEM_col(y_comb(:,2)) SEM_col(y_comb(:,3)) SEM_col(y_comb(:,4))],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'RF1','OCGOL-A','OCGOL-B','RF2','OCGOL-B Only','Saline: A','CNO:A','Saline: B','CNO: B'})
xtickangle(45);
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
%%
x_num = [1:3];
y = mean(match_PV);
figure()
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
title('PV Correlation')
ylabel('PV Correlation')
ylim([0 1]);
box off
hold on

for i=1:size(match_PV,1)
    plot(match_PV(i,:),'Color',[.5 .5 .5],'LineWidth',1)
end

errorbar(x_num,y,SEM_col(match_PV),'.','CapSize',10,'LineWidth',2.5,'Color', 'k');
xticklabels({'RF','OCGOL-A','OCGOL-B','RF2','OCGOL-B Only','Saline: A','CNO:A','Saline: B','CNO: B'})
xtickangle(45);
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')
%% Plots with RF1 and RF2 TC
x_num = [1:5];
y = [mean(RF.meanTC_rel_d1.si), mean(OCGOL.meanTC_rel_d1.si.A), mean(OCGOL.meanTC_rel_d1.si.B), mean(RF.TC.si_neighbor(:,4)), mean(Br.TC.si_neighbor(:,4)) ];
figure()
b=bar(x_num,y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
b.CData(4,:)= [0 0.25 0];
b.CData(5,:)= [cmap_red(15,:)];
title('TC Correlation - SI')
xlabel('Session Type')
ylabel('TC Correlation')
ylim([0 1]);
box off
hold on
match_int=[RF.TC.si_neighbor(:,4) Br.TC.si_neighbor(:,4)]; 
for i=1:size(match_int,1)
    plot([4 5],match_int(i,:),'Color',[.5 .5 .5],'LineWidth',1.1)
end
for i=1:size(match_TC_si,1)
    plot(match_TC_si(i,[2,1,3]),'Color',[.5 .5 .5],'LineWidth',1.1)
end
errorbar(x_num,y,[RF_TC_SEM_si OCGOL_TC_A_SEM_si OCGOL_TC_B_SEM_si SEM_col(RF.TC.si_neighbor(:,4)) SEM_col(Br.TC.si_neighbor(:,4))],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'RF1','OCGOL-A','OCGOL-B','RF2','Br'})
%% Plots PV correlation across spatial bins in line plot for rf1 and rf2 (paired data only)
sb=[1:2:200];
figure()

subplot(1,4,1)
hold on
plot(sb,mean(RF.PV_allsb(idxInArray1,:)),'LineWidth',2.5,'Color',[0 0.5 0])
plot(sb,mean(OCGOL.PV_allsb.A(idxInArray2,:)),'LineWidth',2.5,'Color',cmap_blue(12,:))
ylim([0 1]);
legend({'RF','A-Far'},'AutoUpdate','off')
xline(sb(10),'LineWidth',2.5,'Color', [0 0 0])
xline(sb(28),'LineWidth',2.5,'Color', cmap_red(12,:))
xline(sb(70),'LineWidth',2.5,'Color', cmap_blue(12,:))
errorbar(sb,mean(RF.PV_allsb(idxInArray1,:)),SEM_col(RF.PV_allsb(idxInArray1,:)),'.','CapSize',0,'Color', [0 0.5 0],'LineWidth',2);
errorbar(sb,mean(OCGOL.PV_allsb.A(idxInArray2,:)),SEM_col(OCGOL.PV_allsb.A(idxInArray2,:)),'.','CapSize',0,'Color', cmap_blue(12,:),'LineWidth',2);
xlabel('Position (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Spatial Bin')
box off
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')

subplot(1,4,2)
hold on
plot(sb,mean(RF.PV_allsb(idxInArray1,:)),'LineWidth',2.5,'Color',[0 0.5 0])
plot(sb,mean(OCGOL.PV_allsb.B(idxInArray2,:)),'LineWidth',2.5,'Color',cmap_red(12,:))
legend({'RF','B-Near'},'AutoUpdate','off')
errorbar(sb,mean(RF.PV_allsb(idxInArray1,:)),SEM_col(RF.PV_allsb(idxInArray1,:)),'.','CapSize',0,'Color', [0 0.5 0],'LineWidth',2);
ylim([0 1]);
errorbar(sb,mean(OCGOL.PV_allsb.B(idxInArray2,:)),SEM_col(OCGOL.PV_allsb.B(idxInArray2,:)),'.','CapSize',0,'Color', cmap_red(12,:),'LineWidth',2);
xlabel('Position (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Spatial Bin')
xline(sb(10),'LineWidth',2.5,'Color', [0 0 0])
xline(sb(28),'LineWidth',2.5,'Color', cmap_red(12,:))
xline(sb(70),'LineWidth',2.5,'Color', cmap_blue(12,:))
box off
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')

subplot(1,4,3)
hold on
plot(sb,mean(OCGOL.PV_allsb.A(idxInArray2,:)),'LineWidth',2.5,'Color',cmap_blue(12,:))
ylim([0 1]);
plot(sb,mean(OCGOL.PV_allsb.B(idxInArray2,:)),'LineWidth',2.5,'Color',cmap_red(12,:))
legend({'A-Far','B-Near'},'AutoUpdate','off')
errorbar(sb,mean(OCGOL.PV_allsb.A(idxInArray2,:)),SEM_col(OCGOL.PV_allsb.A(idxInArray2,:)),'.','CapSize',0,'Color', cmap_blue(12,:),'LineWidth',2);
errorbar(sb,mean(OCGOL.PV_allsb.B(idxInArray2,:)),SEM_col(OCGOL.PV_allsb.B(idxInArray2,:)),'.','CapSize',0,'Color', cmap_red(12,:),'LineWidth',2);
xlabel('Position (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Spatial Bin')
xline(sb(10),'LineWidth',2.5,'Color', [0 0 0])
xline(sb(28),'LineWidth',2.5,'Color', cmap_red(12,:))
xline(sb(70),'LineWidth',2.5,'Color', cmap_blue(12,:))
box off
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')

subplot(1,4,4)
% hold on
% plot(sb, mean(RF.PV_neighbor_allsb{1, 4}),'LineWidth',1.5,'Color',[0 0.25 0])
% ylim([0 1])
% plot(sb,mean(Br.PV_neighbor_allsb{1,4}),'LineWidth',1.5,'Color',cmap_red(15,:))
% legend({'RF2','OCGOL-B Only'},'AutoUpdate','off')
% errorbar(sb,mean(RF.PV_neighbor_allsb{1, 4}), SEM_col(RF.PV_neighbor_allsb{1, 4}),'.','CapSize',0,'Color', [0 0.25 0],'LineWidth',1.5);
% errorbar(sb,mean(Br.PV_neighbor_allsb{1, 4}), SEM_col(Br.PV_neighbor_allsb{1, 4}),'.','CapSize',0,'Color', cmap_red(15,:),'LineWidth',1.5);
% xlabel('Position (cm)')
% ylabel('PV Correlation')
% %title('PV Correlation v. Spatial Bin')
% xline(sb(10),'LineWidth',1.5,'Color', [0 0 0])
% xline(sb(28),'LineWidth',1.5,'Color', cmap_red(12,:))
% xline(sb(70),'LineWidth',1.5,'Color', cmap_blue(12,:))
% box off

x0=10;
y0=10;
width=2500;
height=550;
set(gcf,'position',[x0,y0,width,height])
%% Plots PV correlation off diag for rf1 and rf2 (paired data only)
sb=[2:2:199];
figure()

subplot(1,4,1)
plot(sb,mean(RF.PV_offdiag(idxInArray1,:)),'Color',[0 0.5 0],'LineWidth',1.5)
hold on
plot(sb,mean(OCGOL.PV_offdiag.A(idxInArray2,:)),'Color',cmap_blue(12,:),'LineWidth',1.5)
legend({'RF','OCGOL-A'},'AutoUpdate','off')
ylim([-.2 1]);
errorbar(sb,mean(RF.PV_offdiag(idxInArray1,:)),SEM_col(RF.PV_offdiag(idxInArray1,:)),'.','CapSize',0,'Color', [0 0.5 0],'LineWidth',1.5);
errorbar(sb,mean(OCGOL.PV_offdiag.A(idxInArray2,:)),SEM_col(OCGOL.PV_offdiag.A(idxInArray2,:)),'.','CapSize',0,'Color', cmap_blue(12,:),'LineWidth',1.5);
xlabel('Distance Between Spatial Bins (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Distance (cm)')
box off

subplot(1,4,2)
plot(sb,mean(RF.PV_offdiag(idxInArray1,:)),'Color',[0 0.5 0],'LineWidth',1.5)
hold on
plot(sb,mean(OCGOL.PV_offdiag.B(idxInArray2,:)),'Color',cmap_red(12,:),'LineWidth',1.5)
legend({'RF','OCGOL-B'},'AutoUpdate','off')
errorbar(sb,mean(RF.PV_offdiag(idxInArray1,:)),SEM_col(RF.PV_offdiag(idxInArray1,:)),'.','CapSize',0,'Color', [0 0.5 0],'LineWidth',1.5);
ylim([-.2 1]);
errorbar(sb,mean(OCGOL.PV_offdiag.B(idxInArray2,:)),SEM_col(OCGOL.PV_offdiag.B(idxInArray2,:)),'.','CapSize',0,'Color', cmap_red(12,:),'LineWidth',1.5);
xlabel('Distance Between Spatial Bins (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Distance (cm)')
box off

subplot(1,4,3)
plot(sb,mean(OCGOL.PV_offdiag.A(idxInArray2,:)),'Color',cmap_blue(12,:),'LineWidth',1.5)
ylim([-.2 1]);
hold on
plot(sb,mean(OCGOL.PV_offdiag.B(idxInArray2,:)),'Color',cmap_red(12,:),'LineWidth',1.5)
legend({'OCGOL-A','OCGOL-B'},'AutoUpdate','off')
errorbar(sb,mean(OCGOL.PV_offdiag.A(idxInArray2,:)),SEM_col(OCGOL.PV_offdiag.A(idxInArray2,:)),'.','CapSize',0,'Color', cmap_blue(12,:),'LineWidth',1.5);
errorbar(sb,mean(OCGOL.PV_offdiag.B(idxInArray2,:)),SEM_col(OCGOL.PV_offdiag.B(idxInArray2,:)),'.','CapSize',0,'Color', cmap_red(12,:),'LineWidth',1.5);
xlabel('Distance Between Spatial Bins (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Distance (cm)')
box off

subplot(1,4,4)
plot(sb,mean(RF.PV_neighbor_offdiag{1, 4}),'Color',[0 0.25 0],'LineWidth',1.5)
ylim([-.2 1]);
hold on
plot(sb,mean(Br.PV_neighbor_offdiag{1, 4}),'Color',cmap_red(15,:),'LineWidth',1.5)
legend({'RF2','OCGOL-B Only'},'AutoUpdate','off')
errorbar(sb,mean(RF.PV_neighbor_offdiag{1, 4}),SEM_col(RF.PV_neighbor_offdiag{1, 4}),'.','CapSize',0,'Color',[0 0.25 0],'LineWidth',1.5);
errorbar(sb,mean(Br.PV_neighbor_offdiag{1, 4}),SEM_col(Br.PV_neighbor_offdiag{1, 4}),'.','CapSize',0,'Color', cmap_red(15,:),'LineWidth',1.5);
xlabel('Distance Between Spatial Bins (cm)')
ylabel('PV Correlation')
%title('PV Correlation v. Distance (cm)')
box off

x0=10;
y0=10;
width=2500;
height=550;
set(gcf,'position',[x0,y0,width,height])
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
%% Recurrence for rf1 and rf2 paired data only
y = [mean(RF.recurr.si(idxInArray1,:)),mean(OCGOL.recurr.si.A(idxInArray2,:)), mean(OCGOL.recurr.si.B(idxInArray2,:)),mean(OCGOL.recurr.si.AorB(idxInArray2,:)),...
    mean(RF.si.recurr_neighbor(:,4)),mean(Br.si.recurr_neighbor(:,4)) ];

%Plots recurrence bar graphs
figure()
b=bar([1 2 3 4 5 6],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
b.CData(4,:)= [cmap_purple(13,:)];
b.CData(5,:)= [0 0.25 0];
b.CData(6,:)= [cmap_red(15,:)];
title('Recurrence - SI')
xlabel('Session Type')
ylabel('Recurrence')
ylim([0 1]);
box off
hold on
for i=1:size(match_recurr_si,1)
    plot(match_recurr_si(i,:),'Color',[.5 .5 .5],'LineWidth', 1.1)
end

match_br=[RF.si.recurr_neighbor(:,4) Br.si.recurr_neighbor(:,4)];
for i=1:size(RF.si.recurr_neighbor,1)
    plot([5 6],match_br(i,:),'Color',[.5 .5 .5],'LineWidth', 1.1)
end
errorbar([1 2 3 4 5 6],y,[SEM_col(RF.recurr.si(idxInArray1,:)), SEM_col(OCGOL.recurr.si.A(idxInArray2,:)),...
    SEM_col(OCGOL.recurr.si.B(idxInArray2,:)), SEM_col(OCGOL.recurr.si.AorB(idxInArray2,:)),...
    SEM_col(RF.si.recurr_neighbor(:,4)), SEM_col(Br.si.recurr_neighbor(:,4))],'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
xticklabels({'RF','OCGOL-A','OCGOL-B','OCGOL-AorB','RF2','OCGOL-B Only'})

fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
%%
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\placeField_dist.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\placeField_dist.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\placeField_dist.mat'};

RF_mice = {'MH110','MH112','MH113','MH114','MH118','MH122','MH123','MH124','MH125','MH126','MH128','MH131','MH132','MH135','MH136','MH137','MH138'};
OCGOL_mice = {'MH110','MH112','MH113','MH114','MH115','MH122','MH123','MH124','MH126','MH127','MH128','MH134','MH135','MH136','MH137','MH138'};

RF.pfwidth.ts=NaN([length(RF_files),1]);
RF.pfwidth.si=NaN([length(RF_files),1]);
OCGOL.pfwidth.ts.A=NaN([length(OCGOL_files),1]);
OCGOL.pfwidth.ts.B=NaN([length(OCGOL_files),1]);
OCGOL.pfwidth.si.A=NaN([length(OCGOL_files),1]);
OCGOL.pfwidth.si.B=NaN([length(OCGOL_files),1]);

RF.pfcount.ts=NaN([length(RF_files),3]);
RF.pfcount.si=NaN([length(RF_files),3]);
OCGOL.pfcount.ts.A=NaN([length(OCGOL_files),3]);
OCGOL.pfcount.ts.B=NaN([length(OCGOL_files),3]);
OCGOL.pfcount.si.A=NaN([length(OCGOL_files),3]);
OCGOL.pfcount.si.B=NaN([length(OCGOL_files),3]);

for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF.pfwidth.ts(mouse)=mean(placeField_dist.all{1, 2}.A.ts.width_cm);
    RF.pfwidth.si(mouse)=mean(placeField_dist.all{1, 2}.A.si.width_cm);
    RF.pfcount.ts(mouse,:)=placeField_dist.all{1, 2}.A.ts.field_count_total  ;
    RF.pfcount.si(mouse,:)=placeField_dist.all{1, 2}.A.si.field_count_total  ;
end


for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL.pfwidth.ts.A(mouse)=mean(placeField_dist.all{1, 1}.A.ts.width_cm);
    OCGOL.pfwidth.ts.B(mouse)=mean(placeField_dist.all{1, 1}.B.ts.width_cm);
    OCGOL.pfwidth.si.A(mouse)=mean(placeField_dist.all{1, 1}.A.si.width_cm);
    OCGOL.pfwidth.si.B(mouse)=mean(placeField_dist.all{1, 1}.B.si.width_cm);
    OCGOL.pfcount.ts.A(mouse,:)= placeField_dist.all{1, 1}.A.ts.field_count_total;
    OCGOL.pfcount.ts.B(mouse,:)= placeField_dist.all{1, 1}.B.ts.field_count_total;  
    OCGOL.pfcount.si.A(mouse,:)= placeField_dist.all{1, 1}.A.si.field_count_total; 
    OCGOL.pfcount.si.B(mouse,:)= placeField_dist.all{1, 1}.B.si.field_count_total;
end
%% Plotting Place Field Width

pfwidth_ts=[RF.pfwidth.ts(idxInArray1,:),OCGOL.pfwidth.ts.A(idxInArray2,:) ,OCGOL.pfwidth.ts.B(idxInArray2,:)];
pfwidth_si=[RF.pfwidth.si(idxInArray1,:),OCGOL.pfwidth.si.A(idxInArray2,:) ,OCGOL.pfwidth.si.B(idxInArray2,:)];

figure('Renderer', 'painters', 'Position', [10 10 700 600])
% subplot(1,2,1)
% plot(mean(pfwidth_ts),'LineWidth',1.5,'Color', 'k')
% hold on
% for ii=1:size(pfwidth_ts,1)
%     plot(pfwidth_ts(ii,:),'Color',[0.5 0.5 0.5])
%     ylim([0 50])
% end
% ylabel('Width (cm)')
% errorbar([1 2 3],mean(pfwidth_ts),SEM_col(pfwidth_ts),'.','CapSize',10,'LineWidth',1.5,'Color', 'k');
% title('Place Field Width (TS)')
y = mean(pfwidth_si);

subplot(1,1,1)
b=bar([1 2 3],y,0.4);
b.FaceColor='flat';
b.CData(1,:)= [0 0.5 0];
b.CData(2,:)= [cmap_blue(12,:)];
b.CData(3,:)= [cmap_red(12,:)];
hold on
errorbar([1 2 3],y,SEM_col(pfwidth_si),'Color','k','LineWidth',2.5);
for ii=1:size(pfwidth_si,1)
    plot(pfwidth_si(ii,:),'Color',[0.5 0.5 0.5])
end
ylabel('Width (cm)')
title('Place Field Width')
box off
xticklabels({'RF','A-Far','B-Near'})
xtickangle(45);
set(gca,'linewidth',2.5)
fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 18)
set( findall(fh, '-property', 'fontweight'), 'fontweight', 'bold')
%% Place field counts

RF.pfcount_frac.ts= RF.pfcount.ts./(sum(RF.pfcount.ts,2));
RF.pfcount_frac.si= RF.pfcount.si./(sum(RF.pfcount.si,2));
OCGOL.pfcount_frac.ts.A= OCGOL.pfcount.ts.A./(sum(OCGOL.pfcount.ts.A,2));
OCGOL.pfcount_frac.ts.B= OCGOL.pfcount.ts.B./(sum(OCGOL.pfcount.ts.B,2));
OCGOL.pfcount_frac.si.A= OCGOL.pfcount.si.A./(sum(OCGOL.pfcount.si.A,2));
OCGOL.pfcount_frac.si.B= OCGOL.pfcount.si.B./(sum(OCGOL.pfcount.si.B,2));

pfcount_frac_ts_1=[RF.pfcount_frac.ts(idxInArray1,1), OCGOL.pfcount_frac.ts.A(idxInArray2,1),OCGOL.pfcount_frac.ts.B(idxInArray2,1)];
pfcount_frac_ts_2=[RF.pfcount_frac.ts(idxInArray1,2), OCGOL.pfcount_frac.ts.A(idxInArray2,2),OCGOL.pfcount_frac.ts.B(idxInArray2,2)];
pfcount_frac_ts_3=[RF.pfcount_frac.ts(idxInArray1,3), OCGOL.pfcount_frac.ts.A(idxInArray2,3),OCGOL.pfcount_frac.ts.B(idxInArray2,3)];
pfcount_frac_si_1=[RF.pfcount_frac.si(idxInArray1,1), OCGOL.pfcount_frac.si.A(idxInArray2,1),OCGOL.pfcount_frac.si.B(idxInArray2,1)];
pfcount_frac_si_2=[RF.pfcount_frac.si(idxInArray1,2), OCGOL.pfcount_frac.si.A(idxInArray2,2),OCGOL.pfcount_frac.si.B(idxInArray2,2)];
pfcount_frac_si_3=[RF.pfcount_frac.si(idxInArray1,3), OCGOL.pfcount_frac.si.A(idxInArray2,3),OCGOL.pfcount_frac.si.B(idxInArray2,3)];

figure(2)

subplot(1,2,1)
title('Place Field Count (TS)')
plot(mean(pfcount_frac_ts_1))
hold on
plot(mean(pfcount_frac_ts_2))
plot(mean(pfcount_frac_ts_3))
ylim([0 1])
legend({'1 PF','2 PF','3 PF'})
errorbar([1 2 3],mean(pfcount_frac_ts_1), SEM_col(pfcount_frac_ts_1))
for ii=1:size(pfcount_frac_ts_1,1)
    plot(pfcount_frac_ts_1(ii,:),'Color',[ 0.5 0.5 0.5])
end

subplot(1,2,2)
title('Place Field Count (SI)')
plot(mean(pfcount_frac_si_1))
hold on
plot(mean(pfcount_frac_si_2))
plot(mean(pfcount_frac_si_3))
ylim([0 1])
legend({'1 PF','2 PF','3 PF'})
errorbar([1 2 3],mean(pfcount_frac_si_1), SEM_col(pfcount_frac_si_1))
%%
RF_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\RF_2\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\RF_2\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH118\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH125\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH131\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH132\RF\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\RF\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\cent_diff.mat'};

OCGOL_files = {'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH110\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH112\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH113\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort1_Processed_RFvOCGOL\MH114\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort2_Processed_RFvOCGOL\MH115\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH122\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH124\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH126\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH127\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH128\OCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH134\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH135\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH136\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH137\RFvOCGOL\crossSession_update\cent_diff.mat',...
    'R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\cent_diff.mat'};

RF_mice = {'MH110','MH112','MH113','MH114','MH118','MH122','MH123','MH124','MH125','MH126','MH128','MH131','MH132','MH135','MH136','MH137','MH138'};
OCGOL_mice = {'MH110','MH112','MH113','MH114','MH115','MH122','MH123','MH124','MH126','MH127','MH128','MH134','MH135','MH136','MH137','MH138'};

edges=[0:5:100];
RF.pfCentrDistr= NaN([length(RF_files),length(edges)-1]);
OCGOL.pfCentrDistr_A= NaN([length(OCGOL_files),length(edges)-1]);
OCGOL.pfCentrDistr_B= NaN([length(OCGOL_files),length(edges)-1]);


for mouse=1:length(RF_files)
    load(RF_files{mouse})
    RF.pfCentrDistr(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 2}{1, 1});
end


for mouse=1:length(OCGOL_files)
    load(OCGOL_files{mouse})
    OCGOL.pfCentrDistr_A(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 1}{1, 4});
    OCGOL.pfCentrDistr_B(mouse,:)=pf_centroidDistr(cent_diff.all_sig_bin{1, 1}{1, 5});
end
%%
pos= 1:20;

subplot(1,3,1)
plot(mean(RF.pfCentrDistr),'Color',[0 0.5 0],'LineWidth',2)
hold on
plot(mean(OCGOL.pfCentrDistr_A),'Color',cmap_blue(12,:),'LineWidth',2)
ylim([0 0.12])
errorbar(pos,mean(RF.pfCentrDistr),SEM_col(RF.pfCentrDistr),'.','CapSize',10,'LineWidth',1.5,'Color',[0 0.5 0]);
errorbar(pos,mean(OCGOL.pfCentrDistr_A),SEM_col(OCGOL.pfCentrDistr_A),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_blue(12,:));

subplot(1,3,2)
plot(mean(RF.pfCentrDistr),'Color',[0 0.5 0],'LineWidth',2)
hold on
plot(mean(OCGOL.pfCentrDistr_B),'Color',cmap_red(12,:),'LineWidth',2)
ylim([0 0.12])
errorbar(pos,mean(RF.pfCentrDistr),SEM_col(RF.pfCentrDistr),'.','CapSize',10,'LineWidth',1.5,'Color',[0 0.5 0]);
errorbar(pos,mean(OCGOL.pfCentrDistr_B),SEM_col(OCGOL.pfCentrDistr_B),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_red(12,:));

subplot(1,3,3)
hold on
plot(mean(OCGOL.pfCentrDistr_A),'Color',cmap_blue(12,:),'LineWidth',2)
plot(mean(OCGOL.pfCentrDistr_B),'Color',cmap_red(12,:),'LineWidth',2)
ylim([0 0.12])
errorbar(pos,mean(OCGOL.pfCentrDistr_A),SEM_col(OCGOL.pfCentrDistr_A),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_blue(12,:));
errorbar(pos,mean(OCGOL.pfCentrDistr_B),SEM_col(OCGOL.pfCentrDistr_B),'.','CapSize',10,'LineWidth',1.5,'Color',cmap_red(12,:));
%%