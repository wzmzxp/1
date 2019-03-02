% ����LVQ1 ����ʾ����
close
clear
clc
%% 
P0 = [-3 -2 -2 0 0 0 0 2 2 3;0 1 -1 2 1 -1 -2 1 -1 0];
[P,info] = mapminmax(P0);
Tc = [1 1 1 2 2 2 2 1 1 1];
T = full(ind2vec(Tc));

W2 = [1   1   0   0;0   0   1   1];
W1 = rand(4,2);% ��������Ԫ����Ϊ4��ÿһ����һ����������Ԫ��Ӧ��Ȩֵ
num = size(P,2); % ��������
eta0 = 0.2;
maxgen = 10000;
for iter = 1 : maxgen
    eta = eta0 * (1 - iter/maxgen);
    index = randi(num);
    x = P(:,index);
    y = compet(negdist(W1,x)); % ������ÿ��Ȩ�صĸ����� Ѱ�һ�ʤ��Ԫ,�õ����������
    out = W2 * y;
    ind = find(y == 1);
    if isequal(out,T(:,index))
        W1(ind,:) = W1(ind,:) + eta*(x' - W1(ind,:));
    else
        W1(ind,:) = W1(ind,:) - eta*(x' - W1(ind,:));
    end
end

for i = 1 : num
    x = P(:,i);
    y = compet(negdist(W1,x)); 
    out(:,i) = W2 * y;
end
result = vec2ind(out) - Tc;
plot(P0(1,Tc == 1),P0(2,Tc == 1),'+')
hold on
plot(P0(1,Tc == 2),P0(2,Tc == 2),'o')
plot(W1(1,1),W1(1,2),'*')
plot(W1(2,1),W1(2,2),'*')
plot(W1(3,1),W1(3,2),'*')
plot(W1(4,1),W1(4,2),'*')


