function [SEM] = SEM_col_exNan(data)
SEM=std(data,'omitnan')./sqrt(sum(~isnan(data)));
end