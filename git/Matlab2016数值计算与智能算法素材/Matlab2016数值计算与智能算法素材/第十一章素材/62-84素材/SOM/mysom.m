%% 
clear
close all
clc
%% ��������
x0 = [4.1,1.8,0.5,2.9,4.0,0.6,3.8,4.3,3.2,1.0,3.0,3.6,3.8,3.7,3.7,8.6,9.1,...
      7.5,8.1,9.0,6.9,8.6,8.5,9.6,10.0,9.3,6.9,6.4,6.7,8.7;...
      8.1,5.8,8.0,5.2,7.1,7.3,8.1,6.0,7.2,8.3,7.4,7.8,7.0,6.4,8.0,...
      3.5,2.9,3.8,3.9,2.6,4.0,2.9,3.2,4.9,3.5,3.3,5.5,5.0,4.4,4.3];

%���ݹ�һ��
[x,~] = mapminmax(x0);
% ����2��2����  ���з�ʽ��  1   3
%                          2   4
m = 2; % 2��
n = 2; % 2��
Nnum = m * n; % �������Ԫ�ڵ���
w = rand(2,Nnum); % �������Ԫ��2��������Ȩֵ������ 2 �� 4 ÿһ�ж�Ӧһ���������Ԫ
Lr_max = 0.8;
Lr_min = 0.05;
Nbor_max = 3;
Nbor_min = 0.5;
[row,col] = ind2sub([m, n], 1 : Nnum); % ��Ԫλ��
maxgen = 2000;
for iter = 1 : maxgen
    % ����˴�ѧϰ��������뾶
    Lr = Lr_max - (Lr_max - Lr_min) * iter / maxgen;
    Nbor = Nbor_max - (Nbor_max - Nbor_min) * iter / maxgen;
    % ���ѡȡһ������
    index = randi(30);
    sx = x(:,index); % ѡ���x
    % �������Ǹ��ڵ������Ȩֵ��ӽ�
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
legend('��һ��','�ڶ���','������','������','��������')




