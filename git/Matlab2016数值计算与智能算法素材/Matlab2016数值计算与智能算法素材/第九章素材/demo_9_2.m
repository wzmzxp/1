%% 二分法  通过判断一阶导数符号判定方向
syms x
f=@(x) x.^2-5*x+9;% func2str  sym
% ezplot(f)
[x,fx]=Min_EF(f,[0 6],100)  % a 函数值  b横坐标