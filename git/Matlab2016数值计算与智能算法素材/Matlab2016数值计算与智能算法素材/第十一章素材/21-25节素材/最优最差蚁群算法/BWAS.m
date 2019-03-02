function shortestdistance = BWAS()
%% 蚁群系统
clear
close
clc
n = 10;  % 城市数量
m = 30;  % 蚂蚁数量
alfa = 1.5;
beta = 2.5;
rho = 0.05;
P0 = 0.9; % 概率选择阈值
epsilon = 0.0001;
maxgen = 50;
x = [2 14 9 6 3 2 4 8 12 5]';
y = [8 9 12 4 1 2 5 8 1 15]';
City = [x,y]; % 城市坐标

%% 城市之间的相互距离
for i = 1:n
    D(i,:) = ((City(i,1) - City(:,1)).^2 + (City(i,2) - City(:,2)).^2).^0.5 + eps;
end

%% 从某一城市出发由最近邻构造距离
Lnn = 0;
visitedcity = 5;
for i = 1 : n - 1
    leftnode = setdiff(1:10,visitedcity);
    [d,location] = min(D(visitedcity(end),leftnode));
    visitedcity = [visitedcity ,leftnode(location)];
    Lnn = Lnn + d;
end

eta = 1./D;    % 启发因子
tau = 1./(ones(n)*(n*Lnn)); % 信息素矩阵
path = zeros(m,n); % 记录路径

for iter = 1: maxgen
    %% 放置蚂蚁
    path(:,1) = randi([1 n],m,1); % 从第一个城市到第10(n)个城市随机生成一个，一共生成m个，m是蚂蚁数量
                                  % 这样就把m只蚂蚁放在了n个城市里
    %% 蚂蚁开始环游剩下的城市
    for i = 2 : n
        for j = 1 : m
            visited = path(j,1:i-1);% 第j只蚂蚁已经到过前 i-1个城市了
            leftcity = setdiff(1:n,visited);%求差集，1：n是每个城市，visited是到过的城市，减去到过的城市就是剩下的城市
            r = rand;
            if r < P0  % 先验知识
                temp = tau(visited(end),leftcity).^alfa .* eta(visited(end),leftcity).^beta;
                [~,nextcityindex] = max(temp);
                 nextcity = leftcity(nextcityindex(1));
            else   
              %% 计算去剩下的城市的概率
                P = zeros(1,length(leftcity));
                for k = 1:length(leftcity)
                    P(k) = tau(visited(end),leftcity(k))^alfa*eta(visited(end),leftcity(k))^beta;%公式的分子
                end
                P1 = sum(P); %公式的分母
                Pk = P / P1; %公式
                % 按轮盘赌的方式随机选择
                P = cumsum(Pk);
                index = find(P >= r);
                nextcity = leftcity(index(1));
            end
            path(j,i) = nextcity;%第j只蚂蚁的下一个城市
            % 局部规则更新
            tau(visited(end),nextcity) = (1-rho)*tau(visited(end),nextcity) + rho*(n*Lnn)^(-1);
            tau(nextcity,visited(end)) = tau(visited(end),nextcity);
        end
    end
    path = horzcat(path,path(:,1));
    % 至此，所有蚂蚁访问完所有城市
    % 接下来要计算距离，更新信息素，路径表清零
%     if iter >= 2
%         path(1,:) = Pathbest(iter-1,:); % 保证上一代的最佳路线不丢
%     end
    
    for i = 1 : m
        node = path(i,:); % 第i只蚂蚁走过的城市节点
        d = 0;
        for j = 1 : n  % 计算第i只蚂蚁走过路的总长度
            d = d + D(node(j),node(j + 1));
        end
        L(i) = d; % 所有蚂蚁走过路的长度
    end
    [longroute,badindex] = max(L);
    longpath = path(badindex,:);
    [shortroute,antindex] = min(L); % 这一只蚂蚁最好
    Lbest(iter) = shortroute; %这一代蚂蚁里面走的最好的路
    Pathbest(iter,:) = path(antindex,:);%最好的路是哪一条
    eroute=Pathbest(iter,:); % 当前最优路径，也可以使用全局最优路径
    % 更新信息素
    % 首先计算每一对城市之间的信息素增量
    detatau = zeros(n);

    for j = 1 : n
        detatau(eroute(1,j),eroute(1,j + 1)) = detatau(eroute(1,j),eroute(1,j + 1)) + 1/L(i);
        detatau(eroute(1,j + 1),eroute(1,j))=detatau(eroute(1,j),eroute(1,j + 1));
    end
    tau = (1 - rho)*tau + detatau;
    
    % 对最差蚂蚁路径进行信息素更新
    % 判断哪一条路径不属于最优路径当中的路径
    temp = {};
    for i = 1 : 10
        temp = [temp,{strcat(num2str(eroute(i)),num2str(eroute(i+1)))}];
    end
    
    for i = 1 : 10
        temp1 = {strcat(num2str(longpath(i)),num2str(longpath(i+1)))};
        temp2 = {strcat(num2str(longpath(i + 1)),num2str(longpath(i)))};
        [~,location1] = find(ismember(temp,temp1));%如果location1是空的，说明temp1不是temp的成员，意味着当前路径不是最优路径一部分
        [~,location2] = find(ismember(temp,temp2));
        if isempty(location1)&&isempty(location2)
            tau(longpath(1,i),longpath(1,i+1)) = (1-rho)* tau(longpath(1,i),longpath(1,i+1)) - epsilon*longroute/shortroute;
            tau(longpath(1,i + 1),longpath(1,i)) = tau(longpath(1,i),longpath(1,i+1));
        end
    end
    
    path = zeros(m,n);
end

index = find(Lbest == min(Lbest));
shortestpath = Pathbest(index(1),:);
shortestdistance = Lbest(index(1))

subplot(1,2,1)

plot(x,y,'o')
hold on
for i = 1 : n - 1
    firstcity = shortestpath(i);
    nextcity = shortestpath(i + 1);
    plot([x(firstcity),x(nextcity)],[y(firstcity),y(nextcity)],'b');
end
firstcity = shortestpath(n);
nextcity = shortestpath(1);
plot([x(firstcity),x(nextcity)],[y(firstcity),y(nextcity)],'b');
axis equal
axis([0 18 0 18])

subplot(1,2,2)
plot(Lbest)
hold on 
title('最短距离')

