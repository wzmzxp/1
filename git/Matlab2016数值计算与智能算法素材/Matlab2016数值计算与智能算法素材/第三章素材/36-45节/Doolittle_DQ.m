function [L,u]=Doolittle_DQ(A)
[m,n]=size(A);
%这里省略判断方阵与主子式
L=zeros(m);
u=zeros(m);

for k=1:n
    L(k,k)=1
    for j=k:n
        a=0;
        for i=1:k-1
            a=a+L(k,i)*u(i,j);
        end
        u(k,j)=A(k,j)-a
    end
    
    for i=k+1:n
        b=0;
        for m=1:k-1
            b=b+L(i,m)*u(m,k);
        end
        L(i,k)=(A(i,k)-b)/u(k,k)
    end
end
