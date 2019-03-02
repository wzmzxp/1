% 矩阵的索引
clear
clc

%下标索引
% A=magic(100);
% b=A(56,71);
% A(56,71)=1;
% A(560,71)=1;

%绝对序号的索引
% A=magic(3);
% c=sub2ind(size(A),2,2);
% [m,n]=ind2sub(size(A),5);
%size函数
% [m,~]=size(A);
% A=[1 2 3;2 3 4;];
% m=size(A,1);
% n=size(A,2);

%冒号索引
A=magic(10);
b=A(3:7,3:7);
c=A(3:2:7,3:2:7);
d=A(:,1);
e=A(2:2:6,:);
f=A(:);




