% 特殊矩阵-空矩阵、全1矩阵、单位阵
clear
clc
%空矩阵
% a=[];
% A=[2 3 6; 8 9 5; 5 3 8;]
% A(2,:)=[]
% A(:,1)=[]

%全1矩阵 ones()
% A=ones(4)
% B=ones(4,4)
% C=zeros(3)
% C(:,:)=1

%单位矩阵 eye
A=eye(5);
B=eye(4,5)
C=eye(5,4)

D=zeros(6);
for m=1:6
    D(m,m)=1;
end
D


