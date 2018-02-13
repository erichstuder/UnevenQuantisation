function [relTol, targetValueIsPossible] = directMethod_calcRelTol(data, targetValue, absTol, fixPoint)
    maxTargetValue = directMethod_transformForward(data, absTol, 0, fixPoint);
    minTargetValue = directMethod_transformForward(data, absTol, 1, fixPoint);
    
    if targetValue > maxTargetValue || targetValue < minTargetValue
      targetValueIsPossible = false;
    else
      targetValueIsPossible = true;
    end
    
    
    if targetValue >= maxTargetValue
      relTol = 0;
    elseif targetValue <= minTargetValue
      relTol = 1;
    else
      func = @(x)(directMethod_transformForward(data, absTol, x, fixPoint) - targetValue);
      relTol = fzero(func, [0, 1], optimset('TolX', 0, 'TolFun', 0));
    end

