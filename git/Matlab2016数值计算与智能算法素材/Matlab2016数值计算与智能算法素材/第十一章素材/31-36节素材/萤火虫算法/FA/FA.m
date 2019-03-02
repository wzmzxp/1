%% FA Yang X.S.萤火虫算法

clear
close
clc

alfa = 0.2;
delta = 0.97;
gama = 1;
beta0 = 1;
fireflynum = 30;
maxgen = 1000;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(fireflynum,1);
Y = objfunc(X); % 以函数值表示绝对亮度
[Y,Yindex] = sort(Y);
X = X(Yindex);
X1 = X;
Y1 = Y;

%% 绘图
plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty)
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen
    alfa1 = alfa * delta^(iter - 1);
    for i = 1 : fireflynum
        for j = 1 : fireflynum
            if Y1(j) > Y(i)
                d = sqrt((X(i) - X1(j))^2);
                beta=beta0*exp(-gama*d^2);
                X(i) = X(i) + (X1(j) - X(i))*beta + alfa1*(rand-0.5);
                if X(i) < lb
                    X(i) = lb;
                end
                if X(i) > ub
                    X(i) = ub;
                end
            end
        end
    end
    Y = objfunc(X);
    [Y,Yindex] = sort(Y);
    X = X(Yindex);
    Y1 = Y;
    X1 = X;
    h.XData = X;
    h.YData = Y;
    pause(0.02);
end
[bestY,bestYindex] = max(Y);
bestX = X(bestYindex);

fprintf('最佳位置：%f\r最大函数值:%f\r',bestX,bestY);
