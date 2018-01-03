function [encLut, decLut] = lookupMethod_createLuts(absTol, relTol, fixPoint, minData, maxData)
    
    //to upper limit
    y = fixPoint;
    encLut = [];
    while y < maxData
        //calculate intersection with lower border
        x_intersect = max(y + absTol, y / (1-relTol));
        
        encLut = [encLut; [x_intersect y]];
        
        y = max(x_intersect + absTol, x_intersect * (1+relTol));
    end
    
    while y > minData
        //calculate intersection with lower border
        x_intersect = min(y - absTol, y / (1+relTol));
        y = min(x_intersect - absTol, x_intersect * (1-relTol));
        
        encLut = [[x_intersect y]; encLut];
    end
endfunction
