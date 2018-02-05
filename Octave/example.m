% init
relTol = relTolOptimized;%0.27;
absTol = 1.09;
fixPoint = 0; % leave on zero for the moment. (directMethod not capable yet)
data = -40:0.01:40;

clear encLut;
clear decLut;

[encLut, decLut] = lookupMethod_createLuts(absTol, relTol, fixPoint, min(data), max(data));

clear lookupMethod_encData;
clear lookupMethod_decData;

clear directMethod_encData;
clear directMethod_decData;

for i = 1:length(data)
%    %encode
%    encData(i) = encode(data(i), absTol, relTol, fixPoint);
%    
%
%    
%    encData2(i) = ceil( encData(i) / (2*absTol) );
%    
%        %decode
%    decData(i) = decode(encData2(i), absTol, relTol, fixPoint);
    lookupMethod_encData(i) = lookupMethod_encode(data(i), encLut);
    lookupMethod_decData(i) = lookupMethod_decode(lookupMethod_encData(i), decLut);
    
    
    directMethod_encData(i) = directMethod_encode(data(i), absTol, relTol, fixPoint);
    %directMethod_encDataDebug(i) = round( directMethod_encData(i) / (2*absTol) );
    directMethod_decData(i) = directMethod_decode(directMethod_encData(i), absTol, relTol, fixPoint);
    %encData(i) = encLut(find(encLut(:,1)>=data(i),1),2);
end

%plot
tolerance = max(absTol, abs(data)*relTol);
data_min = data - tolerance;
data_max = data + tolerance;
close all
%plot(data',[data' data_min' data_max' encData encData2 decData])
%plot(data', [data' data_min' data_max' lookupMethod_encData lookupMethod_decData directMethod_encData directMethod_decData]);
%plot(data', [data' data_min' data_max' lookupMethod_encData lookupMethod_decData]);

%plot(data', [data' data_min' data_max' directMethod_encData directMethod_decData]);
plot(data', [data' data_min' data_max' directMethod_encData' directMethod_decData']);


%plot(data', [data' data_min' data_max' directMethod_encData directMethod_encDataDebug]);
%plot(data', [data' data_min' data_max']);
%plot(encLut(:,1), encLut(:,2),'x')
grid on
