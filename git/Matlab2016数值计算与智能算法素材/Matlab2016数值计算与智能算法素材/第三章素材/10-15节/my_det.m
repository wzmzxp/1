function result=my_det(A)
% MY_DET ����ʽֵ�ļ���
% my_det(A)

if nargin == 0 % ��¼������������ĸ���
    error('���������ǿյ�');
end

if size(A,1) ~= size(A,2) || isempty(A) || isscalar(A)
    warning('�������뷽��');
    return;
end
if iszero(A) == 0
    result=0;
    return;
end
k=1;
row=size(A,1);

while row ~= 1
    m=size(A);
    V=find(A(:,1) ~= 0);
    n=size(V);
    for h=2:n
        A(V(h),:)=A(V(h),:) + A(V(1),:)*(-A(V(h),1)/A(V(1),1));
    end
    re(k)=(-2*rem(V(1)+1,2)+1)*A(V(1),1);
    k=k+1;
    A(V(1),:)=[];
    A(:,1)=[];
    row=size(A);
end
result=prod(re)*A;



%% �Ӻ���
function b=iszero(A)
m=size(A,1);
for k=1:m
    if (A(:,k)==0) | (A(k,:) == 0)
        b=0;
        return;
    end
end
b=1;


