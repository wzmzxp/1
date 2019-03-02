function [x,result]=Min_TD(f,x0,tol)

if nargin == 2
    tol=1e-6;
end
f_sym=sym(f);

%求当前点梯度
h=length(x0); % 看看变量个数
FF='F_td(';
ff='f(';
f_x1='f(';
for k=1:h
    FF=[FF,'x0(',num2str(k),'),'];
    ff=[ff,'x0(',num2str(k),'),'];
    f_x1=[f_x1,'x1(',num2str(k),'),'];
end
FF(end)=[];
FF=[FF,')'];
ff(end)=[];
ff=[ff,')'];
f_x1(end)=[];
f_x1=[f_x1,')'];
%% FF为了计算梯度值  ff为了计算函数值

F_td=matlabFunction(gradient(f_sym));%梯度函数句柄
f_td=eval(FF);%计算当前梯度
d_k=-f_td/norm(f_td);%下降方向

%% 寻找最佳迭代步长 alfa
while norm(f_td) > tol
    syms alfa
    x1=x0(:)+alfa*d_k;%将这个点带入函数，求alfa
    fx1=eval(f_x1);%计算x1带入后的原函数表达式
    d_x1=diff(fx1);%对这个表达是求导
    d_alfa=double(solve(d_x1));%求解表达式为0时的alfa
    
    x0=x0(:)+d_alfa*d_k;
    f_td=eval(FF);%计算当前梯度
    if norm(f_td) < tol
        break;
    end
    d_k=-f_td/norm(f_td);%下降方向
end

x=x0;
result=eval(ff);




