%%  GSO 萤火虫算法
clear
close
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
glowwormnum = 12;
L0 = 5; %初始荧光素大小
rs = 7; % 最大感知半径
rho = 0.4; % 荧光素挥发系数
gama = 0.6; %荧光素更新率
beta = 0.1; % 感知半径变化系数
s = 0.03; % 步长
nt = 5; % 感知范围内限定的优秀个体数
maxgen = 500;
lb = -pi;
ub = pi;

%% 初始化
Li = ones(glowwormnum,1)*L0; %初始化每只萤火虫荧光素
rdi = ones(glowwormnum,1)*rs;

X = lb + (ub - lb)*rand(glowwormnum,1);
Y = objfunc(X);
[bestY,bestYindex] = max(Y);
bestX = X(bestYindex);

%% 绘图
plotx = linspace(-pi,pi,400);
ploty = objfunc(plotx);
plot(plotx,ploty)
hold on
h = plot(X,Y,'*');


for iter = 1 : maxgen
    %% 更新荧光素
    Li = (1-rho)*Li + gama*Y;
    for i = 1 : glowwormnum
        %% 判断每一只 萤火虫的决策范围内符合要求的萤火虫
        dist = sqrt((X - X(i)).^2);
        Rindex = setdiff(find(dist < rdi(i)),i); %能看见的萤火虫的索引值
        if isempty(Rindex)
            rdi(i)=min(rs,max(0,rdi(i)+beta*(nt)));
            continue;
        end
        index = Rindex( Li(Rindex) > Li(i) ); % 比自己好的视野范围内的索引值
        if isempty(index)
            rdi(i)=min(rs,max(0,rdi(i)+beta*(nt)));
            continue;
        end
        Betterglowworm =X(index); % 比自己好的萤火虫
        sumNit = sum(Li(index));
        Lj = Li(index);
        p = (Lj - Li(i)) / (sumNit - Li(i));
        P = cumsum(p./sum(p));
        Pindex = find(P > rand);
        neighborGlowworm = X(index(Pindex(1)));
        nextX = X(i) + s*(neighborGlowworm - X(i)) / norm(neighborGlowworm - X(i));
        if nextX < lb
            nextX = lb;
        end
        if nextX > ub
            nextX = ub;
        end
        nextY = objfunc(nextX);
        X(i) = nextX;
        Y(i) = nextY;
        if nextY > bestY
            bestY = nextY;
            bestX = nextX;
        end
        rdi(i)=min(rs,max(0,rdi(i)+beta*(nt-length(Betterglowworm))));
        %% 更新萤火虫位置
    end
    h.XData = X;
    h.YData = Y;
    pause(0.02);
end

fprintf('最优位置：%f\r最优函数值：%f\r',bestX,bestY)

