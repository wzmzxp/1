%% 外点惩罚函数-混合约束
syms x1 x2
f=(x1-2)^2+(x2-1)^2;
g=[-0.25*x1^2-x2^2+1];%修改成大于等于形式
h=[x1-2*x2+1];
x0=[2 2];
M=0.01;
C=3;
eps=1e-6;
[x,result]=waidian_hunhe(f,g,h,x0,M,C,eps,100)