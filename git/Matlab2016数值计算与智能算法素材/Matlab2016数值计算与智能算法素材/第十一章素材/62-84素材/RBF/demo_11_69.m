% RBF�����繤���亯��
% net = newrb(P,T,goal,spread,MN,DF)
%% ���߱ƽ�
close
clear
clc
addpath(genpath(pwd))
% addpath('ͼƬ;New Folder;New Folder (2);')
x = 0 : 0.5 : 2*pi;
y = sin(x);
P = x;
T = y;
% �任��չ����
eps = 0;
MaxNum = length(x);
Display = 1;
for spread = 0.01 : 0.1 : 1.5
    net = newrb(P,T,eps,spread,MaxNum,Display); % ��չ����ʹ��Ĭ��
    x1 = 0 : 0.1 : 2*pi;
    y1 = net(x1);
    y2 = sin(x1);
    plot(x,y,'o',x1,y1,x1,y2)
    legend('ԭʼ��','�ƽ�����','��������')
    name = ['ͼƬ/','spread_',num2str(spread),'.jpg'];
    saveas (gcf,name)
end
%% ����
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

eps = 0;
MaxNum = 50;
Display = 1;
spread = 1;
net = newrb(P,T,eps,spread,MaxNum,Display);
% ��֤ѵ�����
T1 = net(P) > 0.5;
for i = 1 : 120
    result(i) = isequal(T1(:,i),logical(T(:,i)));
end
% ��֤��������
T_sim = net(P_test) > 0.5;
for i = 1 : 30
    result1(i) = isequal(T_sim(:,i),logical(T_test(:,i)));
end