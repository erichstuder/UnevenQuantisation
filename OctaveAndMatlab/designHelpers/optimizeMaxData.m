function maxDataOptimized = optimizeMaxData(signal, bitsToAdd)
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
    maxDataOptimized = directMethod_calcMaxData(targetValue + 0.5,absTol, relTol, 0);
    
    while(targetValue >= directMethod_encode(maxDataOptimized, absTol, relTol, 0))
      maxDataOptimized = maxDataOptimized + eps(maxDataOptimized);
    end
    
    while(targetValue < directMethod_encode(maxDataOptimized, absTol, relTol, 0))
      maxDataOptimized = maxDataOptimized - eps(maxDataOptimized);
    end