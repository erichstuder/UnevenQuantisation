clear

// stupid scilab workaround
exec('encode.sce');
exec('decode.sce');

// init
relTol = 0.1;
absTol = 1;
fixPoint = 0;
data = -30:0.01:30;

//encode
encData = encode(data, absTol, relTol, fixPoint);

//decode
decData = decode(encData, absTol, relTol);

//plot
data_min = data - max(absTol, abs(data)*relTol);
data_max = data + max(absTol, abs(data)*relTol);
xdel(winsid());
plot(data,[data' data_min' data_max' encData decData])
xgrid(1);
