function [encLut, decLut] = plotBinary(signal)
  absTol = signal.absTol;
  relTol = signal.relTol;
  minData = signal.minData;
  maxData = signal.maxData;
  
  delta = (maxData - minData)/1000;
  data = minData:delta:maxData;

  for n = 1:length(data)
    binary(n) = directMethod_encode(data(n), absTol, relTol, 0);
  end
  
  plot(data, binary);