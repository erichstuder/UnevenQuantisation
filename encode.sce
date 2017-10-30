function encData = encode(data, absTol, relTol, fixPoint)
    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
    //encode
    if abs(data) < kinkPoint
        encData = round( (data-refPointPositive) / (2*absTol) );
    else
        if data>0
            encData = ceil( log(data*(1-relTol)/refPointPositive) / log((1+relTol)/(1-relTol)) );
        else
            encData = n0Negative - floor( log(data*(1+relTol)/refPointNegative) / log((1+relTol)/(1-relTol)) );
        end
    end

endfunction
