function decData = decode(encData, absTol, relTol)
    
    n0 = 0;
    clear x0
    if fixPoint <= absTol/relTol
        x0 = fixPoint + floor(absTol/relTol-fixPoint);
    else
        n_temp = ceil((log(fixPoint)-log(absTol/relTol))/log((1+relTol)/(1-relTol)))
        x0 = fixPoint*((1+relTol)/(1-relTol))^(-n_temp)
    end
    
    nOffset = ceil((x0+absTol/relTol)/(2*absTol));
    xOffset = nOffset * 2*absTol;
    
    for i = 1:length(encData)
        if(encData(i) <= 0 & encData(i)>=-nOffset) then
            decData(i) = x0 + encData(i) * 2*absTol
        else
            if encData(i)>0 then
                decData(i) = x0 * ((1+relTol)/(1-relTol))^(encData(i)-n0); // / (1-relTol);
            else
                decData(i) = (x0-xOffset) * ((1+relTol)/(1-relTol))^(-encData(i)+(n0-nOffset)); // / (1-relTol);
            end
        end
    end
    
endfunction
