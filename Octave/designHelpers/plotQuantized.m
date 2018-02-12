function plotQuantized(signal)
  absTol = signal.absTol;
  relTol = signal.relTol;
  minData = signal.minData;
  maxData = signal.maxData;
  
  delta = (maxData - minData)/10000;
  data = minData:delta:maxData;

  for n = 1:length(data)
    temp = directMethod_encode(data(n), absTol, relTol, 0);
    dataQuantized(n) = directMethod_decode(temp, absTol, relTol, 0);
  end
  
  plot(data, dataQuantized);