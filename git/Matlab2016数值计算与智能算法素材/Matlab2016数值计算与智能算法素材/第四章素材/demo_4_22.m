clear
clc
%% ����ͼ stairs
%stairs(Y)
y=[1 2 3 5 2 6];
stairs(y)
close
% y�Ǿ����ʱ��ÿһ�ж�Ӧһ������ͼ��
x=0:0.2:2*pi;
y=[cos(x)',sin(x)',(x.^2)'];
stairs(y)

%staris(x,y)
x=0:0.2:2*pi;
y=[cos(x)',sin(x)',(x.^2)'];
h=stairs(x,y);
close
%% scatterɢ��ͼ
%scatter(x,y)
x=linspace(0,2*pi,50);
y=sin(x)+0.1*rand(1,length(x));
sz=unifrnd(20,70,1,length(x));
c=linspace(1,10,length(x));
colormap('autumn');
scatter(x,y,sz,c,'filled');
