function dataStruct = centroid_distrib(matchedMice, cent_files,tunedLog_files, trialType)
% Computes spatial information and tuning specificity stats from Place_cell data.
% matchedMice: cell array of names of mice with a matching RF and OCGOL
% session 
% ca_files: cell array of ca analysis .mat file names for matched mice
% cent_files: cell array of cent_diff .mat file names for matched mice that is from cross session
% analysis
% trialType: 1= RF, 2=OCGOL
% Returns a struct with various fields filled in per mouse

edges = 0:5:100;
nMice = length(matchedMice);
if trialType==1
    dataStruct.CentrDistr_si = NaN(nMice,length(edges)-1);
    dataStruct.Centroids_mean = NaN(1,nMice);
else
    dataStruct.CentrDistr_si.allA = NaN(nMice,length(edges)-1);
    dataStruct.CentrDistr_si.allB = NaN(nMice,length(edges)-1);
    dataStruct.CentrDistr_si.onlyA = NaN(nMice,length(edges)-1);
    dataStruct.CentrDistr_si.onlyB = NaN(nMice,length(edges)-1);
    dataStruct.Centroids_mean.allA = NaN(1,nMice);
    dataStruct.Centroids_mean.allB = NaN(1,nMice);
    dataStruct.Centroids_mean.onlyA = NaN(1,nMice);
    dataStruct.Centroids_mean.onlyB = NaN(1,nMice);
end
    for i = 1:nMice    
        %Load in centroid data
        load_tuned = load(tunedLog_files{i});
        load_cent = load(cent_files{i});
        if trialType==1
            centMatrix=load_cent.cent_diff.max_bin{1,2}; 
            tuned_idx=find(load_tuned.tuned_logicals.tuned_log_filt_si{1,2}.allA);

            % ---- Extract relevant centroids ----
            tuned_centroid =centMatrix(tuned_idx);
            tuned_centroid = tuned_centroid(~isnan(tuned_centroid));
            dataStruct.Centroids_mean(i)=mean(tuned_centroid);

            % ---- Histogram counts (20 bins) ----
            dataStruct.CentrDistr_si(i,:) = histcounts(tuned_centroid,edges)/length(tuned_centroid);
        else 
            centMatrix_A=load_cent.cent_diff.max_bin{1,1}(1,:); %A centroids
            centMatrix_B=load_cent.cent_diff.max_bin{1,1}(2,:); %B centroids
            Atuned_idx = find(load_tuned.tuned_logicals.tuned_log_filt_si{1,1}.allA);
            Btuned_idx = find(load_tuned.tuned_logicals.tuned_log_filt_si{1,1}.allB);
            Aselective_idx = find(load_tuned.tuned_logicals.tuned_log_filt_si{1,1}.onlyA);
            Bselective_idx = find(load_tuned.tuned_logicals.tuned_log_filt_si{1,1}.onlyB);

            % ---- Extract relevant centroids ----
            A_tuned_centroid = centMatrix_A(Atuned_idx);
            A_tuned_centroid = A_tuned_centroid(~isnan(A_tuned_centroid));
            dataStruct.Centroids_mean.allA(i)=mean(A_tuned_centroid);
            B_tuned_centroid = centMatrix_B(Btuned_idx);
            B_tuned_centroid = B_tuned_centroid(~isnan(B_tuned_centroid));
            dataStruct.Centroids_mean.allB(i)=mean(B_tuned_centroid);
            Aonly_tuned_centroid = centMatrix_A(Aselective_idx);
            Aonly_tuned_centroid = Aonly_tuned_centroid(~isnan(Aonly_tuned_centroid));
            dataStruct.Centroids_mean.onlyA(i)=mean(Aonly_tuned_centroid);
            Bonly_tuned_centroid = centMatrix_B(Bselective_idx);
            Bonly_tuned_centroid = Bonly_tuned_centroid(~isnan(Bonly_tuned_centroid));
            dataStruct.Centroids_mean.onlyB(i)=mean(Bonly_tuned_centroid);

            % ---- Histogram counts (20 bins) ----
            dataStruct.CentrDistr_si.allA(i,:) = histcounts(A_tuned_centroid,edges)/length(A_tuned_centroid);
            dataStruct.CentrDistr_si.allB(i,:) = histcounts(B_tuned_centroid,edges)/length(B_tuned_centroid);
            dataStruct.CentrDistr_si.onlyA(i,:) = histcounts(Aonly_tuned_centroid,edges)/length(Aonly_tuned_centroid);
            dataStruct.CentrDistr_si.onlyB(i,:) = histcounts(Bonly_tuned_centroid,edges)/length(Bonly_tuned_centroid);
        end

end
