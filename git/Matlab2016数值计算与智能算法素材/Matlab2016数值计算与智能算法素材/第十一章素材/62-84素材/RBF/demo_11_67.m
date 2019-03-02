%% 广义径向基神经网络 随机选取中心
clear
close
clc
P =[0 0; 1 1;0 1;1 0]
T = [0 0 1 1]'

% 隐含层2个节点
% 随机选取2个径向基函数中心
index = randperm(4);
Center = P(index(1:2),:)

for i = 1 : 4  %计算每个输入向量与各个中心的距离
    for j = 1 : 2
        d(i,j) = sqrt(sum((P(i,:) - Center(j,:)).^2));
    end
end
% 计算插值矩阵， 添加权值
FAI = [radbas(d),ones(4,1)]
W = pinv(FAI)*T
% 计算实际输出
T1 = FAI * W



