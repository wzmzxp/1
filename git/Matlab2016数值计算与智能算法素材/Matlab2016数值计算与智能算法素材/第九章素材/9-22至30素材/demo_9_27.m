%% fminunc

%% 例一 
f=@(x) (x(1)^2+2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))
x0=[0 0];
[x,favl]=fminunc(f,x0)

% X=-10:0.1:10;
% Y=X;
% [x,y]=meshgrid(X,Y);
% f=(x.^2+2*x).*exp(-x.^2-y.^2-x.*y);
% mesh(x,y,f)

%% 提供梯度信息，建立文件
syms x y
f=(x^2+2*x)*exp(-x^2-x^2-x*y);
g=gradient(f);
h=jacobian(g,symvar(f))
% f=@(x) (x(1)^2+2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))
% x0=[1 1];
% options=optimoptions('fminunc','Algorithm','trust-region','SpecifyObjectiveGradient',true)
options=optimoptions('fminunc','Algorithm','quasi-newton')
[x,favl]=fminunc(@demo_9_27_1,x0,options)

%% 海赛矩阵
options=optimoptions('fminunc','Algorithm','trust-region','SpecifyObjectiveGradient',true,'HessianFcn','objective')
[x,favl]=fminunc(@demo_9_27_2,x0,options)

%% 传参数
a=2;
[x,favl]=fminunc(@demo_9_27_3,x0,[],2)
