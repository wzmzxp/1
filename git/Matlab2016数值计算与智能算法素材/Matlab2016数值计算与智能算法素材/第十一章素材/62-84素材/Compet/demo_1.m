%%  演示竞争神经网络训练过程
close
clear
clc
%%
x0=[4.1,1.8,0.5,2.9,4.0,0.6,3.8,4.3,3.2,1.0,3.0,3.6,3.8,3.7,3.7,8.6,9.1,7.5,8.1,9.0,6.9,8.6,8.5,9.6,10.0,9.3,6.9,6.4,6.7,8.7;
    8.1,5.8,8.0,5.2,7.1,7.3,8.1,6.0,7.2,8.3,7.4,7.8,7.0,6.4,8.0,3.5,2.9,3.8,3.9,2.6,4.0,2.9,3.2,4.9,3.5,3.3,5.5,5.0,4.4,4.3;];
% 输入向量是2维，分类目标是2类
w = rand(2,2); % 第一行代表第一个隐含层神经元与2个输入层神经元相连的连接权值
% 归一化
[x,~] = mapminmax(x0);
eta = 0.1;
for iter = 1 : 4000
    i = randi(30);
    [~,index] = max(w * x(:,i));
    dw = eta*(x(:,i)' - w(index,:));
    w(index,:) = w(index,:) + dw;
end

[~,index] = max(w * x);
ind1 = find(index == 1);
ind2 = find(index == 2);
% 第一类
plot(x(1,ind1),x(2,ind1),'o')
hold on
% 第二类
plot(x(1,ind2),x(2,ind2),'*')
plot(w(1,1),w(1,2),'pk',w(2,1),w(2,2),'pk')

