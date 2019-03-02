%% 二次规划


H=[2 -2;-2 4]
f=[-2;-6;]
A=[1 1;-1 2]
b=[2;2]
lb=zeros(2,1)
[x,favl]=quadprog(H,f,A,b,[],[],lb)