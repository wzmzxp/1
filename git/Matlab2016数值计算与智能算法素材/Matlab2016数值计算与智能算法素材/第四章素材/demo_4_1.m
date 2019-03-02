clear
clc
x=0:0.01:2*pi;
y=sin(x);
% plot(x,y)%默认绘图
plot(x,y,'-')%实线
plot(x,y,'--')%虚线
plot(x,y,':')
plot(x,y,'-.')%点画线

plot(x,y,'-.ko')%圆形标记
plot(x,y,'-.hk')%六角形标记

%线宽linewidth
plot(x,y,'-.ko','LineWidth',1.5)
%标记的边缘颜色 
plot(x,y,'-.ks','markeredgecolor','y')
%标记里面的颜色
plot(x,y,'-.ks','markeredgecolor','y','markerfacecolor','r')
%标记的大小
plot(x,y,'-.ks','markeredgecolor','y','markerfacecolor','r','markersize',4)
