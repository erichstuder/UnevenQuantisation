function encData = directMethod_encode(data, absTol, relTol, fixPoint)
    
    kinkPoint = calcKinkPoint(absTol, relTol);
    
    refPointPos =  ((floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol)) / (1-relTol);
    refPointNeg = -refPointPos//-kinkPoint//-1.5//-((floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol)) / (1-relTol) + 2*absTol;
    //disp(refPointNeg)
    // transform
    if data > refPointPos then
        temp = refPointPos*(1-relTol) + absTol + 2*absTol * log(data/refPointPos) / log((1+relTol)/(1-relTol));
    elseif data < refPointNeg then
        //temp = -kinkPoint + 2*absTol * log(-data/kinkPoint) / log((1+relTol)/(1-relTol));
        temp = refPointNeg*(1-relTol) - absTol + 2*absTol * log(data/refPointNeg) / log((1-relTol)/(1+relTol));
    else
        if data > kinkPoint then
            temp = data * (1-relTol) + absTol;
        elseif data < -kinkPoint then
            temp = data * (1-relTol) - absTol;
        else
            temp = data;
        end
    end
    
    // encode
    encData = round( temp / (2*absTol) );
    //encData = temp;
    
endfunction
