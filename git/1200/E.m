function [outputArg1] = E(h1,k)
   global n b h jifenk
   h=h1;
   jifenk=k;
%    a1=k*h;
%    a2=R((k-1)*h);
%    a3=1-R(k*h)/R((k-1)*h);
   a4=integral(@jifen,(k-1)*h,k*h);
%    outputArg1=a1*a3-a4;
outputArg1=a4;
end

