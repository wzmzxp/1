function X=GS(A,b)
%��˹��Ԫ����������������Ψһ��ķ�������Է�����
if det(A) == 0 , error('����ʽΪ0�������ֹ��');end
m=size(A,1);
A=[A,b];
%% ��Ԫ
for i=1:m-1
    a=A(i,i);
    if a == 0
        fprintf('��%d����ԪΪ0�������ֹ��\n',i);
        return;
    end
    for j=i+1:m
        k=A(j,i)/a;
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% �ش�
for i=m:-1:2  %һ����m-1����Ҫ�ش�
    a=A(i,i);
    for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
    end
end
%% �Խ��ߵ�λ������Xֵ
for i=1:m
    A(i,:)=A(i,:)/A(i,i);
    X(i)=A(i,end);
end



