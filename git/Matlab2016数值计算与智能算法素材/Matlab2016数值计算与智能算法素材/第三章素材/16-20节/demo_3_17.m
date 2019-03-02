%几种随机矩阵的生成函数
clear
clc
%% rand()
% A=rand(6);
% A1=rand(5,2)
% A2=rand([5,2])
% A3=rand(size(A))
% A4=rand(size(A2,1),size(A2,2))
% A5=rand(1)
% A6=rand()
% A7=rand([1,1])
% A8=rand(1,1)
% A9=rand(10000,1000);
% [a,b]=find(A9<0.1 | A9>1);
% 
% A10=5+(10-5)*rand(10);

%% randn
% A1=randn(5);

%% randi
% A=randi([2 8],10,10);
% A1=randi([2 8],10,1);

%% randperm
A=randperm(7);
A1=randperm(10,4)
A2=randperm(10,10)
% A3=randperm(k,n)，使用此函数，k必须小于等于n





