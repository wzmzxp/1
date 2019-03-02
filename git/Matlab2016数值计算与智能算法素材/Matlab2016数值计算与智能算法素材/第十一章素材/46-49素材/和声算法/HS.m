%% HS 和声算法
close
clear
clc

HMS = 50;
HMCR = 0.75;
PAR = 0.25;
bw = 0.01;
maxgen = 1000;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(HMS,1);
Y = objfunc(X);
%% 绘图
plotx = linspace(-pi,pi,1000)';
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen

    if rand > HMCR
        nextX = X(randi(HMS));
        if rand < PAR
            nextX = nextX + rand*bw - bw/2;
        end
    else
        nextX = lb + (ub - lb)*rand;
    end
    if nextX < lb
        nextX = lb;
    end
    if nextX > ub
        nextX = ub;
    end

    nextY = objfunc(nextX);
    [badY,badYindex] = min(Y);
    badX = X(badYindex);
    if nextY > badY
        X(badYindex) = nextX;
        Y(badYindex) = nextY;
    end
    
    h.XData = X;
    h.YData = Y;
    pause(0.01);
end

[bestY,bestYindex] = max(Y);
bestX = X(bestYindex);
fprintf('最佳位置：%f\n最佳函数值：%f\n',bestX,bestY)