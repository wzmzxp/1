clear
clc
% �������Ĵ���
y=sym('x');
syms z
% ��
syms a b c
% ����
y=sym('a*x+x^2');

syms a x
y=a*x+x^2
y1='b*x+2';

% ���ž���
syms sita
M=[cos(sita)  -sin(sita);
   sin(sita)  cos(sita)];
M1=M'
a=rank(M)


%% ����
syms a b c d e
y=a+b
x=c-d
y1=x*y
y2=y1/y
y3=y1^3
y4=sqrt(y3)
y5=exp(y4)



