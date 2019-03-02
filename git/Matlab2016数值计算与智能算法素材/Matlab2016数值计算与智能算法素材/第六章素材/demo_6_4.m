%% 符号微分
syms x1 x2 x3
y=x1^4-5*x1^2+6
dy=diff(y)%求一阶导数
d2y=diff(y,2)%求二阶导数

y1=x1^5*x2+x2*x3-x1^2*x3
py1=diff(y1,x1,1)
py2=diff(y1,x1,2)
% symvar(y1)

%% 混合偏导
syms a b x y
u=exp(a*x)*cos(b*y)
duxy=diff(u,x,y)
duyx=diff(u,y,x)

w=x*sin(x*y)
dwx=diff(w,x,3)
dwy=diff(dwx,y)

dw3xy=diff(w,x,x,x,y)

%% 差分
A=[4 5 6 3 2 1];
a=diff(A)

A=[4 5 6;7 4 2;5 6 2]
A1=diff(A)
A2=diff(A,2)
A3=diff(A,2,1)
A4=diff(A,2,2)