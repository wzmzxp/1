function [G,GT]=cho(A)
[L,D,U]=LDU(A)
D1=sqrt(D)
G=L*D1
GT=D1*U