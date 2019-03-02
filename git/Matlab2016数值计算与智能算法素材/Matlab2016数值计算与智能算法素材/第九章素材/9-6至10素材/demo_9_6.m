%% 割线求极值
syms x
f=@(x) x.^2-6*x+9;
% ezplot(f)
[x,fx]=GeXian(f,0,1,100)  % a 函数值  b横坐标
