function results = art_anova(y, subj, f1, f2)
% Nonparametric two-way ART ANOVA
% y    = response vector (Nx1)
% subj = subject ID vector (Nx1)
% f1   = categorical factor 1 (Nx1)
% f2   = categorical factor 2 (Nx1)

% Convert to categorical
subj = categorical(subj);
f1   = categorical(f1);
f2   = categorical(f2);

% Build base table
T = table(y, subj, f1, f2);

%% ---------------------------------------------------------------------
% 1. ALIGNMENT USING LINEAR MODELS
%% ---------------------------------------------------------------------
% Factor 1 aligned response
mdl_f1 = fitlm(T,'y ~ f2 + subj');
T.A1 = T.y - predict(mdl_f1, T);

% Factor 2 aligned response
mdl_f2 = fitlm(T,'y ~ f1 + subj');
T.A2 = T.y - predict(mdl_f2, T);

% Interaction aligned response
mdl_12 = fitlm(T,'y ~ f1 + f2 + subj');
T.A12 = T.y - predict(mdl_12, T);

%% ---------------------------------------------------------------------
% 2. RANK TRANSFORMATION
%% ---------------------------------------------------------------------
T.R1  = tiedrank(T.A1);
T.R2  = tiedrank(T.A2);
T.R12 = tiedrank(T.A12);

%% ---------------------------------------------------------------------
% 3. ANOVAs ON RANKED RESPONSES (Mixed-effects models)
%% ---------------------------------------------------------------------
results.factor1     = anova(fitlme(T,'R1 ~ f1 + (1|subj)'));
results.factor2     = anova(fitlme(T,'R2 ~ f2 + (1|subj)'));
results.interaction = anova(fitlme(T,'R12 ~ f1*f2 + (1|subj)'));

%% ---------------------------------------------------------------------
% 4. Return aligned & ranked responses for post-hoc tests
%% ---------------------------------------------------------------------
results.R_task        = T.R1;   % for main effect of f1 (Task)
results.R_bin         = T.R2;   % for main effect of f2 (Bin)
results.R_task_bin    = T.R12;  % for interaction Task×Bin
results.subj          = T.subj; % subject IDs
results.f1            = T.f1;
results.f2            = T.f2;
end
