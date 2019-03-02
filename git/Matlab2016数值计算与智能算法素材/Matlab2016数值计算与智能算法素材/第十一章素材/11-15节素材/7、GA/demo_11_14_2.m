function [c,ceq]=demo_11_14_2(u)
x=u(1);
y=u(2);
z=u(3);
c=[];
ceq=x*y+x*z+y*z-75;
