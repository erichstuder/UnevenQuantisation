function encData = encode(data, absTol, relTol, fixPoint)
    // stupid scilab workaround
    exec('calcKinkPoint.sce');
    exec('calcRefPoints.sce');

    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
    //encode
    for i = 1:length(data)
        if abs(data(i)) < kinkPoint
            encData(i) = round( (data(i)-refPointPositive) / (2*absTol) );
        else
            if data(i)>0
                encData(i) = ceil( log(data(i)*(1-relTol)/refPointPositive) / log((1+relTol)/(1-relTol)) );
            else
                encData(i) = n0Negative - floor( log(data(i)*(1+relTol)/refPointNegative) / log((1+relTol)/(1-relTol)) );
            end
        end
    end

endfunction
