function transformed = directMethod_transformForward(data, absTol, relTol, fixPoint)
    
    kinkPoint = calcKinkPoint(absTol, relTol);
    
    % calc refPoint
    if relTol < 1
      refPointPos =  floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol / (1-relTol);
    else
      refPointPos = Inf;
    end
    refPointNeg = -refPointPos;
    
    if data > refPointPos
        temp = refPointPos*(1-relTol) + absTol + 2*absTol * log(data/refPointPos) / log((1+relTol)/(1-relTol));
    elseif data < refPointNeg
        temp = refPointNeg*(1-relTol) - absTol + 2*absTol * log(data/refPointNeg) / log((1-relTol)/(1+relTol));
    else
        if data > kinkPoint
            temp = data * (1-relTol) + absTol;
        elseif data < -kinkPoint
            temp = data * (1-relTol) - absTol;
        else
            temp = data;
        end
    end
    
    transformed = temp / (2*absTol);
    
endfunction