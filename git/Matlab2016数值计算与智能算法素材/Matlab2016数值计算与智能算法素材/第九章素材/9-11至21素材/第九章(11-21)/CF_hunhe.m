function [x,result]=CF_hunhe(f,g,h,x0,r,c,eps,k)
% f 目标函数
% g 不等式约束函数矩阵
% h 等式约束函数矩阵
% x0 初始值
% r 初始障碍因子
% c 障碍因子缩小倍数
% eps 退出容差
% k 循环次数

Neq=sum(1./g);%不等式约束
Eq=sum(h.^2);%等式约束

f_Neq=double(subs(g,symvar(Neq),x0));
if ~isempty(find(f_Neq < 0))
    x=[];
    result=[];
    return;
end

n=1;
while n < k
    F=f+r*Neq+1/sqrt(r)*Eq;
    F=matlabFunction(F);
    [x1,result]=Min_Newton(F,x0,eps,100);
    x1=reshape(x1,1,length(x0));
    if norm(x1-x0) < eps
        x=x1;
        result=double(subs(f,symvar(f),x));
        break;
    else
        x0=x1;
        r=r*c;
    end
    
    n=n+1;
end
