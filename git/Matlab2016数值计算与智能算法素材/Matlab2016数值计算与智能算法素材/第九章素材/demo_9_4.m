syms x
f=@(x) 2*x.^4-x.^3-6*x -5;
a1=8*x^3-3*x^2-6;
x1=vpa(solve(a1,x),5);
[x,fx]=Fabonacci(f,[0 2],1e-9)

% f1=2*x.^4-x.^3-6*x -5;
tol=x-double(x1(1))
