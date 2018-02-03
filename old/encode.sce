function encData = encode(data, absTol, relTol, fixPoint)
    //init
    clear encData
    kinkPoint = calcKinkPoint(absTol, relTol);
    //[refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    //transform
    //refPoint = kinkPoint - absTol
   // refPoint = (kinkPoint+absTol) * (2*absTol)
    refPoint = floor((kinkPoint+absTol) / (2 * absTol)) * 2 * absTol
    //disp(refPoint)
    if data > refPoint then
        //temp = kinkPoint + 2*absTol * (1+log(data/(kinkPoint/relTol)) / log((1+relTol)/(1-relTol)));
        //data = data / (1-relTol);
        temp = refPoint + 2*absTol * (log(data * (1-relTol) /refPoint)) / log((1+relTol)/(1-relTol));
        //temp = temp + absTol;
        //temp = kinkPoint + 2*absTol * (log(data/kinkPoint)-log(log((1+relTol)/(1-relTol)))) / log((1+relTol)/(1-relTol));
        //temp = kinkPoint * (1 + log(data/kinkPoint) / log(1+relTol));
    elseif data < -kinkPoint
        temp = -kinkPoint - 2*absTol * log(-data/kinkPoint) / log((1+relTol)/(1-relTol));
    else
        temp = data - absTol;
    end

    //encode
    encData = floor( (temp) / (2*absTol) );
    //encData = ( temp / (2*absTol) );
    //encData = round( temp );
    
    
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
