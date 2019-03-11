function [outputArg1] = obj2(h1,up1)
%OBJ2 此处显示有关此函数的摘要
global N h up Ck Cp Cf Tk Tp Tf uf
h=h1;up=up1;
outputArg1=0;

fenzi=0;
fenmu=0;
A0=0.9;
for k=1:N
     Ppk1=Ppk(k*h+up,k*h);
     Pfk1=Pfk(k*h,(k-1)*h);
     a1=((k-1)*Tk+Tp)*Ppk1;
     a2=((k-1)*Tk+Tf)*Pfk1;
     fenzi=fenzi+a1+a2;
     a3=k*h*Ppk1+E(h,k)*Pfk1;
     fenmu=fenmu+a3;
end
outputArg1=1-fenzi/fenmu;
outputArg1=-outputArg1;
if(outputArg1-A0)<0
    outputArg1=outputArg1+abs(outputArg1-0.9)
end
% if(up-uf)<0
%     outputArg1=outputArg1+abspower(up-uf);
% end
end

