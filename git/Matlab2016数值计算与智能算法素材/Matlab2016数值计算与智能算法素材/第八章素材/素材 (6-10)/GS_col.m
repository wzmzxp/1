function X=GS_col(A,b)
%��˹��Ԫ��������Ԫ��ȥ��
if det(A)==0,error('����ʽΪ0�������ֹ��');end
m=size(A,1);
A=[A,b];
%% ��Ԫ
for i=1:m-1
    %Ѱ�ҵ�i�������Ԫ
    c=A(i:end,i);%ȡ����i�еĵ�i�������һ��Ԫ��
    id=find(abs(c)==max(abs(c)));%�������ֵ����λ��
    row=id(1)+i-1;%��Ϊ��������ͬ�����Ԫ�أ�ȡ��һ��
    %������
    temp=A(i,:);
    A(i,:)=A(row,:);
    A(row,:)=temp;
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
%     a=A(i,i);
    for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
    end
end

%% �Խ��ߵ�λ������Xֵ
X=zeros(m,1);
for i=1:m
    A(i,:)=A(i,:)/A(i,i);
    X(i)=A(i,end);
end
