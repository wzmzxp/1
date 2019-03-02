%% WPA算法
clear
close
clc

%% 初始化参数
wolfnum = 50;
maxgen = 300;
alfa = 4;
Tmax = 30;
omega = 100;
S = 1000;
beta = 10;
lb = -pi;
ub = pi;
stepa = (ub - lb)/S;
stepb = (ub - lb)/S*2;
stepc = (ub - lb)/(S*2);

hmax = 15;
hmin = 2;

%% 初始化狼群
X = lb + (ub - lb)*rand(wolfnum,1);
Y = objfunc(X);
[maxY,maxYindex] = max(Y);
maxX = X(maxYindex);
leadY = maxY;
leadX = maxX;
[Y,Yindex] = sort(Y,'descend');
X = X(Yindex);


plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
hobj = plot(X,Y,'*');


for iter = 1 : maxgen
    %% 游走
    minSnum = ceil(wolfnum / (alfa + 1));
    maxSnum = floor(wolfnum / alfa);
    Snum = randi([minSnum,maxSnum],1,1);
    flag = 0;
    
    for i = 1 : Tmax
        for j = 2 : Snum + 1  %探狼从第二只开始
            h = randi([hmin,hmax]);
            nextx = zeros(h,1);
            nexty = zeros(h,1);
            for k = 1 : h  % 每一只狼游走h次
                nextx(k) = X(j) + sin(2*pi*k/h) * stepa;
                if nextx(k) < lb
                    nextx(k) = lb;
                end
                if nextx(k) > ub
                    nextx(k) = ub;
                end
                nexty(k) = objfunc(nextx(k));
            end
            [bestnexty,bestnextyindex] = max(nexty);
            bestnextx = nextx(bestnextyindex);
            if bestnexty > Y(j)
                Y(j) = bestnexty;
                X(j) = bestnextx;
            end
            if bestnexty > leadY
                leadY = bestnexty;
                leadX = bestnextx;
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
    
    %% 召唤
    for i = Snum + 1 + 1 : wolfnum
        while 1
            Mnextx = X(i) + stepb * (leadX - X(i))/(abs(leadX - X(i)));
            if Mnextx < lb
                Mnextx = lb;
            end
            if Mnextx > ub
                Mnextx = ub;
            end
            Mnexty = objfunc(Mnextx);
            X(i) = Mnextx;
            Y(i) = Mnexty;
            dis = abs(Mnextx - leadX);
            dnear = 1/omega * (ub - lb);
            if Mnexty > leadY
                leadY = Mnexty;
                leadX = Mnextx;
                break;
            elseif dis < dnear
                Gnextx = X(i) + (2*rand -1)* stepc * abs((leadX - X(i)));
                if Gnextx < lb
                    Gnextx = lb;
                end
                if Gnextx > ub
                    Gnextx = ub;
                end
                Gnexty = objfunc(Gnextx);
                if Gnexty > Y(i)
                    Y(i) = Gnexty;
                    X(i) = Gnextx;
                end
            end
            break;
        end
    end
    hobj.XData = X;
    hobj.YData = Y;
    pause(0.02)
    [Y,Yindex] = sort(Y,'descend');
    X = X(Yindex);
    R = randi([floor(wolfnum/(2*beta)),floor(wolfnum/(beta))]);
    index = wolfnum:-1:wolfnum - R + 1;
    X(index) = lb + (ub - lb)*rand(length(index),1);
    Y(index) = objfunc(X(index));
    leadX = X(1);
    leadY = Y(1);
end


