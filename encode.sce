function encData = encode(data, absTol, relTol, fixPoint)
    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    //[refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    //transform
    if data > kinkPoint then
        temp = kinkPoint * (1 + log(data/kinkPoint) / log((1+relTol)/(1-relTol)));
        //temp = kinkPoint * (1 + log(data/kinkPoint) / log(1+relTol));
    elseif data < -kinkPoint
        temp = -kinkPoint * (1 + log(-data/kinkPoint) / log((1+relTol)/(1-relTol)));
    else
        temp = data;
    end

    //encode
    encData = round( temp / (2*absTol) );
    
    
//    if abs(data) < kinkPoint
//        encData = round( (data-refPointPositive) / (2*absTol) );
//    else
//        if data>0
//            encData = ceil( log(data*(1-relTol)/refPointPositive) / log((1+relTol)/(1-relTol)) );
//        else
//            encData = n0Negative - floor( log(data*(1+relTol)/refPointNegative) / log((1+relTol)/(1-relTol)) );
//        end
//    end

endfunction
