%QR分解函数    qr
% A=[4 5 6;7 8 2;4 1 3]
% %[q,r]=qr(A)
% [q,r]=qr(A)

%[q r]=qr(A,0)%经济型的QR分解
% A1=[1 2 3;4 2 1;6 7 1;3 5 7]
% [q r]=qr(A1,0)
% [q1 r1]=qr(A1)

%[q r e]=qr(A)
A2=[1 5 12;4 3 2;7 26 2]
[q,r]=qr(A2)
[q1,r1,e]=qr(A2)

%[q r e]=qr(A,'vector')
[q r e]=qr(A,'vector')

