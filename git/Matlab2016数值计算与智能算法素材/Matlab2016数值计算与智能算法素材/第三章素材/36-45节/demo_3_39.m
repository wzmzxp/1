%求矩阵的逆  inv
A=[1 2 3;8 7 5; 9 4 6]
% a=det(A)
% B=inv(A)%第一种
% B1=A^(-1)%第二种
% B2=rref([A,eye(3)])%第三种


% A1=[1 2 3;8 7 5; 2 4 6]
% a1=det(A1)%行列式为0，矩阵逆不存在
% B1=inv(A1)

A1=[1 2 3;8 7 5; 2 4 6]
%矩阵的伪逆 pinv
B=pinv(A1)
a=A1-A1*B*A1



