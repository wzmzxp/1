%% ��������
close
clear
clc
rng(5)
data = xlsread('��.xlsx','B2:F151');
data1 = data(1:50,:); %��һ������
data2 = data(51:100,:); %�ڶ�������
data3 = data(101:150,:); %����������

flower1 = data1(:,1:4);
T1 = [zeros(50,2),ones(50,1)]; % 001����1

flower2 = data2(:,1:4);
T2 = [zeros(50,1),ones(50,1),zeros(50,1)]; % 010����2

flower3 = data3(:,1:4);
T3 = [ones(50,1),zeros(50,1),zeros(50,1)]; % 100����3

% ����ѵ���������Լ�
tempindex = randperm(50);
P_1 = flower1(tempindex(1:40),:); % ѵ����
T_1 = T1(tempindex(1:40),:); % ѵ����
P_test1 = flower1(tempindex(41:50),:); % ���Լ�
T_test1 = T1(tempindex(41:50),:); % ���Լ�

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

net = feedforwardnet(20);
net.trainParam.goal = 0.001;
net.trainParam.epochs = 5000;
net.trainFcn = 'trainrp';
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
net = train(net,P,T);
T_sim = net(P_test) > 0.5;

for i = 1 : 30
    result(i) = isequal(T_sim(:,i),logical(T_test(:,i)))
end

%% �ݶȶ���
close
clear
clc
data = xlsread('��.xlsx','B2:F151');
data1 = data(1:50,:); %��һ������
data2 = data(51:100,:); %�ڶ�������
data3 = data(101:150,:); %����������

flower1 = data1(:,1:4);
T1 = [zeros(50,2),ones(50,1)]; % 001����1

flower2 = data2(:,1:4);
T2 = [zeros(50,1),ones(50,1),zeros(50,1)]; % 010����2

flower3 = data3(:,1:4);
T3 = [ones(50,1),zeros(50,1),zeros(50,1)]; % 100����3

% ����ѵ���������Լ�
tempindex = randperm(50);
P_1 = flower1(tempindex(1:40),:); % ѵ����
T_1 = T1(tempindex(1:40),:); % ѵ����
P_test1 = flower1(tempindex(41:50),:); % ���Լ�
T_test1 = T1(tempindex(41:50),:); % ���Լ�

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


net = feedforwardnet(20,'traingdm');
net.trainParam.epochs = 50000;
net.trainParam.goal = 0.0001;
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.mc = 0.9;
net.trainParam.time = inf;
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
net = train(net,P,T);
T_sim = net(P_test) > 0.5;

for i = 1 : 30
    result(i) = isequal(T_sim(:,i),logical(T_test(:,i)))
end


