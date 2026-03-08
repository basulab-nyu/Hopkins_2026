mouse_sessions = dir('*MR4*');

performance.incorrTwoTrials = NaN(1,length(mouse_sessions));
performance.incorrThreeTrials = NaN(1,length(mouse_sessions));
performance.corrTwoTrials = NaN(1,length(mouse_sessions));
performance.corrThreeTrials = NaN(1,length(mouse_sessions));

for i_folder = 1:length(mouse_sessions)
    thisFolder = fullfile(mouse_sessions(i_folder).name,'output');
    try
    load(fullfile(thisFolder,'Behavior.mat'));
    
    performance.corrTwoTrials(i_folder) = sum(Behavior.performance.trialOrder==2);
    performance.corrThreeTrials(i_folder) =  sum(Behavior.performance.trialOrder==3);
    performance.incorrTwoTrials(i_folder) = sum(Behavior.performance.trialOrder==20);
    performance.incorrThreeTrials(i_folder) =  sum(Behavior.performance.trialOrder==30);   
%     save(fullfile(thisFolder,'processedOutput'),'var1','var2');
    end
    
end

performance.allTwoTrials = performance.incorrTwoTrials+performance.corrTwoTrials;
performance.allThreeTrials = performance.incorrThreeTrials+performance.corrThreeTrials;
performance.scoreTwoTrials = performance.corrTwoTrials./performance.allTwoTrials;
performance.scoreThreeTrials = performance.corrThreeTrials./performance.allThreeTrials;
performance.allCorrTrials = performance.corrTwoTrials+performance.corrThreeTrials;
performance.totalTrials = performance.allTwoTrials +performance.allThreeTrials;
performance.scoreAllTrials = performance.allCorrTrials./performance.totalTrials;


save('R:\basulab\basulabspace\RZ\Maya_OCGOLTraining\MR4\performance\TrainingPerformance.mat','performance','mouse_sessions')