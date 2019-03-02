clear
clc
%% logspace
% A=linspace(1,6);
A=logspace(1,6);
A1=logspace(1,6,100);
A2=logspace(1,pi);%3.1415926……
%% loglog
Y=[1 5 10 25 40 60 80 100];
% loglog(Y);
x=10.^(-1:0.1:2);
y=2.^x;
plotyy(x,y,x,y,'plot','loglog');
% subplot(1,2,1);
% h=loglog(x,y,'--dr','Markersize',2);
% subplot(1,2,2)
% plot(x,y)


%% semilogx
%X轴是对数。Y轴是线性
x=10.^(-1:0.5:2);
y=x+1./x;
semilogx(x,y)
%% semilogy


