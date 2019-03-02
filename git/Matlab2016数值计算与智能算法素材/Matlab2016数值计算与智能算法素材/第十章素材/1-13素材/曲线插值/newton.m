function [x,y]=newton(X,Y)

m=length(X);
c=cha(X,Y);

syms x
for i=1:m-1
    D1=x-X(1:i);
    D(i)=prod(D1);
end

N=sym2poly(expand(sum(D.*c)+Y(1)));
x=X(1):0.1:X(end);
y=polyval(N,x);
