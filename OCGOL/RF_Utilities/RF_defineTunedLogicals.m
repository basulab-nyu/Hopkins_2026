function [tunedLogical] = defineTunedLogicals(animal_data,options)
%defines logical vectors for different classes of tuned neurons

%% Get logicals of neurons tuned using each metric SI or TS


%for each animal
for ss=options.sessionSelect%1:size(animal_data,2)
    %only use correct A or B vs all A or B
    if options.allCorrect == 1
        
        %using spatial information metric for each class
        tunedLogical(ss).si.Atuned = animal_data{ss}.Place_cell{1}.Spatial_Info.significant_ROI == 1;
        
        %using tuning specificity metric for each class
        tunedLogical(ss).ts.Atuned = animal_data{ss}.Place_cell{1}.Tuning_Specificity.significant_ROI == 1;
    else
        %using spatial information metric for each class
        tunedLogical(ss).si.Atuned = animal_data{ss}.Place_cell{1}.Spatial_Info.significant_ROI == 1;
        
        %using tuning specificity metric for each class
        tunedLogical(ss).ts.Atuned = animal_data{ss}.Place_cell{1}.Tuning_Specificity.significant_ROI == 1;
    end
        

    %A and B tuned by either SI or TS criteria
%find A&B tuned by either criterion (input option below)
%unclassified neurons get moved into mixed category
tuned_A_si_ts{ss} = tunedLogical(ss).si.Atuned  | tunedLogical(ss).ts.Atuned;

    
end

end

