clear
clc
%% stem(y)
%y������һ������
y=[8 5 6 2 3 7 4];
stem(y)
axis([-1 8 0 10])
close
%y������һ������
% y=[1 2;3 6;8 9; 7 8];
% stem(y)
x=(0:0.2:2*pi)';
y=[cos(x),sin(x)];
stem(y)
%% stem(x,y)
%x,y��������
close
x=linspace(0,2*pi,100);
y=cos(x);
h=stem(x,y)
h.BaseLine.BaseValue=0
%x������,y�Ǿ���
close
x=(0:0.2:2*pi)';
y=[cos(x),sin(x)];
h=stem(x,y,'d:','filled');
%��׼��
%% setm3(z)
%z��������
close
z=[1 2 3 6 5 4 7];
stem3(z)
%z��������
close
z=[1 2 3 6 5 4 7]';
stem3(z)
%stem3(x,y,z)
close
t=0:0.1:2*pi;
x=cos(t);
y=sin(t);
z=x.*y;
h=stem3(x,y,z)

