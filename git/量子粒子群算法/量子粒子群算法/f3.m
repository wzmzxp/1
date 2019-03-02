function y=f3(x)
% This Rastrigrin Function
% x is a vector
d=length(x);
y=0;
for k=1:d
    y=y+(x(k)^2-10*cos(2*pi*x(k))+10);
end