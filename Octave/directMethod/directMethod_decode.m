function decData = directMethod_decode(encData, absTol, relTol, fixPoint)
    kinkPoint = calcKinkPoint(absTol, relTol);
    
    refPointPos =  ((floor((kinkPoint+absTol) / (2*absTol)) * 2*absTol));
    
    % decode
    temp = encData * 2*absTol;
    
    % back transform
    if temp > kinkPoint+absTol
        decData = refPointPos * ((1+relTol)/(1-relTol)) ^ (encData - refPointPos / (2*absTol));
    elseif temp < -kinkPoint-absTol
        decData = -refPointPos * ((1-relTol)/(1+relTol)) ^ (encData + refPointPos / (2*absTol));
    else
        decData = temp;
    end

