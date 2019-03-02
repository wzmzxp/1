function [a,b]=Min_jintui(f,x1,h0)

x2=x1+h0;
if f(x2) < f(x1)
    x3=x2+h0;
    h=h0;
    while f(x3) < f(x2)
        x3=x2+h;
        h=2*h;
    end
    a=x1;
    b=x3;
else
    Temp=x1;
    x1=x2;
    x2=Temp;
    h=-h0;
    x3=x2+h;
    while f(x3) < f(x2)
        x3=x2+h;
        h=2*h;
    end
    a=x3;
    b=x1;
end

