function y=f2(x)
% f1 is Rosenbrock function
% The variabe x is a vector
%
d=length(x);
z=0;
for k=1:d-1
  z=z+(100*(x(k+1)-x(k)^2)^2+(x(k)-1)^2);
end
y=z;
        