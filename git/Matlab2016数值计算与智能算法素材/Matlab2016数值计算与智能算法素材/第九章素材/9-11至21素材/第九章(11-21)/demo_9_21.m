%% »ìºÏ³Í·£º¯Êý
syms x1 x2 
f=x1^2-x1*x2+x2-x1+1;
h=[2*x1+3*x2-9];
g=[x1^2+x2^2-6;x1;x2];

x0=[2 2];
r=10;
c=0.4;
eps=1e-6;
k=100;
[x,result]=CF_hunhe(f,g,h,x0,r,c,eps,k)

