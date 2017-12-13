function result = roundHalfUp(data)
    // see: https://en.wikipedia.org/wiki/Rounding#Round_half_up
//    if data >= 0 then
//        if modulo(data,1) >= 0.5 then
//            result = ceil(data);
//        else
//            result = floor(data);
//        end
//    else
//        if modulo(data,1) >= -0.5 then
//            result = ceil(data);
//        else
//            result = floor(data);
//        end
//    end

    if  data >= 0 then
        result = round(data);
    else
        result = - round(-data);
    end 
endfunction
