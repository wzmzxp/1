%% LMS ��������Ȩ���㷨
P = [0 0 1;1 0 1;0 1 1;1 1 1]';
T = [0 0 0 1];
W = [0 0 0]; % ��ʼȨֵ
eta = 0.1;

for iter = 1 : 200
    a = W*P;
    e = T - a;
    for i = 1 : 4
        W = W + eta*e(i)*P(:,i)';
    end
end
