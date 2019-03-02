% 这是LVQ1 的演示程序
close
clear
clc
%% 
P0 = [-3 -2 -2 0 0 0 0 2 2 3;0 1 -1 2 1 -1 -2 1 -1 0];
[P,info] = mapminmax(P0);
Tc = [1 1 1 2 2 2 2 1 1 1];
T = full(ind2vec(Tc));

W2 = [1   1   0   0;0   0   1   1];
W1 = rand(4,2);% 竞争层神经元个数为4，每一行是一个竞争层神经元对应的权值
num = size(P,2); % 样本个数
eta0 = 0.2;
maxgen = 10000;
for iter = 1 : maxgen
    eta = eta0 * (1 - iter/maxgen);
    index = randi(num);
    x = P(:,index);
    y = compet(negdist(W1,x)); % 计算与每个权重的负距离 寻找获胜神经元,得到竞争层输出
    out = W2 * y;
    ind = find(y == 1);
    if isequal(out,T(:,index))
        W1(ind,:) = W1(ind,:) + eta*(x' - W1(ind,:));
    else
        W1(ind,:) = W1(ind,:) - eta*(x' - W1(ind,:));
    end
end

for i = 1 : num
    x = P(:,i);
    y = compet(negdist(W1,x)); 
    out(:,i) = W2 * y;
end
result = vec2ind(out) - Tc;
plot(P0(1,Tc == 1),P0(2,Tc == 1),'+')
hold on
plot(P0(1,Tc == 2),P0(2,Tc == 2),'o')
plot(W1(1,1),W1(1,2),'*')
plot(W1(2,1),W1(2,2),'*')
plot(W1(3,1),W1(3,2),'*')
plot(W1(4,1),W1(4,2),'*')


