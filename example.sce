clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');
exec('calcKinkPoint.sce');
//exec('calcRefPoints.sce');

// init
relTol = 0.4;
absTol = 1.5;
fixPoint = 0;
data = -1:0.01:50;

clear encData;
clear decData;
for i = 1:length(data)
    //encode
    encData(i) = encode(data(i), absTol, relTol, fixPoint);
    

    
    encData2(i) = ceil( encData(i) / (2*absTol) );
    
        //decode
    decData(i) = decode(encData2(i), absTol, relTol, fixPoint);
end

//plot
tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;
xdel(winsid());
plot(data',[data' data_min' data_max' encData encData2 decData])
xgrid(1);
