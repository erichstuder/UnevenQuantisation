function result = transformBack_min(data, absTol, relTol, fixPoint)
    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    //[refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    //transform
    if data > kinkPoint then
        //result = kinkPoint-absTol + 2*absTol*log(data/(kinkPoint-absTol)) / log((1+relTol)/(1-relTol));
        //result = kinkPoint-absTol + 2*absTol*log(data/(kinkPoint-absTol)) / log((1+relTol)/(1-relTol));
        
        result = ((1+relTol)/(1-relTol))^(1*(data - kinkPoint)/(2*absTol)) * (kinkPoint);
        
    //elseif data < -kinkPoint
        //result = -kinkPoint - 2*absTol*log(-data/kinkPoint) / log((1+relTol)/(1-relTol));
    else
        result = data;
    end
endfunction
