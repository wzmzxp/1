%% 单层感知器实现
clear
close
P = [2 1 -2 -1;2 -2 2 0;1 1 1 1];%带阈值常量的数据
T = [0 1 0 1];
W = [0 0 0];
eta = 0.01;
maxgen = 10;
plotpv(P(1:2,:),T);
hold on

h = plotpc(W(1:2),W(3));
for iter = 1 : maxgen
    for i = 1 : 4
        y = hardlim(W*P(:,i));
        e = T(i) - y;
        W = W + eta*e*P(:,i)';
    end
    h = plotpc(W(1:2),W(3),h);
    pause(0.1)
end
