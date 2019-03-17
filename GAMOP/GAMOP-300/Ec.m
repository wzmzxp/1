function [outputArg1] = Ec(h1,up1)
global N h up Ck Cp Cf
h=h1;up=up1;
outputArg1=0;
for k=1:N
    a1=(k-1)*Ck+Cp;
    Ppk1=Ppk(k*h+up,k*h);
    a2=(k-1)*Ck+Cf;
    Pfk1=Pfk(k*h,(k-1)*h);
    outputArg1=outputArg1+a1*Ppk1+a2*Pfk1;
    
end
end

