%% BP������ ��������
% P = -pi : 0.02 : pi;
% T = 2*sin(pi*P) + 0.1*randn(size(P));
% plot(P,T,'o')
% hold on 
% % net = feedforwardnet(10,'traingd');
% net = feedforwardnet(10,'trainlm');
% net.trainParam.epochs = 1000000;
% net.trainParam.goal = 1e-6; %��С�������
% net.trainParam.show = 20; % ѵ����ʾ���
% net.trainParam.time = inf; %���ѵ��ʱ��
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
% %% ���
% clear
% clc
% close 
% 
% P = -10*pi : 0.02 : 10*pi;
% T = 2*sin(pi*P) + 0.1*randn(size(P));
% plot(P,T,'o')
% hold on 
% % net = feedforwardnet(10,'traingd');
% net = feedforwardnet([20,15],'trainlm'); % [10 5]���ڵ����Բ���
% net.trainParam.epochs = 1000000;
% net.trainParam.goal = 1e-6; %��С�������
% net.trainParam.show = 20; % ѵ����ʾ���
% net.trainParam.time = inf; %���ѵ��ʱ��
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

%% һ�����Ԫ
clear
clc
close 

P = -10*pi : 0.02 : 10*pi;
T = 2*sin(pi*P) + 0.1*randn(size(P));
plot(P,T,'o')
hold on 
% net = feedforwardnet(10,'traingd');
net = feedforwardnet(1000,'trainlm'); % 20 30 40 50     50����������Ԫ�ڵ㻹���ԣ�500���ڵ㻹�У�1000���ڵ����Թ����     
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-6; %��С�������
net.trainParam.show = 20; % ѵ����ʾ���
net.trainParam.time = inf; %���ѵ��ʱ��

net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
% net.layers{2}.transferFcn = 'tansig';
% net.layers{2}.transferFcn = 'logsig';
net = train(net,P,T);
x = -10*pi : 0.001 :10*pi;
y = net(x);
plot(x,y)