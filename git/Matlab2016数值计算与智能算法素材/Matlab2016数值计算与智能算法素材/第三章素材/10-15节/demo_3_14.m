%rref函数解方程组

% A=[1 2 1;2 -1 2;1 3 -2];
% b=[6;2;5];
% B=[A,b];
% a=rref(B);

A=[1 1 1 1 1 1;
   2 4 8 16 32 1+2^4;
   3 9 27 81 243 1+2^4+3^4;
   4 16 64 256 1024 1+2^4+3^4+4^4;
   5 25 125 625 3125 1+2^4+3^4+4^4+5^4]
a=rref(A);
a1=a(1,6);
a2=a(2,6);
a3=a(3,6);
a4=a(4,6);
a5=a(5,6);

b=1 + 2^4 +3^4 +4^4 +5^4 +6^4
c=a1*6 + a2*6^2+a3*6^3 +a4*6^4 +a5*6^5
b-c

