%% 
% ��ʾPNN�ļ������
close
clear
clc
%% 
% ׼������

P = [1 1;1 2;2 1;2 3;2 4;3 3]';
T = [1 1 1 2 2 2];
Test_point = [1 2.5]';
%% 
% �������������

% �������
dist = zeros(length(T),1);
y = zeros(length(T),1);
sigma = 0.1;
for i = 1 : length(T)
    dist(i) = norm(Test_point - P(:,i));
end
% �������
for i = 1 : length(T)
    y(i) = exp(-dist(i)^2 / (2 * sigma^2));
end
%% 
% ������Ͳ����

% ǰ�����ǵ�һ�࣬�����Ǽ�������ƽ��ֵ
out = zeros(2,1);
out(1) = sum(y(T == 1))/3;
out(2) = sum(y(T == 2))/3;
class = vec2ind(compet(out))


