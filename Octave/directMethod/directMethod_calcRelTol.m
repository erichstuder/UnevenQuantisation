%function relTol = directMethod_calcRelTol(data, encData_frac, absTol, fixPoint)
clc
relTol = 0.27; %=> gesucht und startpunkt
absTol = 1.09;
fixPoint = 0; % leave on zero for the moment. (directMethod not capable yet)
data = 40;
desiredValue = 5.5-eps(5.5);



func = @(x)(directMethod_transformForward(data, absTol, x, fixPoint) - desiredValue);
%func = @(x){x^2};
relTolOptimized = fzero(func, [0, 1], optimset('TolX', 0))


%endfunction

%close all
%clear a;
%idx = 1;
%for n=0.001:0.001:1-0.001
%  a(idx) = func(n);
%  idx++;
%end
%
%plot(0.001:0.001:1-0.001, a)
%grid on
%
