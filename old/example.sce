clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');
exec('calcKinkPoint.sce');
//exec('calcRefPoints.sce');
exec('transformForward.sce');
exec('transformForward_max.sce');
exec('transformForward_min.sce');
exec('transformBack_min.sce');

// init
relTol = 0.6;
absTol = 1;
fixPoint = 0;
data = -1:0.01:30;

tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;

clear encData;
clear decData;
for i = 1:length(data)
    //encode
    encData(i) = encode(data(i), absTol, relTol, fixPoint);
    
    //decode
    decData(i) = decode(encData(i), absTol, relTol, fixPoint);
    
    transformedX(i) = transformForward(data(i), absTol, relTol, fixPoint);
    transformedY(i) = transformForward(data(i), absTol, relTol, fixPoint);
    transformed_minY(i) = transformForward_min(data_min(i), absTol, relTol, fixPoint);
    transformed_maxY(i) = transformForward_max(data_max(i), absTol, relTol, fixPoint);
    transformedBackX(i) = transformBack_min(transformedX(i), absTol, relTol, fixPoint);
    //transformed_minY(i) = transformForward(data_min(i), absTol, relTol, fixPoint);
    //transformed_maxY(i) = transformForward(data_max(i), absTol, relTol, fixPoint);
end

//plot

xdel(winsid());

//scf(1);
//plot(data',[data' data_min' data_max' encData decData]')
//plot(data',[data' data_min' data_max' encData decData]', 'LineSt', 'none', 'Marker', 'x')
//plot(transformedX,[data' data_min' data_max' 2*absTol*encData decData])
//plot(transformedX,[transformedY transformed_minY transformed_maxY 2*absTol*encData])
//xgrid(1);

scf(2);
plot(data',[data' data_min' data_max' transformedY encData]')
//plot(data',[data' data_min' data_max' 2*absTol*encData]')
xgrid(1);
