function [encLut, decLut] = plotBorders(absTol, relTol, minData, maxData)

  delta = (maxData - minData)/1000;
  data = minData:delta:maxData;

  tolerance = max(absTol, abs(data)*relTol);
  lowerBorder = data - tolerance;
  upperBorder = data + tolerance;
  
  plot(data, [lowerBorder; upperBorder]);