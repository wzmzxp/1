%% ���徶��������� ���ѡȡ����
clear
close
clc
P =[0 0; 1 1;0 1;1 0]
T = [0 0 1 1]'

% ������2���ڵ�
% ���ѡȡ2���������������
index = randperm(4);
Center = P(index(1:2),:)

for i = 1 : 4  %����ÿ������������������ĵľ���
    for j = 1 : 2
        d(i,j) = sqrt(sum((P(i,:) - Center(j,:)).^2));
    end
end
% �����ֵ���� ���Ȩֵ
FAI = [radbas(d),ones(4,1)]
W = pinv(FAI)*T
% ����ʵ�����
T1 = FAI * W



