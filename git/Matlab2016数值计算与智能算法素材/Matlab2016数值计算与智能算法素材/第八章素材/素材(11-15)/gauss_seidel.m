function result=gauss_seidel(A,b,x0)
%线性方程组迭代求解，高斯-赛德尔，可以利用当前解得前面的分量求解后面的分量
%A为系数矩阵
%b为常数向量
%x0为初始值
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=(D-L)^(-1)*U;
r=vrho(B);%谱半径，特征值绝对值最大的那个，小于1收敛
if r>=1
    disp('无法收敛！');
    return;
end
f=(D-L)^(-1)*b;
i=1;
while 1
    x1=B*x0+f;
    if norm(x1-x0)<1e-8
        result=x1;
        return;
    end
    if i>1000
        return;
    end
    i=i+1;
    x0=x1;
end
% a=[2 2 -1;1 2 -3;1 -2 11]
% b=[2;6;10]
% -16.0000
%    20.0000
%     6.0000