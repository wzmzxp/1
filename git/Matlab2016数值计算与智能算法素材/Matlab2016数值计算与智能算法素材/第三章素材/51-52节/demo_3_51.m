x=1:6;
y=[1 4 5 8 10 11];
plot(x,y,'o');
hold on
axis([-5 10 -2 15]);
A=[1 1;2 1;3 1;4 1;5 1;6 1];
b=[1;4;5; 8; 10; 11];
a=inv(A'*A)*A'*b;
y1=a(1).*x+a(2);
plot(x,y1,':');

Q=orth(A);
R=Q'*A;
a1=inv(R)*Q'*b
x=0:8
y2=a1(1).*x+a1(2);
plot(x,y2);

[q,r]=qr(A)
a1=inv(r)*q'*b
x=0:8
y2=a1(1).*x+a1(2);
plot(x,y2);

