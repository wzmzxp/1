function [x,y]=lagrange(X,Y)

if length(X)~=length(Y)
    error('维数不相同');
end

m=length(X);
for i=1:m
    L1(i)=Y(i)*ji(X,i);
end

L=sym2poly(expand(sum(L1)));
x=X(1):0.1:X(end);
y=polyval(L,x);


function D=ji(X,n)
syms x

Xn=X(n);
X(n)=[];
B=x-X;
C=Xn-X;
D=prod(B)/prod(C);






