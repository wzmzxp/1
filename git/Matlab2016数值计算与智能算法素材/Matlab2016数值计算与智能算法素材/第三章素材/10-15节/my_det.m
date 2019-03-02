function result=my_det(A)
% MY_DET 行列式值的计算
% my_det(A)

if nargin == 0 % 记录的是输入变量的个数
    error('您的输入是空的');
end

if size(A,1) ~= size(A,2) || isempty(A) || isscalar(A)
    warning('请您输入方阵');
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



%% 子函数
function b=iszero(A)
m=size(A,1);
for k=1:m
    if (A(:,k)==0) | (A(k,:) == 0)
        b=0;
        return;
    end
end
b=1;


