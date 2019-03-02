function [result,k]=Sor(A,b,x0,w)
%线性方程组迭代求解，逐次超松弛，successive over relaxation method  M=1/w*(D-wL)
%w=1，为gauss_sedidel迭代，w>1为超松弛迭代，w<1为低松弛迭代，松弛迭代因子只有在0-2范围内才可能收敛 
%A为系数矩阵
%b为常数向量
%x0为初始值
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=(D-w*L)^(-1)*((1-w)*D+w*U);
r=vrho(B);%谱半径，特征值绝对值最大的那个，小于1收敛
if r>=1
    disp('无法收敛！');
    return;
end
f=w*(D-w*L)^(-1)*b;
i=1;
while 1
    x1=B*x0+f;
    if norm(x1-x0)<1e-8
        result=x1;
        k=i;
        return;
    end
    if i>1000
        return;
    end
    x0=x1;
    i=i+1;
end