clear all
global n b jifenk Ck Cp Cf Tk Tp Tf
global N h up uf
% 11.9021  337.1226

h=10;
% h=11.9021;
n=6027.639;b=2.196;
N=15;
up=1092;
 Cp=100; Cf=1500;Ck=10;
Tk=0.2; Tp=4; Tf=8;

obj1([1092,10])
% global x y z c 
% global Q H
% Q=0.4;H=0.9;
% x=0.6;
% y=.10;
% z=0.9; 
% c=MOP4(Q,H)
% optimset('TolFun',1e200);
lb=[10 10];
ub=[1600 1600];
options = optimoptions('ga','PlotFcn', @gaplotbestf);
[r,r2]=ga(@obj1,2,[],[],[],[],lb,ub,[],[],options);
r 
r2