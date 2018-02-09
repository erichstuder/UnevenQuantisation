function relTolOptimized = optimizeRelTol(maxData, absTol, relTol)
    targetValue = directMethod_encode(maxData, absTol, relTol, 0);
    relTolOptimized = directMethod_calcRelTol(maxData, targetValue + 0.5, absTol, 0);
    
    while(targetValue >= directMethod_encode(maxData, absTol, relTolOptimized, 0))
      relTolOptimized = relTolOptimized - eps(relTolOptimized);
    end
    
    while(targetValue < directMethod_encode(maxData, absTol, relTolOptimized, 0))
      relTolOptimized = relTolOptimized + eps(relTolOptimized);
    end