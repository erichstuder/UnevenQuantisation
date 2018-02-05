%% signal 1
name = 'flow_lpm';
absTol = 5; %lpm
relTol = 0.3; %10%
minData = -100; %lpm
maxData = 100; %lpm

figure
hold on
grid on
plotBorders(absTol, relTol, minData, maxData)
plotQuantized(absTol, relTol, minData, maxData)

%% signal 2
%boolean
%name = 'flowValid';




%% signal 3
%enum

%% signal 4
%integer