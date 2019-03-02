%% GSA 万有引力
close
clear
clc

N = 200;
maxgen = 1000;
G0 = 100;
alfa = 20;
final_per = 5;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(N,1);
Y = objfunc(X);
[Y,Yindex] = sort(Y,'descend');
X = X(Yindex);
[bestY,bestYindex] = max(Y);
[worstY,worstYindex] = min(Y);   
v = zeros(N,1);

plotx = linspace(-pi,pi,200);
ploty = fun(plotx);
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
    kbest = final_per+(1-iter/maxgen)*(100-final_per); %kbest in eq. 21.
    kbest = max(12,round(N*kbest/100));
    G=G0*exp(-alfa*iter/maxgen);
    % 计算合力
    a = zeros(N,1);
    for i = 1 : N
        tempX = X;
        tempM = M;
        tempX(i) = [];
        tempM(i) = [];
        tempX = tempX(1:kbest - 1);
        tempM = tempM(1:kbest - 1);
        R = sqrt((tempX - X(i)).^2);
        f = G * tempM ./ (R + 1e-15) .* (tempX - X(i)); % 求加速度要除以M(i)，次数不乘，下面不除
        F = sum(rand(kbest - 1,1).*f);
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
    ploty = fun(X);
    h.XData = X;
    h.YData = ploty;
    pause(0.001);
    [Y,Yindex] = sort(Y,'descend');
    X = X(Yindex);
    [bestY,bestYindex] = max(Y);
    [worstY,worstYindex] = min(Y);
end

