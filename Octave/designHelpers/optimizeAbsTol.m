function absTolOptimized = optimizeAbsTol(signal)
    absTol = signal.absTol;
    relTol = signal.relTol;
    maxData = signal.maxData;
    
    targetValue = directMethod_encode(maxData, absTol, relTol, 0);
    absTolOptimized = directMethod_calcAbsTol(maxData, targetValue + 0.5, relTol, 0);
    
    while(targetValue >= directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized - eps(absTolOptimized);
    end
    
    while(targetValue < directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized + eps(absTolOptimized);
    end