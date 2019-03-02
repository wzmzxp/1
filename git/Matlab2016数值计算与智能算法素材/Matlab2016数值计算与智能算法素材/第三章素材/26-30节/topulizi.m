function P = topulizi(varargin)
P1=varargin{1};

if nargin == 1
    m=size(P1,2);
    P=zeros(m);
    P(1,:)=P1;
    P(:,1)=P1;
    for k=2:m
        for h=2:m
            P(k,h)=P(k-1,h-1);
        end
    end
end

if nargin == 2
   P1=varargin{1};
   P2=varargin{2};
   m=size(P1,2);
   n=size(P2,2);
   P=zeros(m,n);
   P(1,:)=P2;
   P(:,1)=P1;
   if P1(1)~=P2(1)
       disp('第一行元素与第一列元素不相同，以列为准');
   end
   for k=2:m
        for h=2:n
            P(k,h)=P(k-1,h-1);
        end
   end
end
   
   
   