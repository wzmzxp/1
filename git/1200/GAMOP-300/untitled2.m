global typ
typ=2;
fitnessfcn = @(x)MOP4(x);
nvars = 4;
lb =[0 0 0 0];
ub =[1000,1000,1000,1000];
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto);
% lb=[0];
% ub=[1000]
% X(1)+130*X(2)+200*X(3)+190*X(4)-500 
A=[1 130 200 190];
b=500;
% A=[];
% b=[];
rng default % for reproducibility
x = gamultiobj(fitnessfcn,nvars,A,b,[],[],lb,ub,options);
