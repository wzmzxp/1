%% 粒子群 PSO   随机权重
clear
clc

%% 预设参数
n = 100; %粒子数量
d = 2; %变量个数
c1 = 2;
c2 = 2;
K = 50;
wmax = 0.8;
wmin = 0.5;
delta = 0.5;

%% 分布粒子
x = -10 + 20*rand(n,d);
v = -5 + 10*rand(n,d);

%% 计算适应度
fit = zeros(n,1);
for j = 1:n
    fit(j) = demo_11_1_2(x(j,:));
end
pbest = x;
ind = find(min(fit) == fit);
gbest = x(ind,:);

%% 更新速度与位置
for i = 1:K
    % 更新速度与位置
    for m = 1:n
        miu = wmin + (wmax - wmin)*rand;
        w = miu + delta*randn;
        
        v(m,:) = w*v(m,:) + c1*rand*(pbest(m,:) - x(m,:)) + c2*rand*(gbest - x(m,:));
        
        v(m,find(v(m,:) < -10)) = -10;
        v(m,find(v(m,:) > 10)) =  10;
        
        x(m,:) = x(m,:) + 0.5*v(m,:);
        x(m,find(x(m,:) < -10)) = -15;
        x(m,find(x(m,:) > 10)) = 15;
    end
    for m = 1:n
        % 重新计算适应度
        fit(m) = demo_11_1_2(x(m,:));
        if fit(m) < demo_11_1_2(pbest(m,:))
            pbest(m,:) = x(m,:);
        end
        if  demo_11_1_2(pbest(m,:)) < demo_11_1_2(gbest)
            gbest = pbest(m,:)
        end
    end
    gbestfitness(i) = demo_11_1_2(gbest);
end

plot(gbestfitness);
xlabel('迭代次数')
ylabel('适应度值')
title('迭代优化过程')

