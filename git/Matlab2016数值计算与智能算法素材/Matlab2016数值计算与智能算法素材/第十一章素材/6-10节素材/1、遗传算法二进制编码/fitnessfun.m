function fitvalue = fitnessfun(x)

Cmin = 0.01;
[row,~] = size(x);
for i = 1:row
    fval = objfun(x(i,:));
    if fval + Cmin > 0
        fitvalue(i) = fval + Cmin;
    else
        fitvalue(i) = 0;
    end
end





