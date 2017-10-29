function encData = encode(data, absTol, relTol, fixPoint)
    
    
    clear encData
    n0 = 0; //
    clear x0
    if fixPoint <= absTol/relTol
        x0 = fixPoint + floor(absTol/relTol-fixPoint);
    else
        n_temp = ceil((log(fixPoint)-log(absTol/relTol))/log((1+relTol)/(1-relTol)))
        x0 = fixPoint*((1+relTol)/(1-relTol))^(-n_temp)
    end
    
    for i = 1:length(data)
        if abs(data(i)) < absTol/relTol
            encData(i) = round(n0 + (data(i)-x0)/(2*absTol));
        else
            if data(i)>0
                
                encData(i) = n0 + ceil( log(data(i)*(1-relTol)/x0) / log((1+relTol)/(1-relTol)) );
            else
                nOffset = ceil((x0+absTol/relTol)/(2*absTol));
                xOffset = nOffset * 2*absTol;
                encData(i) = n0 - nOffset - ceil( log(data(i)*(1-relTol)/(x0-xOffset)) / log((1+relTol)/(1-relTol)) );
            end
        end
    end

endfunction
