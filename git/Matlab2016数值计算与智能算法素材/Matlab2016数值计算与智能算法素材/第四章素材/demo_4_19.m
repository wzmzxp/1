clear
clc
%% pie(x)
% x=[0.1 0.2 0.4];%小于1
% pie(x)
%% 大于1
x=[3 6 7];
di=[0 0 1];
% pie(x,di)

label={'第一产业：','第二产业：','第三产业：'};
p=pie(x,di);
pp=findobj(p,'Type','Text')
pp(1).String=[label(1),pp(1).String];
pp(2).String=[label(2),pp(2).String];
pp(3).String=[label(3),pp(3).String];
t=p(1);
t.FaceColor=[0.9 0.9 0.8];
t.EdgeColor='red';

%% 多图
close
ax1=subplot(1,2,1);
x=[3 6 7];
x1=[3 5 12];
pie(ax1,x)
ax2=subplot(1,2,2);
pie(ax2,x1)
title(ax1,'中国三产比例')
title(ax2,'美国三产比例')
%% pie3(x)
p1=pie3(x);
