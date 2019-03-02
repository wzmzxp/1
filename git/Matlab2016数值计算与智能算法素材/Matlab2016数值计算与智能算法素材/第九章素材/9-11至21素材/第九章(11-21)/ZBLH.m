function x=ZBLH(f,x0,eps,k)

x0 = x0';
m = length(x0);
n = 1;
syms alfa
while n < k
    temp = x0; %作为一个中间变量
    for i = 1:m
        e=zeros(m,1);
        e(i)=1;
        x1 = temp + alfa*e;
        f_alfa=matlabFunction(eval('f(x1(1),x1(2))'));
        [~,d_alfa]=huangjin(f_alfa,0,0.1,1000);
        temp = temp + d_alfa*e;
    end
    x1 = temp;
    if norm(x0 - x1) < eps
        x = x1;
        return;
    end
    x0 = x1;
end