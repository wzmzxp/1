%% 外点惩罚函数法-不等式约束
syms x1 x2
f=x1.^2+(x2-2).^2;% x1-1>=0,x2-2>=0
g=[x1-1;-x2+2];%修改成大于等于形式
% f=x1^2+2*x2^2;
% g=x1+x2-1;

x0=[0 0];
M=0.03;
C=3;
eps=1e-6;
[x,result]=waidian_Neq(f,g,x0,M,C,eps,100)

