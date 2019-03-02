%% ���Թ滮 linprog

%% x = linprog(f,A,b)  ֻ�в���ʽԼ��
f=[3 -1]
A=[-1 1;
   1 1;
   -1 -3;]
b=[1;3;-3]
[x,fval]=linprog(f,A,b)

%% x = linprog(f,A,b,Aeq,beq) ������ʽ������ʽ
f=[-1 -1/3];
A=[1 1;
   1 1/4;
   1 -1;
   -1/4 -1;
   -1 -1;
   -1 1;];
b=[2; 1; 2; 1; -1; 2];
Aeq=[1 1/4];
beq=1/2;
[x,fval]=linprog(f,A,b,Aeq,beq)

%% x = linprog(f,A,b,Aeq,beq,lb,ub) 
f=[2 3 1]
A=[-1 -4 -2;
    -3 -2 0;];
b=[-8;-6];
lb=[0;0;0];
[x,fval]=linprog(f,A,b,[],[],lb);

%% x = linprog(f,A,b,Aeq,beq,lb,ub,options) 
% options = optimoptions('linprog','Algorithm','interior-point');
options = optimoptions('linprog','Algorithm','interior-point-legacy');
% options = optimoptions('linprog','Algorithm','dual-simplex');%��ż�����η�
f=[2 3 1];
A=[-1 -4 -2;
    -3 -2 0;];
b=[-8;-6];
lb=[0;0;0];
[x,fval]=linprog(f,A,b,[],[],lb,[],options)
