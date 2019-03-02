function Y=fen_linear(X,Y,X0)

m=length(X);
if (max(X0)>max(X))||(min(X0)<min(X))
    warning('数据超出范围！');
end
X0(X0>max(X)|X0<min(X))=[];
Y0=zeros(size(X0));

syms x
id=1;
for i=1:m-1
    xi=X0(X0>=X(i)&X0<X(i+1));
    if isempty(xi),continue;end
    Ihx=Y(i)*(x-X(i+1))/(X(i)-X(i+1))+Y(i+1)*(x-X(i))/(X(i+1)-X(i));
    Ih=sym2poly(expand(Ihx));
    Y0(id:id+length(xi)-1)=polyval(Ih,xi); 
    id=length(xi)+id;
end
plot(X,Y,'-o',X0,Y0,'*')
legend('原始点','插值点')


