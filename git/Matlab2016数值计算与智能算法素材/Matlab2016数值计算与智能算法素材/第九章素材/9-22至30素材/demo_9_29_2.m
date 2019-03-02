function [f,g]=demo_9_29_2(u)
x=u(1);
y=u(2);
z=u(3);
f=-x*y*z;
if nargout > 1 % gradient required
    g = [-y*z
         -x*z
         -x*y;];
end
