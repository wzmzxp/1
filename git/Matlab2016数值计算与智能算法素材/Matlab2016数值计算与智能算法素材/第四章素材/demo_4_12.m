clear
clc
x=0:0.1:2*pi;
y1=sin(x);
y2=cos(x);
%% plotyy(x,y1,x,y2)
% plotyy(x,y1,x,y2)
%% plotyy(x,y1,x,y2)
% plotyy(x,y1,x,y2,'stem')
%% plotyy(x,y1,x,y2,'stem','plot')
% plotyy(x,y1,x,y2,'stem','plot')
%% [ax,h1,h2]=plotyy(x,y1,x,y2)
[ax,h1,h2]=plotyy(x,y1,x,y2);
ax(1).FontSize=16;
ax(1).YColor='yellow';
h1.LineStyle=':';


