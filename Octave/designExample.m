%% signal 1
name = 'flow_lpm';
absTol = 0.01; %lpm
relTol = 0.1; %10%
minValue = -100; %lpm
maxValue = 100; %lpm


delta = (maxValue - minValue)/1000;
dataVector = minValue:delta:maxValue;


for n = 1:length(dataVector)
  directMethod_encode

%% signal 2
%boolean
%name = 'flowValid';




%% signal 3
%enum

%% signal 4
%integer