%% SAA 模拟退火
clear
close
clc

%% 参数初始化
T = 1000;
Lk = 100;
maxgen = 200;
alfa = 0.95;
lb = -pi;
ub = pi;

x0 = lb + (ub - lb)*rand;
y0 = objfunc(x0);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(x0,y0,'*');

for iter = 1 : maxgen
    for i = 1 : Lk
        y0 = objfunc(x0);
        x1 = x0 + randn;
        if x1 < lb
            x1 = lb;
        end
        if x1 > ub
            x1 = ub;
        end
        y1 = objfunc(x1);
        if y1 > y0    %小于号以及y0 - y1求极小值，大于号以及y1 - y0 求极大值
            x0 = x1;
        else
            p = exp((y1 - y0)/T);
            if rand < p
                x0 = x1;
            end
        end
    end
    h.XData = x0;
    h.YData = y0;
    pause(0.05);
    T = alfa*T;
end