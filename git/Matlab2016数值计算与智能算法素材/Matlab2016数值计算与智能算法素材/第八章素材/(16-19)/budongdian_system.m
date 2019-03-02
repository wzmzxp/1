function [X,Tol]=budongdian_system(f,x0,n)
e=1e-6;
x0=x0(:);
i=1;
while 1
    x1=f(x0)'+x0;
    if norm(x0-x1) < e
        X=x1;
        Tol=f(X);
        return;
    end
    x0=x1;
    i=i+1;
    if i > n
        X=x0;
        Tol=f(X);
        return;
    end
end