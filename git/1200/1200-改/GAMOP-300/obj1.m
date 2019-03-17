function [outputArg1] = obj1(X)
global N h up Ck Cp Cf
h1=X(1);
up1=X(2);
h=h1;up=up1;
outputArg1=Ec(X)/Et(h1,up1);
% outputArg1=outputArg1*-1;
end

