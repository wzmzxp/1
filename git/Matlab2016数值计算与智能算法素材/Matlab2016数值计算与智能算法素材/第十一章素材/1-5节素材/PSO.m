%% ����Ⱥ PSO 
clear
clc

%% ����ԭͼ
% x1 = -15:1:15;
% x2 = -15:1:15;
% [x1,x2] = meshgrid(x1,x2);
% y = x1.^2 + x2.^2 - x1.*x2 - 10*x1 - 4*x2 + 60;
% mesh(x1,x2,y)
% hold on

%% Ԥ�����
n = 100; %��������
d = 2; %��������
c1 = 2;
c2 = 2;
w = 0.9;
K = 1000;

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
% h = scatter3(x(:,1),x(:,2),fit,'o');

%% �����ٶ���λ��
for i = 1:K
    % �����ٶ���λ��
    for m = 1:n
        v(m,:) = w*v(m,:) + c1*rand*(pbest(m,:) - x(m,:)) + c2*rand*(gbest - x(m,:));
        
        v(m,find(v(m,:) < -10)) = -10;
        v(m,find(v(m,:) > 10)) =  10;
        
        x(m,:) = x(m,:) + 0.5*v(m,:);
        x(m,find(x(m,:) < -10)) = -10;
        x(m,find(x(m,:) > 10)) = 10;
        % ���¼�����Ӧ��
        fit(m) = demo_11_1(x(m,:));
        if fit(m) < demo_11_1(pbest(m,:))
            pbest(m,:) = x(m,:);
        end
        if  demo_11_1(pbest(m,:)) < demo_11_1(gbest)
            gbest = pbest(m,:);
        end
    end
    fitnessbest(i) = demo_11_1(gbest);
%     pause(0.1)
%     h.XData = x(:,1);
%     h.YData = x(:,2);
%     h.ZData = fit;
end
plot(fitnessbest)
xlabel('��������');

