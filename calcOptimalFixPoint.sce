function optimalFixPoint = calcOptimalFixPoint(minData, maxData, absTol, relTol)
    //The optimal fixPoint is where the fractional number of needed steps is minimal
    
    //init
    clear optimalFixPoint
    kinkPoint = calcKinkPoint(absTol, relTol);
    [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
//    //encode
//    if abs(minData) < kinkPoint then
//        minEncData = round( (minData-refPointPositive) / (2*absTol) );
//    else
//        if minData>0
//            minEncData = ceil( log(minData*(1-relTol)/refPointPositive) / log((1+relTol)/(1-relTol)) );
//        else
//            minEncData = n0Negative - floor( log(minData*(1+relTol)/refPointNegative) / log((1+relTol)/(1-relTol)) );
//        end
//    end
//    
//    
//    if abs(maxData) < kinkPoint then
//        maxEncData = round( (maxData-refPointPositive) / (2*absTol) );
//    else
//        if maxData>0
//            maxEncData = ceil( log(maxData*(1-relTol)/refPointPositive) / log((1+relTol)/(1-relTol)) );
//        else
//            maxEncData = n0Negative - floor( log(maxData*(1+relTol)/refPointNegative) / log((1+relTol)/(1-relTol)) );
//        end
//    end
    
    
    if abs(minData) < kinkPoint && abs(maxData) < kinkPoint then
        
        minRefPointPositive = maxData - absTol;//aber gerade noch grösser!
        maxRefPointPositive = minData - absTol;//kleiner oder gleich.
        
        
        while(minRefPointPositive > 0)
            minRefPointPositive = minRefPointPositive - 2*absTol;
        end
        
        while(maxRefPointPositive < minRefPointPositive)
            maxRefPointPositive = maxRefPointPositive + 2*absTol; 
        end
        
        disp(minRefPointPositive);
        disp(maxRefPointPositive);
        
        optimalFixPoint = 0; //TBD
        
        // n * 2 * absTol + ]minRefPointPositive maxRefPointPositive]
        
    else
        //TBD: other cases
        optimalFixPoint = 0;
        
        disp(kinkPoint)
    end
    
endfunction

