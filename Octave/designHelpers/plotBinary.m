function [encLut, decLut] = plotBinary(minData, maxData, absTol, relTol)
  delta = (maxData - minData)/1000;
  data = minData:delta:maxData;

  for n = 1:length(data)
    binary(n) = directMethod_encode(data(n), absTol, relTol, 0);
  end
  
  plot(data, binary);