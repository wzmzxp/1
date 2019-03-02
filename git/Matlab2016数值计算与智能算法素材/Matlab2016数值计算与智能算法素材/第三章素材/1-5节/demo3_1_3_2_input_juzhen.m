%% 第一种输入
% A=[1,5,6;
%    9,5,1;
%    3,8,7;];
%% 第二种输入
% A=[1 5 6
%    9 5 1
%    3 8 7];
%% 第三种输入
% A=[1 5 6;9 5 1;3 8 7;];

%% 建立系数矩阵
% A=[1,2,1;2,-1,2;1,3,-2;];
% b=[6;2;5;]
%% 建立增广矩阵
% B=[A,b];
% B1=[A b];
% b1=b';
% C=[A;b1];

%% 获取一个矩阵的大小
% size()函数
A=[1,2,1;2,-1,2;1,3,-2;2,4,1;]
[a,b]=size(A);

[~,b]=size(A);
c=size(A,1)%返回的就是行数
c=size(A,2)%返回的就是列数

%% 矩阵大小的改变
A=[1,2,1;2,-1,2;1,3,-2;2,4,1;]

% reshape()

B=reshape(A,3,4)
C=reshape(A,12,1)
D=reshape(A,1,12)

%需要注意：reshape可以更改矩阵大小，但是要注意更改前后元素的个数一定是相同的
% E=reshape(A,13,1) 该语句错误







