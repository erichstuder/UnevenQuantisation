%% init
%before the first call execute initEnvironment.m
clc
close all
signals = [];


%% signal 1
signal1.name = 'flow_lpm';
signal1.absTol = 5; %lpm
signal1.relTol = 0.3; %10%
signal1.minData = -100; %lpm
signal1.maxData = -signal1.minData; %lpm

figure
hold on
grid on
plotBorders(signal1)
plotQuantized(signal1)
%plotBinary(signal1)

%signal1.relTol = optimizeRelTol(signal1, 0);
signal1.maxData = optimizeMaxData(signal1, 0);
signal1.minData = -signal1.maxData;
plotBorders(signal1)
plotQuantized(signal1)
%plotBinary(signal1)

%signal1.absTol = optimizeAbsTol(signal1);
%plotBorders(signal1)
%plotQuantized(signal1)
signals = [signals signal1];


%% signal 2
signal2.name = 'pressDiff_Pa';
signal2.absTol = 50; %Pa
signal2.relTol = 0; % no relTol
signal2.minData = -500; %Pa
signal2.maxData = -signal2.minData; %Pa

figure
hold on
grid on
plotBorders(signal2)
plotQuantized(signal2)

signal2.absTol = optimizeAbsTol(signal2, 2);
plotBorders(signal2)
plotQuantized(signal2)
signals = [signals signal2];

%% global examination
totalBits = 1;
for n = 1:length(signals)
  absTol = signals(n).absTol;
  relTol = signals(n).relTol;
  minData = signals(n).minData;
  maxData = signals(n).maxData;
  
  minBin = directMethod_encode(minData, absTol, relTol, 0);
  maxBin = directMethod_encode(maxData, absTol, relTol, 0);
  counts = maxBin - minBin + 1;
  counts
  n
  totalBits = totalBits * counts;
end
totalBits
totalBits/2^ceil(log2(totalBits))


%% create the lut
[encLut, decLut] = directMethod_createLuts(signal1.absTol, signal1.relTol, 0, signal1.minData, signal1.maxData)
