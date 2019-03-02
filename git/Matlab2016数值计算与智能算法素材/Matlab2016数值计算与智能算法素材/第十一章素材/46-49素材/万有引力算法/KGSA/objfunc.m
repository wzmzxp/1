function Y = objfunc (x)
alfa = 0.5;
y = 11*sin(6*x) + 7*cos(5*x);
Y = exp(-alfa*(-y));