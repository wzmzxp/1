%% ���ͷ�������-��ʽԼ��
syms x1 x2
f=x1.^2+x2.^2;
hx=[x1-2;x2+3];%��

x0=[0;0];
M=0.01;
C=2;
eps=1e-6;
[x,result]=waidian_EQ(f,x0,hx,M,C,eps)