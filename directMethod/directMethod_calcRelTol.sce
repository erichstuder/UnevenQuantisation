function relTol = directMethod_calcRelTol(data, encData_frac, absTol, fixPoint)
    
    kinkPoint = calcKinkPoint(absTol, relTol);
    
    refPointPos =  ((floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol)) / (1-relTol);
    
//    refPointPos =  floor((absTol/relTol + absTol) / (2*absTol)) * 2*absTol / (1-relTol);

//    x+d = (absTol/relTol + absTol) / (2*absTol);
//    x+d = (1/relTol + 1)/2

//    relTol = 1/(2*(x+d)-1)

//    refPointPos =  x * 2*absTol / (1-relTol);
//    refPointPos =  x * 2*absTol / (1-1/(2*(x+d)-1));
//    refPointPos =  x * 2*absTol * ( 2*(x+d)-1 ) / ( 2*(x+d)-2 );
//    
//    refPointPos =  x * absTol * ( ( 2*(x+d)-1 ) / ( (x+d)-1 ) );
//    refPointPos =  x * absTol * ( 2*(x+d)-1 ) / (x+d-1);


      (1+relTol)/(1-relTol)
      (1+1/(2*(x+d)-1))/(1-1/(2*(x+d)-1))
      (2*(x+d))/(2*(x+d)-2)
      (x+d)/(x+d-1)
      
      log((x+d)/(x+d-1))
      log(x+d) - log(x+d-1)
      
      
    
    5.5 = floor(a+1) + a; a=? (2.5)
    a+1 = x+d
    5.5 = x +x+d-1
    5 = 2x-1
    x=3
    d=0.5
    
    => a = 2.5
    
    
    refPointNeg = -refPointPos//-kinkPoint//-1.5//-((floor((kinkPoint + absTol) / (2*absTol)) * 2*absTol)) / (1-relTol) + 2*absTol;
    //disp(refPointNeg)
    // transform
    if data > refPointPos then
        encData_frac * 2*absTol = refPointPos*(1-relTol) + absTol + 2*absTol * log(data/refPointPos) / log((1+relTol)/(1-relTol));
        
        encData_frac * 2*absTol - absTol = refPointPos*(1-relTol) + 2*absTol * log(data/refPointPos) / log((1+relTol)/(1-relTol));
        
        encData_frac - 0.5 = x + log(data/refPointPos) / log((1+relTol)/(1-relTol));
        
        encData_frac - 0.5 = x + log(data/refPointPos) / log((x+d)/(x+d-1));
        
        encData_frac - 0.5 = x + log((x+d-1)*data/(x*absTol*(2*(x+d)-1))) / log((x+d)/(x+d-1));
        
        
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
    //encData = round( temp / (2*absTol) ); //hochgenommen
    //encData = temp;
    
endfunction
