%a = single(16777216);
%
%while a~=a+single(1)
%  a=a+single(1);
%end
%a

%a = realmin('single');
a=single(1);
epsilon = eps(a);
cnt=2;
while cnt<100000
  a(cnt) = a(cnt-1)+eps(a(cnt-1));
  epsilon(cnt) = eps(a(cnt));

  cnt = cnt + 1;
end

close all
plot(a, epsilon)