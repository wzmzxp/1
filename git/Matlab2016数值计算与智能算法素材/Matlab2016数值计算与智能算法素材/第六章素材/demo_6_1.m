clear
clc
% 单变量的创建
y=sym('x');
syms z
% 多
syms a b c
% 方程
y=sym('a*x+x^2');

syms a x
y=a*x+x^2
y1='b*x+2';

% 符号矩阵
syms sita
M=[cos(sita)  -sin(sita);
   sin(sita)  cos(sita)];
M1=M'
a=rank(M)


%% 运算
syms a b c d e
y=a+b
x=c-d
y1=x*y
y2=y1/y
y3=y1^3
y4=sqrt(y3)
y5=exp(y4)



