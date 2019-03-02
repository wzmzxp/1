function C=cha(X,Y)
% C存储差商结果
% X是横坐标

m=length(X);
d=diff(Y)./diff(X);
C(1)=d(1);

for i=2:m-1
    X1=X(i+1:end);
    n=length(X1);
    X2=X(1:n);
    d=diff(d)./(X1-X2);
    C(i)=d(1);    
end
