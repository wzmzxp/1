%向量的范数
%向量的2-范数
V=[1; 2; 3; 6; 7];
a1=norm(V);
%向量的1-范数
a2=norm(V,1);
%向量的正无穷范数
a3=norm(V,inf);
%向量的负无穷范数
a4=norm(V,-inf);

%矩阵的范数
%矩阵的2-范数，奇异值最大值
A=[4 5 6;8 5 2;1 3 5]
a1=norm(A,2);
a11=max(svd(A));
%矩阵的1-范数，列范数
a2=norm(A,1)
a22=sum(A,1)
%矩阵的无穷范数，行范数
a3=norm(A,inf)
% a31=norm(A,-inf)%矩阵的模只能为 1、2、inf 或 'fro'
a33=sum(A,2)
%矩阵的F-范数
a4=norm(A,'fro')


