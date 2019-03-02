%% 人工鱼群算法
close
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fishnum = 100;
trynum = 50;
vision = 1;
step = 0.1;
deta = 0.6;
maxgen = 200;
lb = [0 0];
ub = [20 20];


%% 放置鱼群

X = lb + (ub - lb).*rand(fishnum,2);
Y = foodconsistence(X);

% 绘图
x = 0:0.5:20;
y = 0:0.5:20;
[x,y] = meshgrid(x,y);
z = sin(sqrt((x-10).^2+(y-10).^2))./sqrt((x-10).^2+(y-10).^2);
mesh(x,y,z)
hold on
h = scatter3(X(:,1),X(:,2),Y);
axis vis3d
[bulletin,bestindex] = max(Y); % 公告牌记录初始最大值
bestX = X(bestindex,:);

for iter = 1 : maxgen
    for i = 1 : fishnum
        % 首先执行追尾行为，追尾不成，觅食
        [X1,Y1] = follow(X,i,vision,deta,step,lb,ub);
        % 然后执行聚群行为，聚群不成，觅食
        [X2,Y2] = swarm(X,i,vision,deta,step,lb,ub);
        Xi = X(i,:);
        Yi = foodconsistence(Xi);
        [X3,Y3] = prey(Xi,Yi,vision,step,trynum,lb,ub);
        tempY = [Yi,Y1,Y2,Y3];
        tempX = [Xi;X1;X2;X3];
        [~,index] = max(tempY);
        X(i,:) = tempX(index,:);
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
    pause(0.01)
    h.XData = X(:,1);
    h.YData = X(:,2);
    h.ZData = foodconsistence(X);
end

fprintf('最优位置：%f %f\n',bestX)
fprintf('最优函数值：%f\n',bulletin)



