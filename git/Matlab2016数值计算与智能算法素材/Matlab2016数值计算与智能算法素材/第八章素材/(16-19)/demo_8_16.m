A=[5 2 6 0 0 1 0;
   4 5 1 0 0 0 0;
   0 0 0 2 3 1 0;
   1 0 2 3 1 0 0;
   5 2 0 1 2 3 0;
   0 0 0 1 2 0 3;
   2 0 3 0 1 0 0;];
b=[1 2 5 6 3 4 0]';

%% bicg 
x1=A\b;
x=bicg(A,b);
maxit=15;
x=bicg(A,b,1e-14,maxit)  % min(阶数，20)
M1=rand(7);% 预处理器
M2=rand(7);%  inv(M)*Ax=inv(M)*b
x=bicg(A,b,1e-14,maxit,M1,M2)

[x,flag,relres,iter,resvec]=bicg(A,b,1e-14,maxit,M1,M2) % norm(b-Ax)/norm(b)

%% cgs 
x=cgs(A,b);
maxit=15;
x=cgs(A,b,1e-14,maxit)  % min(阶数，20)
M1=rand(7);% 预处理器
M2=rand(7);%  inv(M)*Ax=inv(M)*b
x=cgs(A,b,1e-14,maxit,M1,M2)

[x,flag,relres,iter,resvec]=cgs(A,b,1e-14,maxit,M1,M2) % norm(b-Ax)/norm(b)



