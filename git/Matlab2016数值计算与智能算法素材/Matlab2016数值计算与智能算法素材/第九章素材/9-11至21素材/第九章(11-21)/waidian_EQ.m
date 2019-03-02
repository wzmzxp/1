function [x,result]=waidian_EQ(f,x0,hx,M,C,eps)
% f 目标函数
% x0 初始值
% hx 约束函数
% M 初始罚因子
% C 罚因子放大系数
% eps 容差

%计算惩罚项
CF=sum(hx.^2);  %chengfa

while 1
    F=matlabFunction(f+M*CF);%目标函数，使用之前的牛顿法，需要转换成句柄
    x1=Min_Newton(F,x0,eps,100);
    if norm(x1-x0)<eps
        x=x1;
        result=double(subs(f,symvar(f),x'));
        break;
    else
        M=M*C;
        x0=x1;
    end
end