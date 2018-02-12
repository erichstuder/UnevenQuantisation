%% init
clc
close all
signals = [];


%% signal 1
signal1.name = 'flow_lpm';
signal1.absTol = 5; %lpm
signal1.relTol = 0.3; %10%
signal1.minData = -100; %lpm
signal1.maxData = -signal1.minData; %lpm
signals = [signals signal1];

figure
hold on
grid on
plotBorders(signal1)
plotQuantized(signal1)
%plotBinary(signal1)

signal1.relTol = optimizeRelTol(signal1);
plotBorders(signal1)
plotQuantized(signal1)

%signal1.absTol = optimizeAbsTol(signal1);
%plotBorders(signal1)
%plotQuantized(signal1)


%% signal 2
signal2.name = 'pressDiff_Pa';
signal2.absTol = 50; %Pa
signal2.relTol = 0; % no relTol
signal2.minData = -500; %Pa
signal2.maxData = -signal2.minData; %Pa
signals = [signals signal1];

figure
hold on
grid on
plotBorders(signal2)
plotQuantized(signal2)

signal2.absTol = optimizeAbsTol(signal2);
plotBorders(signal2)
plotQuantized(signal2)
