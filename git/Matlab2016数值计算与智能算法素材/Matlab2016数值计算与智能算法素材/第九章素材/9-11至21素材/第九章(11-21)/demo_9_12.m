%%  DFP
syms x1 x2
f=@(x1,x2) x1.^2+x2.^2-x1*x2-10*x1-4*x2+60;
X=DFP(f,[0 0],1e-8,100)
