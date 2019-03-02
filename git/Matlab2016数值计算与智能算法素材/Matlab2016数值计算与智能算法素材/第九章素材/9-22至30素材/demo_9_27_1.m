function [f,g]=demo_9_27_1(x)

f = (x(1)^2+2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2));

if nargout > 1 % gradient required
    g = [exp(- 2*x(1)^2 - x(2)*x(1))*(2*x(1) + 2) - exp(- 2*x(1)^2 - x(2)*x(1))*(x(1)^2 + 2*x(1))*(4*x(1) + x(2))
        -x(1)*exp(- 2*x(1)^2 - x(2)*x(1))*(x(1)^2 + 2*x(1))];
end