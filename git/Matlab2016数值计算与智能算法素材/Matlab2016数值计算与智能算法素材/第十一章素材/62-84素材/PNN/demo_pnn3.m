%% matlab ���������ʾ
close
clear
clc

P = [1 1;1 2;2 1;2 3;2 4;3 3]';
T = [1 1 1 2 2 2];
t = ind2vec(T);
Test_point = [1 2.5]';
spread = 1;
Q = size(P,2);
b = zeros(Q,1)+sqrt(-log(.5))/spread;
iw = P';
lw = full(t);

d = dist(iw,Test_point) % iw��ÿ����һ������������P��ÿ����һ����������
a1 = radbas(d.*b)
a2 = compet(lw*a1)


