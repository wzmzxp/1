A=[5 2 6 0 0 1 0;
   4 5 1 0 0 0 0;
   0 0 0 2 3 1 0;
   1 0 2 3 1 0 0;
   5 2 0 1 2 3 0;
   0 0 0 1 2 0 3;
   2 0 3 0 1 0 0;];
b=[1 2 5 6 3 4 0]';
%% lsqr
x=lsqr(A,b)
maxit=15;
x=lsqr(A,b,1e-14,maxit)  % min(阶数，20)
M1=rand(7);% 预处理器
M2=rand(7);%  inv(M)*Ax=inv(M)*b
x=lsqr(A,b,1e-15,maxit,M1,M2)
x0=[0.1 0.2 0.2 0.3 0.2 0.1 0.3]';
x=lsqr(A,b,1e-15,maxit,M1,M2,x0)

[x,flag,relres,iter,resvec]=lsqr(A,b,1e-14,maxit,M1,M2) % norm(b-Ax)/norm(b)


%% minres
A=[5 2 6 0 0 1 0;
   2 5 1 0 0 0 0;
   6 1 0 2 3 1 0;
   0 0 2 3 1 0 0;
   0 0 3 1 2 2 1;
   1 0 1 0 2 0 0;
   0 0 0 0 1 0 0;];
b=[1 2 5 6 3 4 0]';
x=minres(A,b)% 默认1e-6
x1=minres(A,b,1e-15)% 默认1e-6
x2=minres(A,b,1e-15,13)% 默认1e-6
M1=rand(7);
M2=rand(7);
M1=tril(M1,-1)+triu(M1',0);
M2=tril(M2,-1)+triu(M2',0);
M1=M1'*M1;
M2=M2'*M2;
x3=minres(A,b,1e-15,13,M1) % 默认1e-6

x0=[0.1 0.2 0.2 0.3 0.2 0.1 0.3]';
x=minres(A,b,1e-15,maxit,M1,[],x0)

[x,flag,relres,iter,resvec]=minres(A,b,1e-14,maxit,M1) % norm(b-Ax)/norm(b)


%% qmr
%% gmres
