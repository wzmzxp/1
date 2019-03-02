%cholesky分解函数  chol
% A=[5 1 2;1 3 2;2 2 4]
% a_eig=eig(A)%所有特征值大于0，矩阵对称且正定
% B=chol(A)%上三角矩阵，A=B'*B
% B1=chol(A,'lower')%下三角矩阵，A=B1*B1'

% A1=[5 1 2;1 3 2;2 2 1]
% a_eig=eig(A1)
% B=chol(A1)%矩阵必须为正定矩阵

%三角分解函数  lu   [l,u]=lu(A)
%  PA=LU
A=[0 1 2;1 3 2;2 2 4]
[l,u]=lu(A)
[l,u,p]=lu(A)

