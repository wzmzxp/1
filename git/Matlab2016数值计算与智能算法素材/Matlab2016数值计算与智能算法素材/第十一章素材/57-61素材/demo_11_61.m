%% BP神经网络 正弦曲线
% P = -pi : 0.02 : pi;
% T = 2*sin(pi*P) + 0.1*randn(size(P));
% plot(P,T,'o')
% hold on 
% % net = feedforwardnet(10,'traingd');
% net = feedforwardnet(10,'trainlm');
% net.trainParam.epochs = 1000000;
% net.trainParam.goal = 1e-6; %最小均方误差
% net.trainParam.show = 20; % 训练显示间隔
% net.trainParam.time = inf; %最大训练时间
% 
% net.layers{1}.transferFcn = 'logsig';
% net.layers{2}.transferFcn = 'purelin';
% % net.layers{2}.transferFcn = 'tansig';
% % net.layers{2}.transferFcn = 'logsig';
% net = train(net,P,T);
% x = -pi : 0.001 :pi;
% y = net(x);
% plot(x,y)
% 
% %% 多层
% clear
% clc
% close 
% 
% P = -10*pi : 0.02 : 10*pi;
% T = 2*sin(pi*P) + 0.1*randn(size(P));
% plot(P,T,'o')
% hold on 
% % net = feedforwardnet(10,'traingd');
% net = feedforwardnet([20,15],'trainlm'); % [10 5]个节点明显不行
% net.trainParam.epochs = 1000000;
% net.trainParam.goal = 1e-6; %最小均方误差
% net.trainParam.show = 20; % 训练显示间隔
% net.trainParam.time = inf; %最大训练时间
% 
% net.layers{1}.transferFcn = 'logsig';
% net.layers{2}.transferFcn = 'logsig';
% net.layers{3}.transferFcn = 'purelin';
% % net.layers{2}.transferFcn = 'tansig';
% % net.layers{2}.transferFcn = 'logsig';
% net = train(net,P,T);
% x = -10*pi : 0.001 :10*pi;
% y = net(x);
% plot(x,y)

%% 一层多神经元
clear
clc
close 

P = -10*pi : 0.02 : 10*pi;
T = 2*sin(pi*P) + 0.1*randn(size(P));
plot(P,T,'o')
hold on 
% net = feedforwardnet(10,'traingd');
net = feedforwardnet(1000,'trainlm'); % 20 30 40 50     50个隐含层神经元节点还可以，500个节点还行，1000个节点明显过拟合     
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-6; %最小均方误差
net.trainParam.show = 20; % 训练显示间隔
net.trainParam.time = inf; %最大训练时间

net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
% net.layers{2}.transferFcn = 'tansig';
% net.layers{2}.transferFcn = 'logsig';
net = train(net,P,T);
x = -10*pi : 0.001 :10*pi;
y = net(x);
plot(x,y)