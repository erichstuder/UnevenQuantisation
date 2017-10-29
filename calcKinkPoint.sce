function kinkPoint = calcKinkPoint(absTol, relTol)
    //Around zero the absolute tolerance is active.
    //At some point the tolerance switches to the relative.
    //The kink point is where the tolerance switches from the absolute to the relative one.
    //This represents the kink point on the positive side
    //kinkPointNegative = - kinkPoint
    
    kinkPoint = absTol / relTol;
endfunction
