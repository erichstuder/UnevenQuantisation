function [encLut, decLut] = plotQuantized(absTol, relTol, minData, maxData)
  delta = (maxData - minData)/1000;
  data = minData:delta:maxData;

  for n = 1:length(data)
    temp = directMethod_encode(data(n), absTol, relTol, 0);
    dataQuantized(n) = directMethod_decode(temp, absTol, relTol, 0);
  end
  
  plot(data, dataQuantized);