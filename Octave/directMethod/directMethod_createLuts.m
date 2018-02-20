function [encLut, decLut] = directMethod_createLuts(absTol, relTol, fixPoint, minData, maxData)
  minBit = directMethod_encode(minData, absTol, relTol, fixPoint);
  maxBit = directMethod_encode(maxData, absTol, relTol, fixPoint);
  
  %disp(maxBit)
  
  %first value of lut
  encLut = [minData minBit];
  
  %first targetValue to find
  targetValue = minBit+0.5;
  
  while(ceil(targetValue) <= maxBit)
    %disp(targetValue)
    
    func = @(x)(directMethod_transformForward(x, absTol, relTol, fixPoint) - targetValue);
    dataAtStep = fzero(func, [minData, maxData], optimset('TolX', 0, 'TolFun', 0));   
  
    while(directMethod_encode(dataAtStep, absTol, relTol, 0) >= ceil(targetValue))
      dataAtStep = dataAtStep - eps(dataAtStep);
    end
    
    while(directMethod_encode(dataAtStep, absTol, relTol, 0) < ceil(targetValue))
      dataAtStep = dataAtStep + eps(dataAtStep);
    end
    
    encLut = [encLut; [dataAtStep ceil(targetValue)]];
    targetValue = targetValue + 1;
    
  end

  %encLut = [directLut(:,1)'; [0:length(directLut(:,1))-1]]';
  %decLut = encLut;
endfunction
