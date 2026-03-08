function [compCorr] = PV_allsb_offdiag_pickSes(sessions, sessCompMatrix,comparison)
if comparison==1 %for relative to day 1
   compCorr = cell(length(sessions)-1,1);
   for ii=1:length(sessions)-1
       temp_matrix=sessCompMatrix{sessions(1),sessions(ii+1)}; 
       offdiag_sess=NaN(1,99);
       for jj=1:99 % number of spatial bin differences
           temp_offdiag= mean(diag(temp_matrix,jj));
           offdiag_sess(jj)=temp_offdiag;
       end
       compCorr{ii}=offdiag_sess;
   end
         
end

if comparison==2 %for relative to neighboring day
    compCorr = cell(length(sessions)-1,1);
    for ii=1:length(sessions)-1
        temp_matrix=sessCompMatrix{sessions(ii),sessions(ii+1)}; 
        offdiag_sess=NaN(1,99);       
        for jj=1:99 % number of spatial bin differences
           temp_offdiag= mean(diag(temp_matrix,jj));
           offdiag_sess(jj)=temp_offdiag;
       end
       compCorr{ii}=offdiag_sess;
    end
end
    
% if comparison==3 %for same day TODO fix indexing of matrix
%     compCorr = cell(length(sessions)/2,1);
%     for ii=1:(length(sessions)/2);
%         compCorr(ii)=corr_sessCompMatrix(sessions(2*ii),sessions((2*ii)-1));
%     end
% end