function [encLut, decLut] = lookupMethod_createLuts(absTol, relTol, fixPoint, minData, maxData)
    
    %to upper limit
    y = fixPoint;
    directLut = [];
    
    %do while
    while true
        %calculate intersection with lower border
        if y > 0
            x_intersect = max(y + absTol, y / (1-relTol));
        else
            x_intersect = max(y + absTol, y / (1+relTol));
        end
        
        directLut = [directLut; [x_intersect y]];
        
        if y > 0
            y = max(x_intersect + absTol, x_intersect * (1+relTol));
        else
            y = max(x_intersect + absTol, x_intersect * (1-relTol));
        end
        
        if x_intersect >= maxData
            break;
        end 
    end
    
    y = fixPoint;
    
    %do while
    while true
        %calculate intersection with lower border
        if y > 0
            x_intersect = min(y - absTol, y / (1+relTol));
            y = min(x_intersect - absTol, x_intersect * (1-relTol));
        else
            x_intersect = min(y - absTol, y / (1-relTol));
            y = min(x_intersect - absTol, x_intersect * (1+relTol));
        end
        
        directLut = [[x_intersect y]; directLut];
        
        if x_intersect <= minData
            break;
        end 
    end
    
    %remove unnecessary points in LUT
    for n = length(directLut(:,1)):-1:1
        if directLut(n,1) > maxData
            highestN = n;
        end
        if length(directLut(:,1)) > highestN
            directLut(highestN+1:$,:) = [];
        end
    end
    for n = length(directLut(:,1)):-1:1
        if directLut(n,1) < minData
            directLut(n,:) = [];
        end
    end
    
    encLut = [directLut(:,1)'; [0:length(directLut(:,1))-1]]';
    decLut = directLut(:,2);
endfunction
