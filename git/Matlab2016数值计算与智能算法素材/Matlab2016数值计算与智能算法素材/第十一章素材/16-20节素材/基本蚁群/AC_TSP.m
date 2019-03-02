%% 基本蚁群算法
clear
close
clc
n = 10;  % 城市数量
m = 100;  % 蚂蚁数量
alfa = 1.5;
beta = 2.5;
rho = 0.1;
Q = 1000;
maxgen = 50;
x = [2 14 9 6 3 2 4 8 12 5]';
y = [8 9 12 4 1 2 5 8 1 15]';
% x = [37,49,52,20,40,21,17,31,52,51,42,31,5,12,36,52,27,17,13,57,62,42,16,8,7,27,30,43,58,58,37,38,46,61,62,63,32,45,59,5,10,21,5,30,39,32,25,25,48,56,30]';
% y = [52,49,64,26,30,47,63,62,33,21,41,32,25,42,16,41,23,33,13,58,42,57,57,52,38,68,48,67,48,27,69,46,10,33,63,69,22,35,15,6,17,10,64,15,10,39,32,55,28,37,40]';
City = [x,y]; % 城市坐标

%% 城市之间的相互距离
for i = 1:n
    D(i,:) = ((City(i,1) - City(:,1)).^2 + (City(i,2) - City(:,2)).^2).^0.5 + eps;
end

eta = 1./D;    % 启发因子
tau = ones(n); % 信息素矩阵
path = zeros(m,n); % 记录路径

for iter = 1: maxgen
    %% 放置蚂蚁初始位置
    path(:,1) = randi([1 n],m,1);                                 
    for i = 2 : n
        for j = 1 : m
            visited = path(j,1:i-1);
            leftcity = setdiff(1:n,visited);
            %% 计算去剩下的城市的概率
            P = zeros(1,length(leftcity));
            for k = 1:length(leftcity)
                P(k) = tau(visited(end),leftcity(k))^alfa*eta(visited(end),leftcity(k))^beta;%公式的分子
            end
            P1 = sum(P);
            Pk = P / P1; 

            P = cumsum(Pk);
            r = rand;
            index = find(P >= r);
            nextcity = leftcity(index(1));
            path(j,i) = nextcity;
        end
    end
    %% 判断是否有重复城市
    for flag = 1:m
        if length(unique(path(flag,:))) ~= n  % 查找唯一元素的个数是不是等于城市数量
            keyboard;
        end
    end

    %更新信息素，路径表清零
    if iter >= 2
        path(1,:) = Pathbest(iter-1,:); 
    end
    %计算距离
    for i = 1 : m
        node = path(i,:); 
        d = 0;
        for j = 1 : n - 1 
            d = d + D(node(j),node(j + 1));
        end
        L(i) = d; 
    end
    [shortroute,antindex] = min(L); 
    Lbest(iter) = shortroute; 
    Pathbest(iter,:) = path(antindex,:);
    
    % 更新信息素
    detatau = zeros(n);
    for i = 1 : m
        for j = 1 : n-1
            detatau(path(i,j),path(i,j + 1)) = detatau(path(i,j),path(i,j + 1)) + Q/L(i);
            %矩阵对称一下
            detatau(path(i,j + 1),path(i,j))=detatau(path(i,j),path(i,j + 1));
        end
        %构成回路，起点和终点
        detatau(path(i,n),path(i,1)) = detatau(path(i,n),path(i,1)) + Q/L(i);
        detatau(path(i,1),path(i,n))=detatau(path(i,n),path(i,1));
    end
    tau = (1 - rho)*tau + detatau;
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

