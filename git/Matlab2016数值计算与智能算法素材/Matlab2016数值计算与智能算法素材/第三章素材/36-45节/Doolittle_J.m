function [L,u]=Doolittle_J(A)
[m,n]=size(A);
if m ~= n,error('不是方阵');end
for i=1:m-1
    if det(A(1:i,1:i))<max(max(A))*eps(max(max(A)))
        error('无法进行三角分解');
    end
end

L=zeros(m);
u=zeros(m);

for k=1:n
    L(k,k)=1;%给L对角线赋值为1
    for j=k:n
        a=0;
        for i=1:k-1
            a=a+L(k,i)*u(i,j);
        end
        u(k,j)=A(k,j)-a;%首先计算u的第k行元素
    end
    %计算L的元素
    for i=k+1:n
        b=0;
        for m=1:k-1
            b=b+L(i,m)*u(m,k);
        end
        L(i,k)=(A(i,k)-b)/u(k,k);%根据u计算L的第k列元素
    end
end
