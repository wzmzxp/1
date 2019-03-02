%% CS 布谷鸟算法
clear
close
clc
nestnum = 15;
Pa = 0.25;
alfa = 0.01;
beta = 1.5;
lb = -pi;
ub = pi;
maxgen = 500;

nest = lb + (ub - lb)*rand(nestnum,1);
fval = objfunc(nest);

[fbest,fbestindex]  = max(fval);
bestnest = nest(fbestindex);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(nest,fval,'*');
% 记录全局极值
fmax = fbest;
nestmax = bestnest;

for iter = 1 : maxgen
    for i = 1 : nestnum
        s = nest(i);
        newnest = s + alfa*(s - bestnest)*levyrand(beta)*randn; % 这里是一个变量，若是多个变量就要产生多个levy随机数和多个randn随机数然后对应相乘
        if newnest < lb
            newnest = lb;
        end
        if newnest > ub
            newnest = ub;
        end
        fnew = objfunc(newnest);
        if fnew > fval(i)
            fval(i) = fnew;
            nest(i) = newnest;
        end
    end
    
    for i = 1 : nestnum
        if rand < Pa
            si = nest(i);
            leftnestindex = setdiff(1:nestnum,i);
            leftnest = nest(leftnestindex,:);
            index = randi(length(leftnestindex),2,1);
            sj = leftnest(index(1),:);
            sk = leftnest(index(2),:);
            newnest = si + (sj - sk)*rand;
            if newnest < lb
                newnest = lb;
            end
            if newnest > ub
                newnest = ub;
            end
            fnew = objfunc(newnest);
            if fnew > fval(i)
                fval(i) = fnew;
                nest(i) = newnest;
            end
        end
    end
    [fbest,fbestindex]  = max(fval);
    bestnest = nest(fbestindex);
    
    h.XData = nest;
    h.YData = fval;
    pause(0.02);
    if fbest > fmax
        fmax = fbest;
        nestmax = bestnest;
    end   
end


fprintf('最佳位置：%f\r最佳函数值：%f\r',nestmax,fmax)

