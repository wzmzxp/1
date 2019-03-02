%奇异值分解函数  svd

% a=svd(A)，就是求矩阵A 的奇异值
A=[4 11 14;8 7 -2];
a=svd(A);

%矩阵的秩rank
b=norm(A);%矩阵的2-范数

%[U S V]=svd(A)，A是m×n的一个矩阵，U就是m×m，S就是m×n，V就是n×n。
[U,S,V]=svd(A)
%验证
A-U*S*V'

%经济型求解奇异值分解  [U,S,V]svd(A,'econ')，A是m×n的一个矩阵，m>n，此时，S是n×n的矩阵；m=n,svd(A)一样，
% m<n，此时求解V的前m列，S是一个m×m的一个矩阵
A=[1 2;5 6;7 8]
[U,S,V]=svd(A)
[U1,S1,V1]=svd(A,'econ')

%[U,S,V]=svd(A,0)，如果m>n，同svd(A,'econ')一样，如果m<=n，就同svd(A)


