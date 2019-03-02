%% ����Ⱥ PSO  �첽ѧϰ����
clear
clc

%% Ԥ�����
n = 100; %��������
d = 2; %��������
K = 100;
w = 0.8;
c1ini = 2.5;
c1fin = 0.5;
c2ini = 0.5;
c2fin = 2.5;

%% �ֲ�����
x = -10 + 20*rand(n,d);
v = -5 + 10*rand(n,d);

%% ������Ӧ��
fit = zeros(n,1);
for j = 1:n
    fit(j) = demo_11_1_2(x(j,:));
end
pbest = x;
ind = find(min(fit) == fit);
gbest = x(ind,:);

%% �����ٶ���λ��
for i = 1:K
    % �����ٶ���λ��
    for m = 1:n
        c1 = c1ini + (c1fin - c1ini)*i/K;
        c2 = c2ini + (c2fin - c2ini)*i/K;
        
        v(m,:) = w*v(m,:) + c1*rand*(pbest(m,:) - x(m,:)) + c2*rand*(gbest - x(m,:));
        v(m,find(v(m,:) > 1)) = 1;
        v(m,find(v(m,:) < -1)) = -1;
        
        x(m,:) = x(m,:) + v(m,:);
        x(m,find(x(m,:) < -10)) = -15;
        x(m,find(x(m,:) > 10)) = 15;
    end
    for m = 1:n
        % ���¼�����Ӧ��
        fit(m) = demo_11_1_2(x(m,:));
        if fit(m) < demo_11_1_2(pbest(m,:))
            pbest(m,:) = x(m,:);
        end
        if  demo_11_1_2(pbest(m,:)) < demo_11_1_2(gbest)
            gbest = pbest(m,:)
        end
    end
    gbestfitness(i) = demo_11_1_2(gbest);
end

plot(gbestfitness);
xlabel('��������')
ylabel('��Ӧ��ֵ')
title('�����Ż�����')

