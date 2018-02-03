function decData = decode(encData, absTol, relTol, fixPoint)
    //init
    clear decData
    kinkPoint = calcKinkPoint(absTol, relTol);
    //[refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
    // decode
    temp = encData * 2*absTol;
    
    //refPoint = floor((kinkPoint + absTol) / (2 * absTol)) * 2 * absTol;
    
    // back transform
    if temp > kinkPoint - absTol then
//        temp = kinkPoint + 2*absTol * (1+log(data/(kinkPoint/relTol)) / log((1+relTol)/(1-relTol)));
//        temp - kinkPoint = 2*absTol * (1+log(data/(kinkPoint/relTol)) / log((1+relTol)/(1-relTol)))
//        (temp - kinkPoint) / (2*absTol) = (1+log(data/(kinkPoint/relTol)) / log((1+relTol)/(1-relTol)))
//        (temp - kinkPoint) / (2*absTol) * log((1+relTol)/(1-relTol)) - 1 = log(data/(kinkPoint/relTol))
//        exp((temp - kinkPoint) / (2*absTol) * log((1+relTol)/(1-relTol)) - 1) * (kinkPoint/relTol) = data
        
        
        
//        temp = kinkPoint + 2*absTol * log(data/kinkPoint) / log((1+relTol)/(1-relTol));
//        temp - kinkPoint = 2*absTol * log(data/kinkPoint) / log((1+relTol)/(1-relTol))
//        (temp - kinkPoint)/(2*absTol) = log(data/kinkPoint) / log((1+relTol)/(1-relTol))
//        (temp - kinkPoint)/(2*absTol) * log((1+relTol)/(1-relTol)) = log(data/kinkPoint)
//         ((1+relTol)/(1-relTol))^((temp - kinkPoint)/(2*absTol)) = data/kinkPoint
//         kinkPoint * ((1+relTol)/(1-relTol))^((temp - kinkPoint)/(2*absTol)) = data

        //decData = exp((temp - kinkPoint) / (2*absTol) * log((1+relTol)/(1-relTol)) - 1) * (kinkPoint/relTol);
        //decData = kinkPoint * ((1+relTol)/(1-relTol))^((temp - kinkPoint)/(2*absTol)) * (1+relTol) ;
        refPoint = floor((kinkPoint+absTol) / (2 * absTol)) * 2 * absTol
        decData = (refPoint) * ((1+relTol)/(1-relTol))^((temp - refPoint)/(2*absTol)+1);
        //decData = (kinkPoint) * ((1+relTol)/(1-relTol))^((temp - kinkPoint)/(2*absTol));
        //decData = temp;
    elseif temp < -kinkPoint-absTol then
        decData = -kinkPoint * ((1+relTol)/(1-relTol))^((temp + kinkPoint)/(-2*absTol));
    else
        decData = temp+2*absTol;
    end
    //decode
//    if(encData <= 0 & encData >= n0Negative) then
//        decData = refPointPositive + encData * 2*absTol
//    else
//        if encData>0 then
//            decData = refPointPositive * ((1+relTol)/(1-relTol))^(encData); // / (1-relTol);
//        else
//            decData = refPointNegative * ((1+relTol)/(1-relTol))^(n0Negative - encData); // / (1-relTol);
//        end
//    end
    
endfunction
