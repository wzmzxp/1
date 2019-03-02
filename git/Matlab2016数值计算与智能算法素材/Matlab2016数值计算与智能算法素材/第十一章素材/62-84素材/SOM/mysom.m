%% 
clear
close all
clc
%% 样本数据
x0 = [4.1,1.8,0.5,2.9,4.0,0.6,3.8,4.3,3.2,1.0,3.0,3.6,3.8,3.7,3.7,8.6,9.1,...
      7.5,8.1,9.0,6.9,8.6,8.5,9.6,10.0,9.3,6.9,6.4,6.7,8.7;...
      8.1,5.8,8.0,5.2,7.1,7.3,8.1,6.0,7.2,8.3,7.4,7.8,7.0,6.4,8.0,...
      3.5,2.9,3.8,3.9,2.6,4.0,2.9,3.2,4.9,3.5,3.3,5.5,5.0,4.4,4.3];

%数据归一化
[x,~] = mapminmax(x0);
% 构建2×2网络  排列方式是  1   3
%                          2   4
m = 2; % 2行
n = 2; % 2列
Nnum = m * n; % 输出层神经元节点数
w = rand(2,Nnum); % 输入层神经元是2个，所以权值矩阵是 2 × 4 每一列对应一个输出层神经元
Lr_max = 0.8;
Lr_min = 0.05;
Nbor_max = 3;
Nbor_min = 0.5;
[row,col] = ind2sub([m, n], 1 : Nnum); % 神经元位置
maxgen = 2000;
for iter = 1 : maxgen
    % 计算此次学习率与邻域半径
    Lr = Lr_max - (Lr_max - Lr_min) * iter / maxgen;
    Nbor = Nbor_max - (Nbor_max - Nbor_min) * iter / maxgen;
    % 随机选取一个样本
    index = randi(30);
    sx = x(:,index); % 选择的x
    % 计算与那个节点的连接权值最接近
    d = zeros(Nnum,1);
    for i = 1 : Nnum
        d(i) = sqrt(sum((sx - w(:,i)).^2));
    end
    mindindex = find(d == min(d));
    center = zeros(1,2);
    center = [row(mindindex(1)) col(mindindex(1))];
    for i = 1 : Nnum
        Nd = sqrt(sum((center - [row(i) col(i)]).^2));
        if Nd < Nbor
            w(:,i) = w(:,i) + Lr * (sx - w(:,i));
        end
    end
end

for i = 1 : 30
    for j = 1 : Nnum
        d(j) = sqrt(sum((x(:,i) - w(:,j)).^2));
    end
    temp = find(d == min(d));
    ind(i) = temp(1);
end
plot(x(1,ind == 1),x(2,ind == 1),'o')
hold on
plot(x(1,ind == 2),x(2,ind == 2),'*')
plot(x(1,ind == 3),x(2,ind == 3),'^')
plot(x(1,ind == 4),x(2,ind == 4),'>')
plot(w(1,:),w(2,:),'pk')
legend('第一类','第二类','第三类','第四类','聚类中心')




