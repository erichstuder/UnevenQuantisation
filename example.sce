clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');

// init
relTol = 0.2;
absTol = 1;
fixPoint = 5.1;
data = -30:0.001:30;

//encode
encData = encode(data, absTol, relTol, fixPoint);

//decode
decData = decode(encData, absTol, relTol, fixPoint);

//plot
tolerance = max(absTol, abs(data)*relTol)
data_min = data - tolerance;
data_max = data + tolerance;
xdel(winsid());
plot(data',[data' data_min' data_max' encData decData])
xgrid(1);
