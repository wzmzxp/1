function y=f4(x)
% This is Griewank Function
% x is a vector
d=length(x);
y1=0;
y2=1.0;
for k=1:d
    y1=y1+(x(k)-100)^2;
    y2=y2*cos((x(k)-100)/sqrt(k));
end
y=y1/4000-y2+1;