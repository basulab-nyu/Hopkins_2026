function [compCorr] = PV_allsb_pickSes(sessions, sessCompMatrix,comparison)
corr_sessCompMatrix = cellfun(@(x) diag(x),sessCompMatrix,'UniformOutput',false);
if comparison==1 %for relative to day 1
   compCorr = NaN(length(sessions)-1,1);
   rel_d1 = corr_sessCompMatrix(sessions(1),sessions(2:end));
   compCorr=rel_d1;
end
if comparison==2 %for relative to neighboring day
    compCorr = cell(length(sessions)-1,1);
    for i_sess = 1:length(sessions)-1
        compCorr(i_sess)=corr_sessCompMatrix(sessions(i_sess),sessions(i_sess+1));
    end
end
    
% if comparison==3 %for same day TODO fix the ordering of indexing
%     compCorr = cell(length(sessions)/2,1);
%     for i_sess=1:(length(sessions)/2);
%         compCorr(i_sess)=corr_sessCompMatrix(sessions(2*i_sess),sessions((2*i_sess)-1));
%     end
% end