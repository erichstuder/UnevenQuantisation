function relTolOptimized = optimizeRelTol(maxData, absTol, relTol)
    targetValue = directMethod_encode(maxData, absTol, relTol, 0);
    relTolOptimized = directMethod_calcRelTol(maxData, targetValue + 0.5 - 3*eps(targetValue), absTol, 0);
%    
%%    relTolOptimizedBase = relTolOptimized;
%    while(targetValue < directMethod_encode(maxData, absTol, relTolOptimized, 0))
%      relTolOptimized = relTolOptimized - eps(relTolOptimized);
%      %pause(0.001);
%%      disp(relTolOptimizedBase - relTolOptimized)
%%      disp(directMethod_encode(maxData, absTol, relTolOptimized, 0))
%%      disp(targetValue)
%    end
%    
%    relTolOptimized_old = relTolOptimized;
%    relTolOptimized = relTolOptimized + eps(relTolOptimized);
%    while(targetValue >= directMethod_encode(maxData, absTol, relTolOptimized, 0))
%      relTolOptimized_old = relTolOptimized;
%      relTolOptimized = relTolOptimized + eps(relTolOptimized);
%      %disp(relTolOptimized);
%    end
%    
%    relTolOptimized = relTolOptimized_old;
    
    