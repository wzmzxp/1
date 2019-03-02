function x=BFGS(f,x0,eps,k)

x0=x0';
TiDu=matlabFunction(gradient(sym(f)));
m=length(x0);
A=eye(m);%构造初始矩阵


f_cal='f(x0(1),x0(2))';
tidu_cal='TiDu(x0(1),x0(2))';
f1_cal='f(x_1(1),x_1(2))';

%% 从第一个点计算到第二个点
f_x0=eval(f_cal);
tidu_x0=eval(tidu_cal);
if norm(tidu_x0) < eps
    x=x0;
    return;
end
d=-A*tidu_x0;% 下降方向
syms alfa
x_1=x0+alfa*d;
f_x1=eval(f1_cal);
df_x1=diff(f_x1);
dalfa=double(solve(df_x1));
x0=x0+dalfa*d;
tidu_x1=eval(tidu_cal);

n=1;
while n < k && norm(tidu_x1) > eps
    delta_x=dalfa*d;
    delta_g=tidu_x1-tidu_x0;
    delta_A=-A*delta_x*delta_x'*A/(delta_x'*A*delta_x)+delta_g*delta_g'/(delta_g'*delta_x);
    A=A+delta_A;
    tidu_x0=tidu_x1;
    
    d=-A*tidu_x0;% 下降方向
    syms alfa
    x_1=x0+alfa*d;
    f_x1=eval(f1_cal);
    df_x1=diff(f_x1);
    dalfa=double(solve(df_x1));
    x0=x0+dalfa*d;
    tidu_x1=eval(tidu_cal);
end
x=x0;
