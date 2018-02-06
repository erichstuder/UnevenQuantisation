function relTol = directMethod_calcRelTol(data, targetValue, absTol, fixPoint)
    func = @(x)(directMethod_transformForward(data, absTol, x, fixPoint) - targetValue);
    relTol = fzero(func, [0, 1], optimset('TolX', 0, 'TolFun', 0));
    %relTol = fzero(func, [0, 1]);

    
    
%    [x, fval, info, output] = fzero(func, [0, 1], optimset('TolX', 0));
%    disp(x)
%    disp(fval)
%    disp(info)
%    
%    disp(output)

