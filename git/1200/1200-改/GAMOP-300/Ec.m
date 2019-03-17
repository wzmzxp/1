function [outputArg1] = Ec(X)
global N h up Ck Cp Cf
h1=X(1);
up1=X(2);
h=h1;up=up1;
outputArg1=0;
for k=1:N
%     a1=(k-1)*Ck+Cp;
%     Ppk1=Ppk(k*h+up,k*h);
%     a2=(k-1)*Ck+Cf;
%     Pfk1=Pfk(k*h,(k-1)*h);
%     outputArg1=outputArg1+a1*Ppk1+a2*Pfk1;
%     
 Ppk1=Ppk(k*h+up,k*h);
 Pfk1=Pfk(k*h,(k-1)*h);
  outputArg1=outputArg1+((k-1)*Ck+Cp)*Ppk1+((k-1)*Ck+Cf)*Pfk1;
%  outputArg1=outputArg1+Cp*Ppk1+Cf*Pfk1;
end
end

