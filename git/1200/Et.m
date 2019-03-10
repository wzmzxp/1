function [outputArg1] = Et(h1,up1)
global N h up Ck Cp Cf
h=h1;up=up1;
% 
% fenzi=0;
% fenmu=0;
outputArg1=0;
for k=1:N
    
    Ppk1=Ppk(k*h+up,k*h);
   
    Pfk1=Pfk(k*h,(k-1)*h);
   a1= k*h*Ppk1
   a2=k*h*Pfk1;
    a3=E(h,k)*Pfk1;

   outputArg1=outputArg1+a1+a2-a3;
end

end



