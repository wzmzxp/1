function [result,x]=huangjin(f,x0,n)
tol=1e-6;
x1=x0(1);
x2=x0(2);

i=1;
while i < n
    %取中间值
    a=x1+0.382*(x2-x1);
    b=x1+0.618*(x2-x1);
    fa=f(a);
    fb=f(b);
    % 判断fa  fb大小，缩小区间
    if fa < fb
        x2=b;
    else
        x1=a;
    end
    if  abs(x1-x2) < tol
        result=f((x1+x2)/2);
        x=(x1+x2)/2;
        break;
    end
    i=i+1;
end