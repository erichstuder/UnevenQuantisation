clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');
exec('calcKinkPoint.sce');
//exec('calcRefPoints.sce');

// init
relTol = 0.5;
absTol = 1;
fixPoint = 0;
data = -30:0.01:30;

clear encData;
clear decData;
for i = 1:length(data)
    //encode
    encData(i) = encode(data(i), absTol, relTol, fixPoint);
    
    //decode
    decData(i) = decode(encData(i), absTol, relTol, fixPoint);
end

//plot
tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;
xdel(winsid());
plot(data',[data' data_min' data_max' encData decData])
xgrid(1);
