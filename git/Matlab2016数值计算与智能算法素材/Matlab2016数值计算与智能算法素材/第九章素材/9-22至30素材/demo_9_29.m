%% 多维无约束非线性 fmincon
%%
f=@(x) -x(1)*x(2)*x(3);
A=[-1 -1 -1;1 2 2]
b=[20 5]
x0=[1 1 1];
[x,fval]=fmincon(f,x0,A,b,[],[])

%% 
f=@(x) -x(1)*x(2)*x(3);
A=[-1 -1 -1;1 2 2]
b=[20 5]
x0=[1 1 1];
Aeq=[1 1 0];
beq=4
[x,fval]=fmincon(f,x0,A,b,Aeq,beq)

%% 
f=@(x) -x(1)*x(2)*x(3);
A=[-1 -1 -1;1 2 2]
b=[20 5]
x0=[1 1 1];
Aeq=[1 1 0];
beq=4
lb=[4 2 1]
[x,fval]=fmincon(f,x0,A,b,Aeq,beq,lb)

%% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
f=@(x) -x(1)*x(2)*x(3);
x0=[5 5 5];
[x,fval]=fmincon(f,x0,[],[],[],[],[],[],@demo_9_29_1)

%% 提供梯度
options = optimoptions('fmincon','SpecifyObjectiveGradient',true);
syms x y z
ff=-x*y*z;
g=gradient(ff);
x0=[5 5 5];
[x,fval]=fmincon(@demo_9_29_2,x0,[],[],[],[],[],[],@demo_9_29_1)

%% 非线性约束提供梯度
options = optimoptions('fmincon','SpecifyObjectiveGradient',true);
syms x y z
ff=x*y+x*z+y*z-80;
g=gradient(ff)

f=@(x) -x(1)*x(2)*x(3);
x0=[5 5 5];
[x,fval]=fmincon(f,x0,[],[],[],[],[],[],@demo_9_29_3)

