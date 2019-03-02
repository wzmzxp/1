%% 人工鱼群算法
close
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fishnum = 100;
trynum = 50;
vision = 1;
step = 0.5;
deta = 0.5;
maxgen = 50;
C = 2;
alfa = 0.5;
lb = -pi;
ub = pi;


%% 放置鱼群
X = lb + (ub - lb)*rand(fishnum,1);
Y = foodconsistence(X);

% 绘图
x = linspace(-pi,pi,100);
y = 11*sin(6*x) + 7*cos(5*x);
h = plot(x,y,X,Y,'*');

[bulletin,bestindex] = max(Y); % 公告牌记录初始最大值
bestX = X(bestindex,:);

for iter = 1 : maxgen
    for i = 1 : fishnum
        % 首先执行追尾行为，追尾不成，觅食
        [X1,Y1] = follow(X,i,vision,deta,lb,ub);
        % 然后执行聚群行为，聚群不成，觅食
        [X2,Y2] = swarm(X,i,vision,deta,lb,ub);
        Xi = X(i,:);
        Yi = foodconsistence(Xi);
        [X3,Y3] = prey(Xi,Yi,vision,trynum,lb,ub,alfa,C,iter);
        tempY = [Yi,Y1,Y2,Y3];
        tempX = [Xi;X1;X2;X3];
        [~,index] = max(tempY);
        X(i,:) = tempX(index);
        if foodconsistence(X(i,:)) > bulletin
            bulletin = foodconsistence(X(i,:));
            bestX = X(i,:);
        end
        % 然后执行觅食行为，觅食不成，随机，觅食与随机可能超过范围，判断边界
        % 判断是不是优化了，没有优化，随机行为
        % 更新公告板
    end
    iterbestY = max(foodconsistence(X));
    interbestvalue(iter) = iterbestY;
    pause(0.1)
    h(2).XData = X;
    h(2).YData = foodconsistence(X);
end

fprintf('最佳位置：%f\r最佳函数值：%f\r',bestX,bulletin)
