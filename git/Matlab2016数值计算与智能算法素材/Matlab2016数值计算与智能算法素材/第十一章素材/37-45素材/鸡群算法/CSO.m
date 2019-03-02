%% CSO 鸡群算法
%% 求解极小值，求极大值需要做相应变换
clear
close
clc
tic
chickennum = 100;
roosternum = 20;
hennum = 60;
chicknum = 20;
motherhennum = 7;
maxgen = 100;
Gen = 10;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(chickennum,1);
fitnessval = fitness(X);

%% 画图
Y = objfunc(X);
plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen
    nextrooster = zeros(roosternum,1);
    nextroosterfval = zeros(roosternum,1);
    nexthen = zeros(hennum,1);
    nexthenfval = zeros(hennum,1);
    nextchick = zeros(chicknum,1);
    nextchickfval = zeros(chicknum,1);
    if mod(iter,Gen) == 1
        %% 分配鸡群
        [fitnessval,fitnessvalindex] = sort(fitnessval);
        X = X(fitnessvalindex);
        
        rooster = X(1:roosternum);
        roosterfval = fitnessval(1:roosternum);
        hen = X(roosternum + 1 : hennum + roosternum);
        henfval = fitnessval(roosternum + 1 : hennum + roosternum);
        mateindex = randi(roosternum,hennum,1);
        henmate = X(randi(roosternum,hennum,1));
        henmatefval = fitnessval(randi(roosternum,hennum,1));
        chick = X(roosternum + hennum +1 : end);
        chickfval = fitnessval(roosternum + hennum +1 : end);
        motherindex = randi([roosternum + 1 , hennum + roosternum],motherhennum,1);
        motherhen = X(motherindex);
        motherhenfval = fitnessval(motherindex);
        chickFollowMother = X(motherindex(randi(motherhennum,chicknum,1)));
        chickFollowMotherfval = fitnessval(motherindex(randi(motherhennum,chicknum,1)));
    end
    %% 公鸡更新
    for i = 1 : roosternum
        roosterKindex = setdiff(1:roosternum,i);
        tempindex = randperm(length(roosterKindex));
        roosterK = rooster(roosterKindex(tempindex(1)));
        roosterKfval = roosterfval(roosterKindex(tempindex(1)));
        if roosterfval(i) <= roosterKfval
            sigma = 1;
        else
            sigma = exp((roosterKfval - roosterfval(i))/(abs(roosterfval(i)) + 1e-20));
        end
        nextrooster(i) = rooster(i) * (1 + sigma*randn);
        if nextrooster(i) < lb
            nextrooster(i) = lb;
        end
        if nextrooster(i) > ub
            nextrooster(i) = ub;
        end
        nextroosterfval(i) = fitness(nextrooster(i));
    end
    %% 母鸡更新
    for i = 1 : hennum
        xi = hen(i);
        fi = henfval(i);
        fr1 = henmatefval(i);
        xr1 = henmate(i);
        fr2index = setdiff(1:roosternum + i -1,mateindex(i));
        tempindex = randperm(length(fr2index));
        fr2 = fitnessval(fr2index(tempindex(1)));
        xr2 = X(fr2index(tempindex(1)));
        
        C1 = exp((fi-fr1)/(abs(fi)) + 1e-50);
        C2 = exp(fr2 - fi);
        nexthen(i) = xi + C1*rand*(xr1 - xi) + C2*rand*(xr2 - xi);
        if nexthen(i) < lb
            nexthen(i) = lb;
        end
        if nexthen(i) > ub
            nexthen(i) = ub;
        end
        nexthenfval(i) = fitness(nexthen(i));
    end
    %% 小鸡更新
    for i = 1 : chicknum
        FL = rand*0.6 + 0.4;
        nextchick(i) = chick(i) + FL*(chickFollowMother(i) - chick(i));
        if nextchick(i) < lb
            nextchick(i) = lb;
        end
        if nextchick(i) > ub
            nextchick(i) = ub;
        end
        nextchickfval(i) = fitness(nextchick(i));
    end
    
    for i = 1 : roosternum
        if nextroosterfval(i) < roosterfval(i)
            rooster(i) = nextrooster(i);
            roosterfval(i) = roosterfval(i);
        end
    end
    for i = 1 : hennum
        if nexthenfval(i) < henfval(i)
            hen(i) = nexthen(i);
            henfval(i) = nexthenfval(i);
        end
    end
    for i = 1 : chicknum
        if nextchickfval(i) < chickfval(i)
            chick(i) = nextchick(i);
            chickfval(i) = nextchickfval(i);
        end
    end
    X = [rooster;hen;chick];
    fitnessval = [roosterfval;henfval;chickfval];
    Y = objfunc(X);
    h.XData = X;
    h.YData = Y;
    pause(0.05)
end
[minfitness,minfitnessindex] = min(fitnessval);
minX = X(minfitnessindex);
minY = objfunc(minX);

fprintf('最佳位置：%f\r\n最佳函数值：%f\r\n',minX,minY);
toc