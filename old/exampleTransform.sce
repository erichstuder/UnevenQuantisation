clear

// stupid scilab workaround
//exec('encode.sce');
//exec('decode.sce');
exec('calcKinkPoint.sce');
//exec('calcRefPoints.sce');
exec('transformForward.sce');

// init
relTol = 0.5;
absTol = 1;
fixPoint = 0;
data = -10:0.01:40;

clear transformed;
clear transformed_min;
clear transformed_max;

tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;

for i = 1:length(data)
    //transform
    transformed(i) = transformForward(data(i), absTol, relTol, fixPoint);
    transformedY(i) = transformForward(data(i), absTol, relTol, fixPoint);
    transformed_minY(i) = transformForward(data_min(i), absTol, relTol, fixPoint);
    transformed_maxY(i) = transformForward(data_max(i), absTol, relTol, fixPoint);

//    if transformed_max(i) > 3 then
//        transformed_max(i) = log(transformed_max(i));
//    end
end


//plot

kinkPoint = calcKinkPoint(absTol, relTol);
xdel(winsid());
//plot(data',[data' data_min' data_max' transformed])
plot(transformed, [transformed data' data_min' data_max' kinkPoint+1.8*log(max(kinkPoint,data)/kinkPoint)'])
//plot(transformed, [transformedY transformed_minY])
//plot(transformed, [transformed transformed_min transformed_max])
xgrid(1);
