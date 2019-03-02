function [L,u]=Doolittle_J(A)
[m,n]=size(A);
if m ~= n,error('���Ƿ���');end
for i=1:m-1
    if det(A(1:i,1:i))<max(max(A))*eps(max(max(A)))
        error('�޷��������Ƿֽ�');
    end
end

L=zeros(m);
u=zeros(m);

for k=1:n
    L(k,k)=1;%��L�Խ��߸�ֵΪ1
    for j=k:n
        a=0;
        for i=1:k-1
            a=a+L(k,i)*u(i,j);
        end
        u(k,j)=A(k,j)-a;%���ȼ���u�ĵ�k��Ԫ��
    end
    %����L��Ԫ��
    for i=k+1:n
        b=0;
        for m=1:k-1
            b=b+L(i,m)*u(m,k);
        end
        L(i,k)=(A(i,k)-b)/u(k,k);%����u����L�ĵ�k��Ԫ��
    end
end
