%%  正则RBF神经网络解决异或问题示例
clear
close
clc
P =[0 0; 1 1;0 1;1 0]
T = [0 0 1 1]'

%% 隐含层有4个节点，每个节点的径向基函数采用高斯函数，并且每个中心都是自己的输入数据
% 计算距离矩阵
for i = 1 : 4  %第一行存储第一个输入向量与径向基函数各中心的距离
    for j = 1 : 4
        d(i,j) = sqrt(sum((P(i,:) - P(j,:)).^2));
    end
end
% 计算插值矩阵，将距离带入高斯基函数
FAI = radbas(d)
W = inv(FAI)*T
% 计算实际输出
T1 = FAI * W

%% 迭代调整
clear
close
clc
P =[0 0; 1 1;0 1;1 0]
T = [0 0 1 1]'
maxgen = 300;
W = [0.1;0.1;0.1;0.1];
eta = 0.1;

for iter = 1 : maxgen
    for i = 1 : 4  %第一个输入数据与各个中心的距离
        d = sqrt(sum((P(i,:) - P).^2,2));
        fai = radbas(d);
        W(i) = W(i) + eta*(T(i) - W'*fai)*fai(i)
        pause(0.01)
    end
end
