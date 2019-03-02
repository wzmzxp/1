%% ����Ⱥ PSO   ���Եݼ�Ȩ��
clear
clc

%% Ԥ�����
n = 100; %��������
d = 2; %��������
c1 = 2;
c2 = 2;
w = 0.9;
K = 100;
ws = 0.9;
we = 0.4;

%% �ֲ�����
x = -10 + 20*rand(n,d);
v = -5 + 10*rand(n,d);

%% ������Ӧ��
fit = zeros(n,1);
for j = 1:n
    fit(j) = demo_11_1(x(j,:));
end
pbest = x;
ind = find(min(fit) == fit);
gbest = x(ind,:);


%% �����ٶ���λ��
for i = 1:K
    % �����ٶ���λ��
    for m = 1:n
        v(m,:) = w*v(m,:) + c1*rand*(pbest(m,:) - x(m,:)) + c2*rand*(gbest - x(m,:));
        w = ws - (ws - we)*i/K;
        
        v(m,find(v(m,:) < -10)) = -10;
        v(m,find(v(m,:) > 10)) =  10;
        
        x(m,:) = x(m,:) + v(m,:);
        x(m,find(x(m,:) < -10)) = -10;
        x(m,find(x(m,:) > 10)) = 10;
        % ���¼�����Ӧ��
        fit(m) = demo_11_1(x(m,:));
        if fit(m) < demo_11_1(pbest(m,:))
            pbest(m,:) = x(m,:);
        end
        if  demo_11_1(pbest(m,:)) < demo_11_1(gbest)
            gbest = pbest(m,:)
        end
    end
    fitnessbest(i) = demo_11_1(gbest);
end
plot(fitnessbest)