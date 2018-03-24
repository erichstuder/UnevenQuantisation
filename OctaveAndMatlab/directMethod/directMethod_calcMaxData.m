function maxData = directMethod_calcMaxData(targetValue, absTol, relTol, fixPoint)
    func = @(x)(directMethod_transformForward(x, absTol, relTol, fixPoint) - targetValue);
    maxData = fzero(func, [0, 10000], optimset('TolX', 0, 'TolFun', 0));
