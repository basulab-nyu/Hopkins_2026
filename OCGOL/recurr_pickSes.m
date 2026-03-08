function [compCorr] = recurr_pickSes(sessions, sessCompMatrix,comparison)
if comparison==1 %for relative to day 1
    compCorr = NaN(length(sessions)-1,1);
    rel_d1 = sessCompMatrix(sessions(1),sessions(2:end));
  	compCorr=rel_d1;
end
if comparison==2 %for relative to neighboring day
    compCorr = NaN(length(sessions)-1,1);
    for i_sess = 1:length(sessions)-1
        compCorr(i_sess)=sessCompMatrix(sessions(i_sess),sessions(i_sess+1));
    end
end
if comparison==3 %for same day
    compCorr = NaN(length(sessions)/2,1);
    for i_sess=1:(length(sessions)/2);
        compCorr(i_sess)=sessCompMatrix(sessions(2*i_sess),sessions((2*i_sess)-1));
    end
end    