function X=GS_col(A,b)
%高斯消元法，列主元消去法
if det(A)==0,error('行列式为0，求解终止！');end
m=size(A,1);
A=[A,b];
%% 消元
for i=1:m-1
    %寻找第i列最大主元
    c=A(i:end,i);%取出第i列的第i个到最后一个元素
    id=find(abs(c)==max(abs(c)));%计算绝对值最大的位置
    row=id(1)+i-1;%因为可能有相同的最大元素，取第一个
    %交换行
    temp=A(i,:);
    A(i,:)=A(row,:);
    A(row,:)=temp;
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
%     a=A(i,i);
    for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% 对角线单位化，求X值
X=zeros(m,1);
for i=1:m
    A(i,:)=A(i,:)/A(i,i);
    X(i)=A(i,end);
end
