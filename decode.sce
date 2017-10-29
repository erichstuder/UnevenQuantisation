function decData = decode(encData, absTol, relTol, fixPoint)
    // stupid scilab workaround
    exec('calcKinkPoint.sce');
    exec('calcRefPoints.sce');
    
    //init
    clear decData
    kinkPoint = calcKinkPoint(absTol, relTol);
    [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
    //decode
    for i = 1:length(encData)
        if(encData(i) <= 0 & encData(i) >= n0Negative) then
            decData(i) = refPointPositive + encData(i) * 2*absTol
        else
            if encData(i)>0 then
                decData(i) = refPointPositive * ((1+relTol)/(1-relTol))^(encData(i)); // / (1-relTol);
            else
                decData(i) = refPointNegative * ((1+relTol)/(1-relTol))^(n0Negative - encData(i)); // / (1-relTol);
            end
        end
    end
    
endfunction
