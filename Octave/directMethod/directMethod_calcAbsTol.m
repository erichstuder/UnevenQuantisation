function absTol = directMethod_calcAbsTol(data, targetValue, relTol, fixPoint)
    func = @(x)(directMethod_transformForward(data, x, relTol, fixPoint) - targetValue);
    absTol = fzero(func, [eps(0), data], optimset('TolX', 0, 'TolFun', 0));

