%% 精英蚂蚁
clear
close
clc
n = 10;  % 城市数量
m = 30;  % 蚂蚁数量
alfa = 1.5;
beta = 2.5;
rho = 0.1;
Q = 1000;
e = 100;
maxgen = 200;
x = [2 14 9 6 3 2 4 8 12 5]';
y = [8 9 12 4 1 2 5 8 1 15]';
City = [x,y];

%% 城市之间的相互距离
for i = 1:n
    D(i,:) = ((City(i,1) - City(:,1)).^2 + (City(i,2) - City(:,2)).^2).^0.5 + eps;
end

eta = 1./D;   
tau = ones(n); 
path = zeros(m,n); 

for iter = 1: maxgen
    %% 放置蚂蚁
    path(:,1) = randi([1 n],m,1);
    %% 蚂蚁开始环游剩下的城市
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
            % 按轮盘赌的方式随机选择
            P = cumsum(Pk);
            r = rand;
            index = find(P >= r);
            nextcity = leftcity(index(1));
            path(j,i) = nextcity;
        end
    end
    path = horzcat(path,path(:,1));
    

    % 更新信息素，路径表清零
    if iter >= 2
        path(1,:) = Pathbest(iter-1,:);
    end
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
    eantnum = length(find(L == min(L)));
    eroute = Pathbest(iter,:); 
    
    % 更新信息素

    detatau = zeros(n);
    for i = 1 : m
        for j = 1 : n
            detatau(path(i,j),path(i,j + 1)) = detatau(path(i,j),path(i,j + 1)) + Q/L(i);
            detatau(path(i,j + 1),path(i,j)) = detatau(path(i,j),path(i,j + 1));
        end
    end
    %% 精英蚂蚁路径信息素增量
    for j=1:n
        detatau(eroute(1,j),eroute(1,j+1))= detatau(eroute(1,j),eroute(1,j+1)) + e/Lbest(iter);
        detatau(eroute(1,j + 1),eroute(1,j)) = detatau(eroute(1,j),eroute(1,j+1));
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

subplot(1,2,2)
plot(Lbest)
hold on 
title('最短距离')

