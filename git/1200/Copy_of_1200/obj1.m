function [outputArg1] = obj1(h1,up1)
global N h up Ck Cp Cf
h=h1;up=up1;

fenzi=0;
fenmu=0;
for k=1:N
    a1=(k-1)*Ck+Cp;
    Ppk1=Ppk(k*h+up,k*h);
    a2=(k-1)*Ck+Cf;
    Pfk1=Pfk(k*h,(k-1)*h);
    fenzi=fenzi+a1*Ppk1+a2*Pfk1;
    a3=E(h,k)*Pfk1;
    a4=k*h*Ppk1;
    fenmu=fenmu+a3+a4;
   
end
 outputArg1=fenzi/fenmu;
end

