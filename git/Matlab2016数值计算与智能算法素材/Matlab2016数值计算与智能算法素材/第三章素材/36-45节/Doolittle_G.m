function [L,A]=Doolittle_G(A)
if size(A,1)~=size(A,2),error('请输入方阵');end
for i=1:size(A,1)
    if det(A(1:i,1:i)) == 0
        fprintf('第%d阶顺序主子式为0，无法进行分解',i);
        return;
    end
end
m=size(A,1);
L=zeros(m);
for i=1:m
    L(i,i)=1;
end

for i=1:m-1
    for j=m:-1:i+1
        L(j,i)=A(j,i)/A(i,i)
        A(j,:)=A(j,:)-L(j,i)*A(i,:)
    end
end

