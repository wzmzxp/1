function y=f6(x)
% This function is Shaffer's f6 function
% x is a two dimensional vector

y=0.5+((sin(sqrt(x(:,1).*x(:,1)+x(:,2).*x(:,2)))).^2-0.5)./((1.0+0.001*(x(:,1).*x(:,1)+x(:,2).*x(:,2))).^2);
