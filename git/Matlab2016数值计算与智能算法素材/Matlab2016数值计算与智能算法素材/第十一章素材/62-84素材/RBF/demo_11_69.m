% RBF神经网络工具箱函数
% net = newrb(P,T,goal,spread,MN,DF)
%% 曲线逼近
close
clear
clc
addpath(genpath(pwd))
% addpath('图片;New Folder;New Folder (2);')
x = 0 : 0.5 : 2*pi;
y = sin(x);
P = x;
T = y;
% 变换扩展常数
eps = 0;
MaxNum = length(x);
Display = 1;
for spread = 0.01 : 0.1 : 1.5
    net = newrb(P,T,eps,spread,MaxNum,Display); % 扩展常数使用默认
    x1 = 0 : 0.1 : 2*pi;
    y1 = net(x1);
    y2 = sin(x1);
    plot(x,y,'o',x1,y1,x1,y2)
    legend('原始点','逼近曲线','理论曲线')
    name = ['图片/','spread_',num2str(spread),'.jpg'];
    saveas (gcf,name)
end
%% 分类
close
clear
clc
rng(5)
data = xlsread('花.xlsx','B2:F151');
data1 = data(1:50,:); %第一类数据
data2 = data(51:100,:); %第二类数据
data3 = data(101:150,:); %第三类数据

flower1 = data1(:,1:4);
T1 = [zeros(50,2),ones(50,1)]; % 001代表1

flower2 = data2(:,1:4);
T2 = [zeros(50,1),ones(50,1),zeros(50,1)]; % 010代表2

flower3 = data3(:,1:4);
T3 = [ones(50,1),zeros(50,1),zeros(50,1)]; % 100代表3

% 划分训练集、测试集
tempindex = randperm(50);
P_1 = flower1(tempindex(1:40),:); % 训练集
T_1 = T1(tempindex(1:40),:); % 训练集
P_test1 = flower1(tempindex(41:50),:); % 测试集
T_test1 = T1(tempindex(41:50),:); % 测试集

tempindex = randperm(50);
P_2 = flower2(tempindex(1:40),:);
T_2 = T2(tempindex(1:40),:);
P_test2 = flower2(tempindex(41:50),:);
T_test2 = T2(tempindex(41:50),:);

tempindex = randperm(50);
P_3 = flower3(tempindex(1:40),:);
T_3 = T3(tempindex(1:40),:);
P_test3 = flower3(tempindex(41:50),:);
T_test3 = T3(tempindex(41:50),:);

P = [P_1',P_2',P_3'];
T = [T_1',T_2',T_3'];
P_test = [P_test1',P_test2',P_test3'];
T_test = [T_test1',T_test2',T_test3'];

eps = 0;
MaxNum = 50;
Display = 1;
spread = 1;
net = newrb(P,T,eps,spread,MaxNum,Display);
% 验证训练误差
T1 = net(P) > 0.5;
for i = 1 : 120
    result(i) = isequal(T1(:,i),logical(T(:,i)));
end
% 验证测试数据
T_sim = net(P_test) > 0.5;
for i = 1 : 30
    result1(i) = isequal(T_sim(:,i),logical(T_test(:,i)));
end