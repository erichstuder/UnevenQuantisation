function decData = decode(encData, absTol, relTol, fixPoint)
    //init
    clear decData
    kinkPoint = calcKinkPoint(absTol, relTol);
    [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint);
    
    //decode
    if(encData <= 0 & encData >= n0Negative) then
        decData = refPointPositive + encData * 2*absTol
    else
        if encData>0 then
            decData = refPointPositive * ((1+relTol)/(1-relTol))^(encData); // / (1-relTol);
        else
            decData = refPointNegative * ((1+relTol)/(1-relTol))^(n0Negative - encData); // / (1-relTol);
        end
    end
    
endfunction
