function optimalFixPoint = calcOptimalFixPoint(minData, maxData, absTol, relTol)
    //The optimal fixPoint is where the fractional number of needed steps is minimal
    
    //init
    clear optimalFixPoint
    optimalFixPoint = -1;
    clear optimalFixPointMin
    clear optimalFixPointMax
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

    
    if abs(maxData) > kinkPoint  then
        if maxData > 0 then
            //calc n at maxData
            n_temp = ceil(-log((kinkPoint + absTol)/ (maxData * (1-relTol))) / log( (1+relTol) / (1-relTol) ));
            //disp(n_temp)
            //disp(maxData)
            //calculate back to the refpoint which is at n=0
            fixPointMax = maxData * (1-relTol) * ( (1+relTol) / (1-relTol) ) ^ -n_temp;
        else
            
            n_temp = floor(-log((-kinkPoint - absTol)/ (maxData * (1-relTol))) / log( (1+relTol) / (1-relTol) ));
            //disp(((-kinkPoint - absTol)/ (maxData * (1+relTol))))
            //disp(n_temp)
            //disp(n0Negative)
            fixPointMax = maxData * (1-relTol) * ( (1+relTol) / (1-relTol) ) ^ -n_temp;
        end
        
        
    else
        fixPointMax = maxData;
        disp('test')
    end
    
    disp(fixPointMax);
    
    optimalFixPointMin = fixPointMax - absTol - ceil((fixPointMax - absTol)/(2*absTol))*2*absTol;

    disp(optimalFixPointMin);
    
    
//    if abs(minData) < kinkPoint && abs(maxData) < kinkPoint then
//        optimalFixPointMin = maxData - absTol - ceil((maxData-absTol)/(2*absTol))*2*absTol;
//        optimalFixPointMax = minData + absTol - floor((minData+absTol)/(2*absTol))*2*absTol;
//        //optimalFixPointMin: ist im range
//        //optimalFixPointMax: gerade nicht mehr im
//        
//        disp(optimalFixPointMin);
//        disp(optimalFixPointMax);
//    else
//        //TBD: other cases
//        //optimalFixPoint = 0;
//        
//        disp(-1)
//    end
    
endfunction

