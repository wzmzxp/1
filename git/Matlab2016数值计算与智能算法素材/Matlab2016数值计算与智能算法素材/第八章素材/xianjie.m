function [result,tol]=xianjie(f,x,n)
if nargout == 1
    flag=1;
elseif nargout == 2
    flag=2;
end
x1=x(1);
x2=x(2);
i=1;
while i < n
    x3=x2-f(x2)*(x2-x1)/(f(x2)-f(x1));
    if abs(f(x3)) < 1e-8
        if flag==1
            result=x3;
            return;
        elseif flag==2
            result=x3;
            tol=abs(f(x3));
            return;
        end
    end
    x1=x2;
    x2=x3;
    i=i+1;
end
