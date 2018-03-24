function encData = lookupMethod_encode(data, encLut)
    encData = encLut(find(encLut(:,1)>=data,1),2);
endfunction
