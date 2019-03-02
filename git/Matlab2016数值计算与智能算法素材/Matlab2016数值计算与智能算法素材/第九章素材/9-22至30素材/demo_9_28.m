%% 多维无约束极值
f=@(x) (x(1)^2+2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))
x0=[0 0];
[x,fval]=fminsearch(f,x0)

%% 额外参数
a=5;
f=@(x) (x(1)^2+2*x(1))*exp(-x(1)^2-x(2)^2-a*x(1)*x(2));
x0=[1 1];
[x,fval]=fminsearch(f,x0);
% X=-100:0.1:100;
% Y=X;
% [x,y]=meshgrid(X,Y);
% f=(x.^2+2*x).*exp(-x.^2-y.^2-5*x.*y);
% mesh(x,y,f)
% 
[x,fval]=fminsearch(@demo_9_28_1,x0,[]);

%% 显示求解过程
% 显示函数值的求解
x0=[0 0];
options = optimset('PlotFcns',@optimplotfval);
[x,fval]=fminsearch(@demo_9_28_1,x0,options);

%% 显示迭代过程
options = optimset('Display','iter');
[x,fval]=fminsearch(@demo_9_28_1,x0,options)
%% 输出信息
[x,fval,~,output]=fminsearch(@demo_9_28_1,x0,[])

