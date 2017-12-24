function encData = encode(data, absTol, relTol, fixPoint)
    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    //[refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    //transform
    refPoint = ((floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol)) / (1-relTol);
    //disp(refPoint)
    if data > refPoint then
        temp = refPoint*(1-relTol) + 2*absTol * log(data/refPoint) / log((1+relTol)/(1-relTol));
        //temp = min(data*(1-relTol), temp1);
        //temp = kinkPoint * (1 + log(data/kinkPoint) / log(1+relTol));
    elseif data < -kinkPoint
        temp = -kinkPoint + 2*absTol * log(-data/kinkPoint) / log((1+relTol)/(1-relTol));
    else
        if data > kinkPoint then
            temp = data * (1-relTol);
        else
            temp = data-absTol;
        end
    end

    //encode
    //encData = round( temp / (2*absTol) );
    encData = temp;
    
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
