function [refPointPositive, n0Positive, refPointNegative, n0Negative] = calcRefPoints(absTol, relTol, fixPoint, kinkPoint)
    //Calculate the exactly represented x that is in the absolute and relative tolerance region.
    //Relative to this point the calculations in both regions are done.
    //The reference point is always on the positive side.
    if abs(fixPoint) <= kinkPoint
        refPointPositive = fixPoint + floor((kinkPoint + absTol - fixPoint)/(2*absTol)) * 2*absTol;
    else
        //calculate the n at the fixPoint with the assumption that refPointPositive = kinkPoint-absTol
        //n_temp = ceil( log(fixPoint * (1-relTol) / (kinkPoint-absTol) ) / log((1+relTol)/(1-relTol) ) );
        
        //calc n at the fixpoint
        n_temp = ceil(-log((kinkPoint + absTol)/fixPoint) / log( (1+relTol) / (1-relTol) ));
        
        
        //calculate back to the refpoint which is at n=0
        refPointPositive = fixPoint * ( (1+relTol) / (1-relTol) ) ^ -n_temp;
        
        clear n_temp
    end
    
    n0Positive = 0; //always zero by definition
    
    //negative ref point values
    n0Negative = round( ( (-kinkPoint) - refPointPositive ) / (2*absTol) );
    refPointNegative = n0Negative * 2*absTol + refPointPositive;
endfunction
