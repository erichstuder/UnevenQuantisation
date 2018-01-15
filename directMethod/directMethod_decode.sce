function decData = directMethod_decode(encData, absTol, relTol, fixPoint)
    kinkPoint = calcKinkPoint(absTol, relTol);
    
    // decode
    temp = encData * 2*absTol;
    
    // back transform
    if temp > kinkPoint then
        //decData = refPoint * ((1+relTol)/(1-relTol)) ^ ((temp - refPoint*(1-relTol) - absTol) / (2*absTol));
        //temp = refPointPos*(1-relTol) + absTol + 2*absTol * log(data/refPointPos) / log((1+relTol)/(1-relTol));
        decData = kinkPoint * ((1+relTol)/(1-relTol)) ^ ((temp - kinkPoint*(1-relTol) - absTol) / (2*absTol));
    elseif temp < -kinkPoint then
        //decData = -refPoint * ((1+relTol)/(1-relTol))^((temp+absTol)/-kinkPoint - 1) * (1+relTol);
        decData = -kinkPoint * ((1-relTol)/(1+relTol)) ^ ((temp + kinkPoint*(1-relTol) + absTol) / (2*absTol));
    else
        decData = temp;
    end
    
endfunction

