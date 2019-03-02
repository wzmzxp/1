%% 外点惩罚函数法-等式约束
syms x1 x2
f=x1.^2+x2.^2;
hx=[x1-2;x2+3];%列

x0=[0;0];
M=0.01;
C=2;
eps=1e-6;
[x,result]=waidian_EQ(f,x0,hx,M,C,eps)