%矩阵的秩  rank
A=[1 2 4;4 2 1;4 9 7]
a=rank(A)
%求矩阵奇异值算法
a1=svd(A)%矩阵A的秩是矩阵A大于0的奇异值的个数
a2=rank(A,1.7)%1.7是一个公差

%矩阵的迹 trace
b=trace(A)
b1=sum(diag(A))