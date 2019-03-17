function [outputArg1] = R(t,n1,b1)
global n b
if nargin ==1
    
    outputArg1=exp(-power((t/n),b));
    
    
else
    outputArg1=exp(-power((t/n1),b1));
end

end

