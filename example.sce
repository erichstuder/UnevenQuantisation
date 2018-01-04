clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');
exec('calcKinkPoint.sce');
exec('lookupMethod/lookupMethod_createLuts.sce');
exec('lookupMethod/lookupMethod_encode.sce');
exec('lookupMethod/lookupMethod_decode.sce');

// init
relTol = 0.5;
absTol = 1.5;
fixPoint = 1.333;
data = -40:0.01:50;

[encLut, decLut] = lookupMethod_createLuts(absTol, relTol, fixPoint, min(data), max(data));

clear encData;
clear decData;
for i = 1:length(data)
//    //encode
//    encData(i) = encode(data(i), absTol, relTol, fixPoint);
//    
//
//    
//    encData2(i) = ceil( encData(i) / (2*absTol) );
//    
//        //decode
//    decData(i) = decode(encData2(i), absTol, relTol, fixPoint);
    encData(i) = lookupMethod_encode(data(i), encLut);
    decData(i) = lookupMethod_decode(encData(i), decLut);
    //encData(i) = encLut(find(encLut(:,1)>=data(i),1),2);
end

//plot
tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;
xdel(winsid());
//plot(data',[data' data_min' data_max' encData encData2 decData])
plot(data', [data' data_min' data_max' encData decData]);
//plot(encLut(:,1), encLut(:,2),'x')
xgrid(1);
