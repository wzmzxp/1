function [x,result]=waidian_hunhe(f,g,h,x0,M,C,eps,k)
% f 目标函数
% g 不等式约束函数矩阵
% h 等式约束函数矩阵
% x0 初始值
% M 初始惩罚因子
% C 罚因子放大倍数
% eps 退出容差
% 循环次数

CF=sum(h.^2);  %chengfa
n=1;
while n<k
    %首先判断是不是在可行域内
    gx=double(subs(g,symvar(g),x0));%计算当前点的约束函数值
    index=find(gx<0);%寻找小于0的约束函数
    F_NEQ=sum(g(index).^2);
    F=matlabFunction(f+M*F_NEQ+M*CF);
    x1=Min_Newton(F,x0,eps,100);
    x1=x1'
    if norm(x1-x0)<eps
        x=x1;
        result=double(subs(f,symvar(f),x));
        break;
    else
        M=M*C;
        x0=x1;
    end
    n=n+1;
end
