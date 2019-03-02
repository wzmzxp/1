function [x1,x2]=jintui(f,x1,h0)
%% 进退法确定搜索区间
% f 函数句柄
% x1 初始点
% h0 步长，要小步长，确定方向，大步长可能跨过极值点
f1=f(x1);
while f1 == inf || f1 == -inf || ~isreal(f1)
    x1=x1+h0;
    f1=f(x1);
end

h=h0;
x2=x1+h;
f2=f(x2);
while 1
    if f2 < f1  %前进搜索
        while 1
            x3=x2+h;
            f3=f(x3);
            if f2 < f3
                a=x1;
                b=x3;
                return;
            else
                x1=x2;
                x2=x3;
                f1=f2;
                f2=f3;
            end
        end
    else  % 后退
        h=-h0;
        Temp=x2;
        x2=x1;
        x1=Temp;
        Temp=f2;
        f2=f1;
        f1=Temp;
        while 1
            x3=x2+h;
            f3=f(x3);
            if f2 < f3
                a=x3;
                b=x1;
                return;
            else
                x1=x2;
                x2=x3;
                f1=f2;
                f2=f3;
            end
        end
    end
end
