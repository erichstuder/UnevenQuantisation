%% signal 1
name = 'flow_lpm';
absTol = 5; %lpm
relTol = 0.3; %10%
minData = -100; %lpm
maxData = -minData; %lpm

close all
figure
hold on
grid on
plotBorders(minData, maxData, absTol, relTol)
plotQuantized(minData, maxData, absTol, relTol)
%plotBinary(minData, maxData, absTol, relTol)

relTolOptimized = optimizeRelTol(maxData, absTol, relTol)

plotBorders(minData, maxData, absTol, relTolOptimized)
plotQuantized(minData, maxData, absTol, relTolOptimized)

%% signal 2
%boolean
%name = 'flowValid';




%% signal 3
%enum

%% signal 4
%integer