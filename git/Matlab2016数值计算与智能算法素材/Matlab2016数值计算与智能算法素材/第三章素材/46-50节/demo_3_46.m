%cholesky�ֽ⺯��  chol
% A=[5 1 2;1 3 2;2 2 4]
% a_eig=eig(A)%��������ֵ����0������Գ�������
% B=chol(A)%�����Ǿ���A=B'*B
% B1=chol(A,'lower')%�����Ǿ���A=B1*B1'

% A1=[5 1 2;1 3 2;2 2 1]
% a_eig=eig(A1)
% B=chol(A1)%�������Ϊ��������

%���Ƿֽ⺯��  lu   [l,u]=lu(A)
%  PA=LU
A=[0 1 2;1 3 2;2 2 4]
[l,u]=lu(A)
[l,u,p]=lu(A)

