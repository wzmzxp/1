function [result,k]=jacobi(A,b,x0,n)
%线性方程组迭代求解，雅克比迭代
%A为系数矩阵
%b为常数向量
%x0为初始值
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D^(-1)*(L+U);
r=vrho(B);%谱半径，特征值绝对值最大的那个，小于1收敛
if r>=1
    disp('无法收敛！');
    return;
end
f=D^(-1)*b;
i=1;
while i<n
    x1=B*x0+f;
    if norm(x1-x0)<1e-9
        result=x1;
        k=i;
        return;
    end
    x0=x1;
    i=i+1;
end
