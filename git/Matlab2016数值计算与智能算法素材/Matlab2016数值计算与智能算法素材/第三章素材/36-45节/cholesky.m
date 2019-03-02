function [D DT]=cholesky(A)

[L D1 U]=LDU(A);
D=L*sqrt(D1);
DT=D';