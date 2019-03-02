function shortestdistance = ACS()
%% 蚁群系统
clear
close
clc
n = 10;  % 城市数量
m = 50;  % 蚂蚁数量
alfa = 1.5;
beta = 2.5;
rho = 0.05;
P0 = 0.9; % 概率选择阈值
maxgen = 100;
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

eta = 1./D;  
tau = 1./(ones(n)*(n*Lnn));
path = zeros(m,n);

for iter = 1: maxgen
    %% 放置蚂蚁
    path(:,1) = randi([1 n],m,1);
    %% 蚂蚁开始环游剩下的城市
    for i = 2 : n
        for j = 1 : m
            visited = path(j,1:i-1);
            leftcity = setdiff(1:n,visited);
            r = rand;
            if r < P0  
                temp = tau(visited(end),leftcity).^alfa .* eta(visited(end),leftcity).^beta;
                [~,nextcityindex] = max(temp);
                 nextcity = leftcity(nextcityindex(1));
            else   

                P = zeros(1,length(leftcity));
                for k = 1:length(leftcity)
                    P(k) = tau(visited(end),leftcity(k))^alfa*eta(visited(end),leftcity(k))^beta;%公式的分子
                end
                P1 = sum(P);
                Pk = P / P1; 
             
                P = cumsum(Pk);
                index = find(P >= r);
                nextcity = leftcity(index(1));
            end
            path(j,i) = nextcity;

            tau(visited(end),nextcity) = (1-rho)*tau(visited(end),nextcity) + rho*(n*Lnn)^(-1);
            tau(nextcity,visited(end)) = tau(visited(end),nextcity);
        end
    end
    path = horzcat(path,path(:,1));
   
    % 更新信息素，路径表清零
%     if iter >= 2
%         path(1,:) = Pathbest(iter-1,:); % 保证上一代的最佳路线不丢
%     end
    
    for i = 1 : m
        node = path(i,:);
        d = 0;
        for j = 1 : n  
            d = d + D(node(j),node(j + 1));
        end
        L(i) = d; 
    end
    [shortroute,antindex] = min(L); 
    Lbest(iter) = shortroute; 
    Pathbest(iter,:) = path(antindex,:);
    eroute=Pathbest(iter,:); 
    % 更新信息素

    detatau = zeros(n);

    for j = 1 : n
        detatau(eroute(1,j),eroute(1,j + 1)) = detatau(eroute(1,j),eroute(1,j + 1)) + 1/L(i);
        detatau(eroute(1,j + 1),eroute(1,j))=detatau(eroute(1,j),eroute(1,j + 1));
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

