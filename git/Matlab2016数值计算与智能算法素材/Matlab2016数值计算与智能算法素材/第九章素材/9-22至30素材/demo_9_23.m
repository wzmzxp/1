%% 最大最小化

%% x = fminimax(fun,x0)
x0=[5;5];
[x,fval]=fminimax(@demo_9_23_1,x0)

%% x = fminimax(fun,x0,A,b)  有不等式约束 
x0=[5.5;5.5];
A=[1 0;
   -1 0;
   0 1;
   0 -1;];
b=[6;-5;6;-5];
[x,fval]=fminimax(@demo_9_23_1,x0,A,b)

%% x = fminimax(fun,x0,A,b,Aeq,beq)
x0=[5.5;5.5];
Aeq=[1 -1;];
beq=[-1];
[x,fval]=fminimax(@demo_9_23_1,x0,[],[],Aeq,beq)

%% x = fminimax(fun,x0,A,b,Aeq,beq,lb,ub)
x0=[5.5;5.5];
[x,fval]=fminimax(@demo_9_23_1,x0,[],[],[],[],[5;5],[6;6])

%% x = fminimax(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
x0=[5.5;5.5];
[x,fval]=fminimax(@demo_9_23_1,x0,[],[],[],[],[],[],@demo_9_23_2)

