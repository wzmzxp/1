function x=mybudongdian(x0)
x1=x0(1);
x2=x0(2);
x(1)=0.5*sin(x1)+0.1*cos(x1*x2)-x1;
x(2)=0.5*cos(x1)-0.1*cos(x2)-x2;