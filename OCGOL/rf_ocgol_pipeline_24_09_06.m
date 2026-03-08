RF_sessions= {'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH127\MH127_2024_04_16_RF-001_1',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH118\MH118_23_07_13_RF-001_1',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH118\MH118_23_07_14_RF-001_2'}

OCGOL_sessions={'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH128\MH128_2024_05_04_Random-001_2',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH128\MH128_2024_05_05_Random-001_3',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH115\MH115_23_08_07_Random-001_6',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH115\MH115_23_08_08_Random-001_7',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH118\MH118_23_08_04_Random-001_6',...
    'R:\basulab\basulabspace\MH\LEC_Bilateral_Silencing\Stacks\MH118\MH118_23_08_05_Random-001_7'};
%%
for i_mouse=1:size(RF_sessions,2)
    try
    pipeline_V1_RFtest(RF_sessions{i_mouse})
    close all
    catch e
        fprintf(e.message)
        continue
    end
end

for i_mouse=1:size(OCGOL_sessions,2)
    try
    pipeline_V1(OCGOL_sessions{i_mouse})
    close all
    catch e
        fprintf(e.message)
        continue
    end
end