function [SEM] = SEM_col(data)
SEM=std(data)/sqrt(size(data,1));
end