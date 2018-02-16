function [relTolOptimized, targetValueIsPossible] = optimizeRelTol(signal, bitsToAdd)
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
    [relTolOptimized, targetValueIsPossible] = directMethod_calcRelTol(maxData, targetValue + 0.5, absTol, 0);
    
    if targetValueIsPossible
      while(targetValue >= directMethod_encode(maxData, absTol, relTolOptimized, 0))
        relTolOptimized = relTolOptimized - eps(relTolOptimized);
      end
      
      while(targetValue < directMethod_encode(maxData, absTol, relTolOptimized, 0))
        relTolOptimized = relTolOptimized + eps(relTolOptimized);
      end
    end