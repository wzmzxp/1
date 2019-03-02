%% ÄÚµã³Í·£º¯Êı
syms x1 x2 x
f=x1.^2+x2.^2;
g=[x1+x2-1;2*x1-x2-2];
x0=[3 1];
M=10;
C=0.5;
eps=1e-6;
[x,result]=neidian(f,g,x0,M,C,eps,100)