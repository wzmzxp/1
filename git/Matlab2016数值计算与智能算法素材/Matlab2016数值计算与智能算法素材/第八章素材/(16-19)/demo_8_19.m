syms x1 x2
F=[x1^2-2*x1-x2+0.5;x1^2+4*x2^2-4];
[X,tol]=newton_sys(F,[1 1],20)
t=matlabFunction(F)
x=fsolve(t,[1 1])