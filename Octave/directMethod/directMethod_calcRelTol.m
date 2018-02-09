function relTol = directMethod_calcRelTol(data, targetValue, absTol, fixPoint)
    func = @(x)(directMethod_transformForward(data, absTol, x, fixPoint) - targetValue);
    relTol = fzero(func, [0, 1], optimset('TolX', 0, 'TolFun', 0));

