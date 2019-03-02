%矩阵的特征值特征向量  
%函数 eig()
% 1、 a=eig(A),a为特征值
A=[3 7 9;-4 -5 1;2 4 4]
a=eig(A)
%2、[v,d]=eig(A),v存储特征向量，按列存储，d存储特征值
[v,d]=eig(A)
%[v,d]=eig(A,'nobalance')，可以提高求解精度，当A中存在于eps数量级差不多的数的时候
A=[3 7 9;-4 -5 1;2 4 eps(2)/2]
[v,d]=eig(A)
[v1,d1]=eig(A,'nobalance')