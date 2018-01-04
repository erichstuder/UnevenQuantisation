function [encLut, decLut] = lookupMethod_createLuts(absTol, relTol, fixPoint, minData, maxData)
    
    //to upper limit
    y = fixPoint;
    directLut = [];
    while y < maxData
        //calculate intersection with lower border
        x_intersect = max(y + absTol, y / (1-relTol));
        
        directLut = [directLut; [x_intersect y]];
        
        y = max(x_intersect + absTol, x_intersect * (1+relTol));
    end
    
    y = fixPoint;
    while y > minData
        //calculate intersection with lower border
        x_intersect = min(y - absTol, y / (1-relTol));
        y = min(x_intersect - absTol, x_intersect * (1+relTol));
        
        if y > minData
            directLut = [[x_intersect y]; directLut];
        end
    end
    
    encLut = [directLut(:,1)'; [0:length(directLut(:,1))-1]]';
    //encLut = [directLut(:,1)'; directLut(:,2)']';
    //encLut = directLut;
    //decLut = [[1:length(directLut(:,1))]-1; directLut(:,2)']';
    decLut = directLut(:,2);
endfunction
