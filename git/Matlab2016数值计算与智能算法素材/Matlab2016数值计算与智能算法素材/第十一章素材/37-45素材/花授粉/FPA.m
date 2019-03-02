%% FPA 花授粉算法
clear
close
clc
%%
Fnum = 20;
p = 0.8;
maxgen = 500;
beta = 1.5;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(Fnum,1);
Y = objfunc(X);
[Ymax,Ymaxindex] = max(Y);
Xmax = X(Ymaxindex);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen
    for i = 1 : Fnum
        if rand > p
            nextX = X(i) + levyrand(beta) * (X(i) - Xmax);
            if nextX < lb
                nextX = lb;
            end
            if nextX > ub
                nextX = ub;
            end
        else
            leftFlowerindex = setdiff(1:Fnum,i);
            leftFlower = X(leftFlowerindex,:);
            index = randi(length(leftFlowerindex),2,1);
            Xj = leftFlower(index(1),:);
            Xk = leftFlower(index(2),:);
            nextX = X(i) + rand*(Xj - Xk);
            if nextX < lb
                nextX = lb;
            end
            if nextX > ub
                nextX = ub;
            end
        end
        nextY = objfunc(nextX);
        if nextY > Y(i)
            Y(i) = nextY;
            X(i) = nextX;
        end
        if nextY > Ymax
            Ymax = nextY;
            Xmax = nextX;
        end
    end
    h.XData = X;
    h.YData = Y;
    pause(0.01);
end

fprintf('最佳位置：%f\r\n最佳函数值：%f\n',Xmax,Ymax)
