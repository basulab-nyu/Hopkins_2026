
%% Remapping plots
cmap_blue=cbrewer('seq', 'Blues', 16);
cmap_red=cbrewer('seq', 'PuRd', 16);
cmap_red(15,2)=0;
cmap_green=cbrewer('seq','Greens',16);
cmap_green(15,1)=0;

%RF
load("R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\filtered_match_ROI\09_Sep_2024_filtered_match_ROIs.mat")
load("R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\RF\crossSession_update\matching_tun_curves.mat")
[~,RF1_peak] = max(matching_tun_curves.min_5_global_events.STC_norm{1, 1},[],2);
[~,RF1_order] = sort(RF1_peak);

S1_RF = matching_tun_curves.min_5_global_events.STC_norm{1, 1}(RF1_order,:);
S2_RF = matching_tun_curves.min_5_global_events.STC_norm{1, 2}(RF1_order,:);
sb = 0:2:200;

subplot(3,4,1)
imagesc([sb(1) sb(end)],[1 length(RF1_order)],S1_RF)
colormap(gca,cmap_green);
caxis([0 1])
ylabel('Neuron')
xlabel('Position (cm)')
title('RF D1')
colorbar()
subplot(3,4,2)
imagesc([sb(1) sb(end)],[1 length(RF1_order)],S2_RF)
colormap(gca,cmap_green);
caxis([0 1])
xlabel('Position (cm)')
title('RF D2 Rel D1')

load("R:\MH\LEC_Bilateral_Silencing\Cohort3_Processed_RFvOCGOL\MH123\OCGOL\crossSession_update\matching_tun_curves.mat")
indices = find(~isnan(ROI_assign_multi_filtered(:,1)) & ~isnan(ROI_assign_multi_filtered(:,2)));
[~,OCGOLA_peak] = max(matching_tun_curves.min_5_global_events.STC_norm{1, 1},[],2);
[~,OCGOLA_order] = sort(OCGOLA_peak);

S1_OCGOLA = matching_tun_curves.min_5_global_events.STC_norm{1, 1}(OCGOLA_order,:);
S2_OCGOLA = matching_tun_curves.min_5_global_events.STC_norm{1, 2}(OCGOLA_order,:);

subplot(3,4,5)
imagesc([sb(1) sb(end)],[1 length(OCGOLA_order)],S1_OCGOLA)
colormap(gca,cmap_blue);
caxis([0 1])
ylabel('Neuron')
xlabel('Position (cm)')
title('OCGOL-A D1')
colorbar()
subplot(3,4,6)
imagesc([sb(1) sb(end)],[1 length(OCGOLA_order)],S2_OCGOLA)
colormap(gca,cmap_blue);
caxis([0 1])
xlabel('Position (cm)')
title('OCGOL-A D2 Rel D1')

indices = find(~isnan(ROI_assign_multi_filtered(:,1)) & ~isnan(ROI_assign_multi_filtered(:,2)));
[~,OCGOLB_peak] = max(matching_tun_curves.min_5_global_events.STC_norm{2, 1},[],2);
[~,OCGOLB_order] = sort(OCGOLB_peak);

S1_OCGOLB = matching_tun_curves.min_5_global_events.STC_norm{2, 1}(OCGOLB_order,:);
S2_OCGOLB = matching_tun_curves.min_5_global_events.STC_norm{2, 2}(OCGOLB_order,:);

subplot(3,4,9)
imagesc([sb(1) sb(end)],[1 length(OCGOLB_order)],S1_OCGOLB)
colormap(gca,cmap_red);
colorbar()
caxis([0 1])
ylabel('Neuron')
xlabel('Position (cm)')
title('OCGOL-B D1')
subplot(3,4,10)
imagesc([sb(1) sb(end)],[1 length(OCGOLB_order)],S2_OCGOLB)
colormap(gca,cmap_red);
caxis([0 1])
xlabel('Position (cm)')
title('OCGOL-B D2 Rel D1')

% load("R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\BrvsRF_BrRFSes\crossSession_update\filtered_match_ROI\24_Feb_2025_filtered_match_ROIs.mat");
% load("R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\BrvsRF_BrRFSes\crossSession_update\matching_tun_curves.mat");
% 
% indices = find(~isnan(ROI_assign_multi_filtered(:,8)) & ~isnan(ROI_assign_multi_filtered(:,10)));
% [~,RF_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 8}(indices,:),[],2);
% [~,RF_order] = sort(RF_peak);
% RF_order=indices(RF_order);
% 
% S1_RF = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 8}(RF_order,:);
% S2_RF = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 10}(RF_order,:);
% 
% subplot(3,4,3)
% imagesc([sb(1) sb(end)],[1 length(RF1_order)],S1_RF)
% colormap(gca,cmap_green);
% caxis([0 1])
% ylabel('Neuron')
% xlabel('Position (cm)')
% title('RF D1')
% subplot(3,4,4)
% imagesc([sb(1) sb(end)],[1 length(RF1_order)],S2_RF)
% colormap(gca,cmap_green);
% caxis([0 1])
% xlabel('Position (cm)')
% title('RF D2 Rel D1')
% 
% indices = find(~isnan(ROI_assign_multi_filtered(:,7)) & ~isnan(ROI_assign_multi_filtered(:,9)));
% [~,Br_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 7}(indices,:),[],2);
% [~,Br_order] = sort(Br_peak);
% Br_order=indices(Br_order);
% 
% S1_Br = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 7}(Br_order,:);
% S2_Br = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 9}(Br_order,:);
% 
% subplot(3,4,7)
% imagesc([sb(1) sb(end)],[1 length(Br_order)],S1_Br)
% colormap(gca,cmap_red);
% caxis([0 1])
% ylabel('Neuron')
% xlabel('Position (cm)')
% title('OCGOL-Br D1')
% subplot(3,4,8)
% imagesc([sb(1) sb(end)],[1 length(Br_order)],S2_Br)
% colormap(gca,cmap_red);
% caxis([0 1])
% xlabel('Position (cm)')
% title('OCGOL-Br D2 Rel D1')
% 
% fh = findall(0,'Type','Figure');
% set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
%%
%% sample MH138 plot
subplot(3,2,1)
%subplot(1,5,1)
load("R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\RF\PV_TC_corr.mat")
imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{1, 2})
colormap(gca,cmap_green);
caxis([-.25 1]);
colorbar()
xlabel('Position (cm)')
ylabel('Position (cm)')
title('RF v RF')

subplot(3,2,3)
%subplot(1,5,2)
load("R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\RFvOCGOL\crossSession_update\PV_TC_corr.mat")
imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{1, 2})
colormap(gca,cmap_blue);
caxis([-.25 1]);
colorbar()
xlabel('Position (cm)')
ylabel('Position (cm)')
title('OCGOL A vs A')

subplot(3,2,5)
%subplot(1,5,3)
imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.B{1, 2})
colormap(gca,cmap_red);
colorbar()
caxis([-.25 1]);
xlabel('Position (cm)')
ylabel('Position (cm)')
title('OCGOL B vs B')

load("R:\MH\LEC_Bilateral_Silencing\Cohort_4\MH138\BrvsRF_BrRFSes\crossSession_update\PV_TC_corr.mat")
subplot(3,2,2)
%subplot(1,5,4)
imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{8, 10})
colormap(gca,cmap_green);
caxis([-.25 1]);
xlabel('Position (cm)')
ylabel('Position (cm)')
title('RF2 vs RF2')

subplot(3,2,4)
%subplot(1,5,5)
imagesc([sb(1) sb(end)],[sb(1) sb(end)], PV_TC_corr.PVcorr_all_ses.A{7, 9})
colormap(gca,cmap_red);
caxis([-.25 1]);
xlabel('Position (cm)')
ylabel('Position (cm)')
title('OCGOL B Only vs B Only')

fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 14)
% 
% %Control (B trials) 1,2
% [~,ctrlB_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 1},[],2);
% [~,ctrlB_order] = sort(ctrlB_peak);
% 
% S1_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 1}(ctrlB_order,:);
% S2_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2}(ctrlB_order,:);
% 
% %Silence trials (A trials) 2,3
% [~,cnoA_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 2},[],2);
% [~,cnoA_order] = sort(cnoA_peak);
% 
% S3_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 2}(cnoA_order,:);
% S4_A = matching_tun_curves.min_5_events_both_A_B.STC_norm{1, 3}(cnoA_order,:);
% 
% %Silence trials (B trials) 2,3 
% [~,cnoB_peak] = max(matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2},[],2);
% [~,cnoB_order] = sort(cnoB_peak);
% 
% S3_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 2}(cnoB_order,:);
% S4_B = matching_tun_curves.min_5_events_both_A_B.STC_norm{2, 3}(cnoB_order,:);

% %%
% cmap_blue=cbrewer('seq', 'Blues', 16);
% cmap_red=cbrewer('seq', 'Reds', 16);
% 
% notnan = find(~isnan(S1_A(:,1)));
% notnan_ind = notnan(1);
% figure(1)
% subplot(2,4,1)
% imagesc(S1_A(notnan_ind:size(S1_A,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_blue);
% subplot(2,4,2)
% imagesc(S2_A(notnan_ind:size(S1_A,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_blue);
% 
% notnan = find(~isnan(S3_A(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,5)
% imagesc(S3_A(notnan_ind:size(S3_A,1),:))
% colormap(gca,cmap_blue);
% ylabel('ROI')
% xlabel('Spatial Bin')
% subplot(2,4,6)
% imagesc(S4_A(notnan_ind:size(S3_A,1),:))
% colormap(gca,cmap_blue);
% ylabel('ROI')
% xlabel('Spatial Bin')
% 
% notnan = find(~isnan(S1_B(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,3)
% imagesc(S1_B(notnan_ind:size(S1_B,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_red);
% subplot(2,4,4)
% imagesc(S2_B(notnan_ind:size(S1_B,1),:))
% ylabel('ROI')
% xlabel('Spatial Bin')
% colormap(gca,cmap_red);
% 
% notnan = find(~isnan(S3_B(:,1)));
% notnan_ind = notnan(1);
% subplot(2,4,7)
% imagesc(S3_B(notnan_ind:size(S3_B,1),:))
% colormap(gca,cmap_red);
% ylabel('ROI')
% xlabel('Spatial Bin')
% subplot(2,4,8)
% imagesc(S4_B(notnan_ind:size(S3_B,1),:))
% colormap(gca,cmap_red);
% ylabel('ROI')
% xlabel('Spatial Bin')
% 
% set(gcf,'position',[50,50,800,500])