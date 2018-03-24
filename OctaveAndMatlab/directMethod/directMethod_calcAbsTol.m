function absTol = directMethod_calcAbsTol(data, targetValue, relTol, fixPoint)
    func = @(x)(directMethod_transformForward(data, x, relTol, fixPoint) - targetValue);
    
    %Workaround for matlab version of fzero.
    %fzero of matlab doesn't allow non finite function values.
    %fzero of octave would have no problem with that.
    %There could be cases where this workaround doesn't work but before
    %implementing fzero on my own I try this.
    leftBorder = data;
    funcValue = func(leftBorder);
    direction = -1;
    while ~isfinite(funcValue) || funcValue<0
        if ~isfinite(funcValue) %we are too far left
            direction = 1;
        else %we are too far right
            direction = -1;
        end
        
        leftBorder = leftBorder + direction*abs(leftBorder/2); %abs should not be necessary
        
        funcValue = func(leftBorder);
    end
    
    %search absTol
    absTol = fzero(func, [leftBorder, data], optimset('TolX', 0, 'TolFun', 0));



