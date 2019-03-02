%% 二次插值求极值
syms x
f=@(x) x.^3-6*x+9;
% ezplot(f,[-100 100])
[x,fx]=Min_erci(f,[0 5],100)  % a 函数值  b横坐标
