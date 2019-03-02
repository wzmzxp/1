function [c,ceq,gc,gceq]=demo_9_29_3(u)
x=u(1);
y=u(2);
z=u(3);
c=[];
ceq=x*y+x*z+y*z-80;

if nargout > 2
    gceq=[y + z;
        x + z;
        x + y];
    gc=[];
end
