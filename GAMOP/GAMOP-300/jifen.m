function [outputArg1] = jifen(t)
% outputArg1=sin(x)
%h外面传进来的
global n b h jifenk Tf
jifenk=t;
R1=exp(-power((t/n),b));
R2=exp(-power((((k-1)*h)/n),b));
outputArg1=1-R1./R2;
% a=t;
% outputArg1=integral(@F,0,jifenk);
% outputArg1
end

