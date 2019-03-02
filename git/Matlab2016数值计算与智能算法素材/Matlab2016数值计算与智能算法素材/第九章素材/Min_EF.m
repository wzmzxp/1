function [x,result]=Min_EF(f,x0,n)
x1=x0(1);
x3=x0(2);

tol=1e-5;
df=matlabFunction(diff(sym(f)));
x2=(x1+x3)/2;
df2=df(x2);
i=1;
while abs(df2) > tol && i < n
    if df2 < 0 
        x1=x2;
    else
        x3=x2;
    end
    x2=(x1+x3)/2;
    df2=df(x2);
    i=i+1;
end
x=(x1+x3)/2;
result=f(x);

