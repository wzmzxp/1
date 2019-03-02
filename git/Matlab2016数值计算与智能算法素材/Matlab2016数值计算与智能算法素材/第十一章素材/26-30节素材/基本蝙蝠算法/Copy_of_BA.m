%% BA 蝙蝠算法
close
clear
clc

batnum = 30;
A0 = 0.5;
r0 = 0.25;
fmin = 0.1;
fmax = 1;
maxgen = 500;
alfa = 0.7; %音量衰减系数
gama = 0.5; %速率增强系数
lb = -pi;
ub = pi;
% 种群初始化
X = lb + (ub - lb)*rand(batnum,1);
Y = objfunc(X);

plotx = linspace(-pi,pi,500);
ploty = 11*sin(6*plotx) + 7*cos(5*plotx);
plot(plotx,ploty)
hold on
h = plot(X,Y,'*');

[bestY,Ind] = max(Y);
bestX = X(Ind);
V = zeros(batnum,1);
A = ones(batnum,1)*A0;
r = ones(batnum,1)*r0;
for iter = 1 : maxgen
    for i = 1 : batnum
        fi = fmin + (fmax - fmin)*rand;
        V(i) = V(i) + (X(i) - bestX)*fi;
        nextX = X(i) + V(i);
        if rand > r(i)  % 最优解产生扰动
            meanA = sum(A)/batnum
            nextX = bestX + (2*rand - 1)*meanA;
        end
        if nextX < lb
            nextX = lb;
        end
        if nextX > ub
            nextX = ub;
        end
        nextY = objfunc(nextX);

        if nextY >= Y(i) && rand < A(i) 
            X(i) = nextX;
            Y(i) = nextY;
            r(i) = r0*(1 - exp(-gama*iter));
            A(i) = alfa * A(i);
            if nextY > bestY
                bestY = nextY;
                bestX = nextX;
            end
        end
    end
    h.XData = X;
    h.YData = Y;
    pause(0.005)
end

fprintf('最优位置：%f\r最优函数值：%f\r',bestX,bestY)