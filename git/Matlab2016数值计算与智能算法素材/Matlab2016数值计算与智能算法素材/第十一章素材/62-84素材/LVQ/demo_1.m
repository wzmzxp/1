% Matlab�����亯��ѧϰʸ������������ LVQ
% lvqnet(hiddenSize,lvqLR,lvqLF)
% hiddenSize ��������Ԫ�ڵ�ĸ��� (default = 10)
% lvqLR	ѧϰ�� (default = 0.01)
% lvqLF	ѧϰ���� (default = 'learnlv1') learnlv2
clear
close
clc

P0 = [-3 -2 -2 0 0 0 0 2 2 3;0 1 -1 2 1 -1 -2 1 -1 0];
Tc = [1 1 1 2 2 2 2 1 1 1];
T = full(ind2vec(Tc));
net = lvqnet(4);
net = train(net,P0,T);
y = vec2ind(net(P0));
result = y - Tc

%%
close
clear
clc
A = xlsread('1.xlsx','A1:D29');
P = A(:,1:3)';
Tc = A(:,4)';
P0 = mapminmax(P);
T = ind2vec(Tc);

net = lvqnet(12);
net = train(net,P0,T);
y = vec2ind(net(P0));
result = y - Tc

