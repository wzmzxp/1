function [z1,z2]= fun(h1,up1)
% clear all
global n b jifenk Ck Cp Cf Tk Tp Tf
global N h up uf
h=h1;up=up1;
% h=792;
% n=6027.639;b=2.196;
% N=6;
% up=544;
% Ck=25; Cp=100; Cf=1500;
% Tk=0.2; Tp=4; Tf=8;
% uf=432;
% jifenk=1000;
% k=1000;
% integral(@test,0,pi)
% E(h,k)
z1=obj1(h1,up1);
z2=obj2(h1,up1);
end
% a4=integral(@uuu,0,pi)