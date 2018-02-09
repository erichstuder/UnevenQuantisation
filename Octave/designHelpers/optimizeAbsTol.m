function absTolOptimized = optimizeAbsTol(maxData, absTol, relTol)
    targetValue = directMethod_encode(maxData, absTol, relTol, 0);
    absTolOptimized = directMethod_calcAbsTol(maxData, targetValue + 0.5, relTol, 0);
    
    while(targetValue >= directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized - eps(absTolOptimized);
    end
    
    while(targetValue < directMethod_encode(maxData, absTolOptimized, relTol, 0))
      absTolOptimized = absTolOptimized + eps(absTolOptimized);
    end