function absTolOptimized = optimizeAbsTol(signal, bitsToAdd)
    if bitsToAdd < 0
      error('Bits to add must be positive.')  
    end
    
    if mod(bitsToAdd, 2) > 0
      error('Bits to add mus be even.');
    end
    
    absTol = signal.absTol;
    relTol = signal.relTol;
    maxData = signal.maxData;
    
    targetValue = directMethod_encode(maxData, absTol, relTol, 0) + bitsToAdd/2;
    absTolOptimized = directMethod_calcAbsTol(maxData, targetValue + 0.5, relTol, 0);
    
    while(targetValue >= directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized - eps(absTolOptimized);
    end
    
    while(targetValue < directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized + eps(absTolOptimized);
    end