%% GSA 万有引力
close
clear
clc

N = 100;
maxgen = 1000;
G0 = 150;
alfa = 20;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(N,1);
Y = objfunc(X);

[bestY,bestYindex] = max(Y);
[worstY,worstYindex] = min(Y);   
v = zeros(N,1);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen
    if bestY == worstY
        M = ones(N,1);
    else
        m = (Y - worstY)/(bestY - worstY);
        M = m ./ sum(m);
    end
    G=G0*exp(-alfa*iter/maxgen);
    % 计算合力
    a = zeros(N,1);
    for i = 1 : N
        tempX = X;
        tempM = M;
        tempX(i) = [];
        tempM(i) = [];
        R = sqrt((tempX - X(i)).^2);
        f = G * tempM ./ (R + 1e-15) .* (tempX - X(i)); % 求加速度要除以M(i)，次数不乘，下面不除
        F = sum(rand(N - 1,1).*f);
        a(i) = F ;
    end
    v = rand(N,1) .* v + a;
    X = X + v;
    for k = 1 : N
        if X(k) < lb
            X(k) = lb + (ub - lb)*rand;
        end
        if X(k) > ub
            X(k) = lb + (ub - lb)*rand;
        end
    end
    Y = objfunc(X);
    h.XData = X;
    h.YData = Y;
    pause(0.001);
    [bestY,bestYindex] = max(Y);
    [worstY,worstYindex] = min(Y);
end

