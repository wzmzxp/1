%% 整数规划

%% x = intlinprog(f,intcon,A,b) 
f=[3 -1]
A=[-1 1;1 1;-1 -3]
b=[0.5;3;-3]
% intcon=[1]
% intcon=[2]
intcon=[1,2]
% intcon=[]
[x,fval]=intlinprog(f,intcon,A,b)

%% x = intlinprog(f,intcon,A,b,Aeq,beq) 
f=[-3 -2 -1]
A=[1 1 1]
b=7
Aeq=[4 2 1]
beq=12
intcon=[1 2 3]
lb=zeros(3,1)
[x,fval]=intlinprog(f,intcon,A,b,Aeq,beq,lb)

%% 0-1 规划
f=[-3 -2 -1];
A=[1 1 1];
b=7;
Aeq=[4 2 1];
beq=12;
intcon=[1 2 3];
lb=zeros(3,1);
ub=[inf;inf;1];
[x,fval]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)



