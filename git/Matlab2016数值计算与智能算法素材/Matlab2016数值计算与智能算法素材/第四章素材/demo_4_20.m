clear
clc
%% errorbar
% Y=[4 2 6 3];
% e=[0.1 0.2 0.3 0.2];
% errorbar(Y,e,'*')

%% 
x=0:0.1:2*pi;
y=sin(x);
e=unifrnd(0.01,0.06,1,length(x));
% errorbar(x,y,e)
v1=unifrnd(0.01,0.06,1,length(x));
v2=unifrnd(0.01,0.02,1,length(x));
% errorbar(x,y,v1,v2)
% errorbar(x,y,v1,v2,v1,v2)
errorbar(x,y,e,'horizontal')
%% Öù×´Í¼ ¶þÎ¬Ö±·½Í¼hist
clear
close
clc
x=[0 5 6 8 9 2 4 1 0 1 2 5 7 5 4 9 7 4 1 2 6 8 10];
% [c,c1]=hist(x);
% x1=0:0.5:10;
% hist(x,x1);
% x=randn(1000000,1);
% hist(x,800)
hist(x)
h=findobj(gca,'Type','Patch');
h.EdgeColor='red';
h.FaceColor=[0.2 0.6 0.1];
title('2013')


