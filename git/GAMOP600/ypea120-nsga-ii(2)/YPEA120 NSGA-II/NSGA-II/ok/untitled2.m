global typ
typ=3;
fitnessfcn = @(x)MOP4(x);
nvars = 4;
lb =[0 0 0 0];
ub =[1000,1000,1000,1000];
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto);

A=[1 130 200 190];
b=500;

rng default 
x = gamultiobj(fitnessfcn,nvars,A,b,[],[],lb,ub,options);
