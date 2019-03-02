%% 蚁群算法一维函数优化
clear
close
clc
n= 20 ; 
rho= 0.9 ; 
P0 = 0.2;  
maxgen = 100;  
lb = -pi;
ub = pi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%

X=lb+(ub-lb)*rand(n,1);
tau=objfun(X);
x = -pi:0.01:pi;
y = objfun(x);
plot(x,y)
hold on
h = plot(x,y,X,tau,'*');

for iter = 1 : maxgen
    lamda=1/iter;
    taubest = max(tau);

    P=(taubest-tau)/taubest; 

    for i = 1 : n
        if P(i)<P0  %局部搜索
            temp1=X(i)+(2*rand-1)*lamda;
        else  %全局搜索
            temp1=X(i)+(ub-lb)*(rand-0.5);
        end

        if temp1 < lb
            temp1=lb;
        end
        if temp1 > ub
            temp1 = ub;
        end
       
        if objfun(temp1)>objfun(X(i))  %判断蚂蚁是否移动
            X(i)=temp1;
        end
    end
    Y =objfun(X);
    h(2).XData = X;
    h(2).YData = Y;
    pause(0.1)
    tau=(1-rho) * tau + objfun(X);  %更新信息量
end

[bestY,index] = max(Y)
bestX = X(index)

