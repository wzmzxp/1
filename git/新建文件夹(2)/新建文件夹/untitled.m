clear all
clc
global x y z c 
global Q H
Q=0.4;H=0.9;
x=0.6;
y=.10;
z=0.9; 
c=MOP4(Q,H)
optimset('TolFun',1e200);
lb=[-5 -5];
ub=[5 5];
[r,r2]=ga(@MOP2,2,[],[],[],[],lb,ub);
