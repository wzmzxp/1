function y=f1(x)
% This is sphere function
% x is a vector
d=length(x);
y=0;
for k=1:d
    y=y+x(k)^2;
end