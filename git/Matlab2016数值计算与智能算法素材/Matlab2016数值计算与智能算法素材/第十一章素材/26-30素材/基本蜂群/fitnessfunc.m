function fval = fitnessfunc (x)
row = size(x,1);

Y = 11*sin(6*x) + 7*cos(5*x);
fval=zeros(row,1);
for i = 1 : row
    if Y(i) >= 0 
        fval(i) = 1/(1 + Y(i));
    end
    if Y(i) < 0
        fval(i) = 1 + abs(Y(i));
    end
end

