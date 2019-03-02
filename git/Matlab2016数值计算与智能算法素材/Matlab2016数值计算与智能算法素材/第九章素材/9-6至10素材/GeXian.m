function [x,result]=GeXian(f,x0,x1,k)
if nargin == 3
    k=100;
end

f_1=sym(f);
if ~isempty(symvar(f_1))
    df=diff(f_1);%一阶求导
    if ~isempty(symvar(df))
        df=matlabFunction(df);
    end
else
    fprintf('函数输入有误');
    return;
end

%% 迭代
tol=1;
eps=1e-6;
n=1;
while tol > eps && n < k
    x2=x1-df(x1)/((df(x1)-df(x0))/(x1-x0));
    tol=abs(df(x2));
    x0=x1;
    x1=x2;
end
x=x2;
result=f(x);



