clear
clc
%% pie(x)
% x=[0.1 0.2 0.4];%С��1
% pie(x)
%% ����1
x=[3 6 7];
di=[0 0 1];
% pie(x,di)

label={'��һ��ҵ��','�ڶ���ҵ��','������ҵ��'};
p=pie(x,di);
pp=findobj(p,'Type','Text')
pp(1).String=[label(1),pp(1).String];
pp(2).String=[label(2),pp(2).String];
pp(3).String=[label(3),pp(3).String];
t=p(1);
t.FaceColor=[0.9 0.9 0.8];
t.EdgeColor='red';

%% ��ͼ
close
ax1=subplot(1,2,1);
x=[3 6 7];
x1=[3 5 12];
pie(ax1,x)
ax2=subplot(1,2,2);
pie(ax2,x1)
title(ax1,'�й���������')
title(ax2,'������������')
%% pie3(x)
p1=pie3(x);
