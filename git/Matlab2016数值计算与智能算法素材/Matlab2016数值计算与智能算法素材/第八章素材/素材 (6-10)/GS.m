function X=GS(A,b)
%高斯消元法，本例仅计算有唯一解的非齐次线性方程组
if det(A) == 0 , error('行列式为0，求解终止！');end
m=size(A,1);
A=[A,b];
%% 消元
for i=1:m-1
    a=A(i,i);
    if a == 0
        fprintf('第%d个主元为0，求解终止！\n',i);
        return;
    end
    for j=i+1:m
        k=A(j,i)/a;
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% 回代
for i=m:-1:2  %一共有m-1列需要回代
    a=A(i,i);
    for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
    end
end
%% 对角线单位化，求X值
for i=1:m
    A(i,:)=A(i,:)/A(i,i);
    X(i)=A(i,end);
end



