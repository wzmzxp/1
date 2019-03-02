% Matlab工具箱函数学习矢量量化神经网络 LVQ
% lvqnet(hiddenSize,lvqLR,lvqLF)
% hiddenSize 竞争层神经元节点的个数 (default = 10)
% lvqLR	学习率 (default = 0.01)
% lvqLF	学习函数 (default = 'learnlv1') learnlv2
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

