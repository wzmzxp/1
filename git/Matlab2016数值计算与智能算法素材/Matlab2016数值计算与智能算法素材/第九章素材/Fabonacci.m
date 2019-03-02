function [x,result]=Fabonacci(f,x0,delta)
x3=x0(2);
x0=x0(1);

F=[1 1];
n=3;
while F(end) < (x3-x0)/delta
    F(n)=F(n-1)+F(n-2);
    n=n+1;
end
n=n-1;

x1=x0+F(n-2)/F(n)*(x3-x0);
x2=x0+F(n-1)/F(n)*(x3-x0);

while n > 3
    if f(x1) > f(x2)
        n=n-1;
        x0=x1;
        x1=x2;
        x2=x0+F(n-1)/F(n)*(x3-x0);
    else
        n=n-1;
        x3=x2;
        x2=x1;
        x1=x0+F(n-2)/F(n)*(x3-x0);
    end
end
x=(x0+x3)/2;
result=f(x);

