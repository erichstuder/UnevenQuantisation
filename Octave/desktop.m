%a = single(16777216);
%
%while a~=a+single(1)
%  a=a+single(1);
%end
%a

%a = realmin('single');
%a=single(1);
%epsilon = eps(a);
%cnt=2;
%while cnt<100000
%  a(cnt) = a(cnt-1)+eps(a(cnt-1));
%  epsilon(cnt) = eps(a(cnt));
%
%  cnt = cnt + 1;
%end
%
%close all
%plot(a, epsilon)


%(x+5) * (y+3) = 22
%22/(x+5)-3

%close all
%x = 0:0.1:30;
%y = 22./(x+5)-3;
%
%plot(x,y)


a = directMethod_transformForward(signal1.minData, signal1.absTol, signal1.relTol, 0)
b = directMethod_transformForward(signal1.maxData, signal1.absTol, signal1.relTol, 0)
a+b