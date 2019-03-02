function X=erfen(h,x)
a=x(1);
b=x(2);
fa=h(a);
fb=h(b);

while 1
    fc=h(a/2+b/2);
    if abs(fc)<1e-7
        X=(a/2+b/2);
        return;
    else
        if fa*fc<0
            b=a/2+b/2;
        else
            a=a/2+b/2;
        end
    end
end