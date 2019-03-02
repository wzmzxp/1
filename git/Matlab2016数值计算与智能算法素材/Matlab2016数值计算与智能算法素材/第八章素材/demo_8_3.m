%% fzero  
% 用法1
x1=fzero('x^2-2',0);
x2=fzero('x^2-2',[0 3]);

%用法2
x3=fzero(@myfun,2)

fun=@(x) x.^2-2+x.^3;
x4=fzero(fun,2)

options=optimset('Display','notify')
x5=fzero(fun,2,options)
% TolX  2.2204e-16

[x6,fval]=fzero(fun,2)
[x6,fval,exitflag]=fzero(fun,2)

