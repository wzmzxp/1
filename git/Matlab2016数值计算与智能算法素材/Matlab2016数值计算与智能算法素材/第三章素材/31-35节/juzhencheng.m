function P=juzhencheng(varargin)
if nargin==0
    P=[];
    warning('输入元素为空！');
    return;
elseif nargin==1
    P=varargin{1};
    return;
end

P1=varargin{nargin};
P2=varargin{nargin-1};
for k=nargin:-1:2
    P_TEM=cheng(P2,P1);
    P1=P_TEM;
    if k==2
        break;
    end
    P2=varargin{k-2};
end
P=P_TEM;



function P_TEM=cheng(P2,P1)
if size(P2,2)~=size(P1,1)
    warning('矩阵维度无法相乘！');
    return;
end
P_TEM=zeros(size(P2,1),size(P1,2));
for m=1:size(P2,1)
    for n=1:size(P1,2)
        P_TEM(m,n)=P2(m,:)*P1(:,n);
    end
end
    