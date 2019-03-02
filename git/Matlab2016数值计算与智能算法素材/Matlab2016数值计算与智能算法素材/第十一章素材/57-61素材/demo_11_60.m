%% BP������������
clear
close
clc
%%
% eta = 0.08;                       %ѧϰ��
% 
% % ��������
% p = linspace(0,2*pi,30);
% T = cos(p) + 0.05*rand(size(p));
% P = [p;-ones(size(p))];
% n = length(T);
% plot(p,T,'o');
% hold on
% 
% % ��ʼ������
% N = 10; % ������ڵ���
% W1 = rand(2,N); % ����㵽������Ȩֵ����
% W2 = rand(N + 1,1); % �����㵽�����Ȩֵ����
% maxgen = 2000;
% 
% % ����δ����ǰ����
% x = linspace(0,2*pi,100);
% x = [x;-ones(size(x))];
% for temp = 1 : length(x)
%     tempy = [logsig(W1'*x(:,temp));-1];
%     tempout(temp) = purelin(tempy'*W2);
% end
% h = plot(x(1,:),tempout);
% 
% 
% for iter = 1 : maxgen
%     for t = 1 : n
%         % ����ÿһ�����������
%         y = logsig(W1'*P(:,t));
%         % ������������
%         y = [y;-1];
%         out = purelin(y'*W2);
%         % ����в�
%         delta_out = (T(t) - out);
%         delta = delta_out * W2 .*y.*(1 - y) ;
%         % ����Ȩֵ
%         for k = 1 : 2
%             for j = 1 : N
%                 W1(k,j) = W1(k,j) + eta*delta(j)*P(k,t);
%             end
%         end
%         for j = 1 : N+1
%             W2(j) = W2(j) + eta*delta_out*y(j);
%         end
%     end
%     %���Ƶ���������
%     for temp = 1 : length(x)
%         tempy = [logsig(W1'*x(:,temp));-1];
%         tempout(temp) = purelin(tempy'*W2);
%     end
%     h.XData = x(1,:);
%     h.YData = tempout;
%     pause(0.02);
% end
% 
% xx = linspace(0,2*pi,200);
% yy = cos(xx);
% plot(xx,yy,'-*');
% legend('ԭʼ��','�������','��������')


%% tansig
clear
close
clc
%%
eta = 0.08;                       %ѧϰ��

% ��������
p = linspace(0,2*pi,30);
T = cos(p) + 0.05*rand(size(p));
P = [p;-ones(size(p))];
n = length(T);
plot(p,T,'o');
hold on

% ��ʼ������
N = 10; % ������ڵ���
W1 = rand(2,N); % ����㵽������Ȩֵ����
W2 = rand(N + 1,1); % �����㵽�����Ȩֵ����
maxgen = 2000;

% ����δ����ǰ����
x = linspace(0,2*pi,100);
x = [x;-ones(size(x))];
for temp = 1 : length(x)
    tempy = [logsig(W1'*x(:,temp));-1];
    tempout(temp) = tansig(tempy'*W2);
end
h = plot(x(1,:),tempout);


for iter = 1 : maxgen
    for t = 1 : n
        % ����ÿһ�����������
        y = logsig(W1'*P(:,t));
        % ������������
        y = [y;-1];
        out = tansig(y'*W2);
        % ����в�
        delta_out = (T(t) - out)*(1 - out*out);
        delta = delta_out * W2 .*y.*(1 - y) ;
        % ����Ȩֵ
        for k = 1 : 2
            for j = 1 : N
                W1(k,j) = W1(k,j) + eta*delta(j)*P(k,t);
            end
        end
        for j = 1 : N+1
            W2(j) = W2(j) + eta*delta_out*y(j);
        end
    end
    %���Ƶ���������
    for temp = 1 : length(x)
        tempy = [logsig(W1'*x(:,temp));-1];
        tempout(temp) = tansig(tempy'*W2);
    end
    h.XData = x(1,:);
    h.YData = tempout;
    pause(0.02);
end

xx = linspace(0,2*pi,200);
yy = cos(xx);
plot(xx,yy,'-*');
legend('ԭʼ��','�������','��������')