%% 无约束多维极值  阻尼牛顿法
syms x1 x2
f=@(x1,x2) (x1+3).^2+25*(x2-2).^2;
[X,result]=Min_ZuniNewton(f,[-0.2 0.02],1e-8,100)
