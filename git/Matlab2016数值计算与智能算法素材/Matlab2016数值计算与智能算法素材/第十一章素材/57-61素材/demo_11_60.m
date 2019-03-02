%% BP神经网络计算过程
clear
close
clc
%%
% eta = 0.08;                       %学习率
% 
% % 产生样本
% p = linspace(0,2*pi,30);
% T = cos(p) + 0.05*rand(size(p));
% P = [p;-ones(size(p))];
% n = length(T);
% plot(p,T,'o');
% hold on
% 
% % 初始化变量
% N = 10; % 隐含层节点数
% W1 = rand(2,N); % 输入层到隐含层权值矩阵
% W2 = rand(N + 1,1); % 隐含层到输出层权值矩阵
% maxgen = 2000;
% 
% % 画出未调整前曲线
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
%         % 计算每一个隐含层输出
%         y = logsig(W1'*P(:,t));
%         % 计算输出层输出
%         y = [y;-1];
%         out = purelin(y'*W2);
%         % 计算残差
%         delta_out = (T(t) - out);
%         delta = delta_out * W2 .*y.*(1 - y) ;
%         % 调整权值
%         for k = 1 : 2
%             for j = 1 : N
%                 W1(k,j) = W1(k,j) + eta*delta(j)*P(k,t);
%             end
%         end
%         for j = 1 : N+1
%             W2(j) = W2(j) + eta*delta_out*y(j);
%         end
%     end
%     %绘制调整后曲线
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
% legend('原始点','拟合曲线','理论曲线')


%% tansig
clear
close
clc
%%
eta = 0.08;                       %学习率

% 产生样本
p = linspace(0,2*pi,30);
T = cos(p) + 0.05*rand(size(p));
P = [p;-ones(size(p))];
n = length(T);
plot(p,T,'o');
hold on

% 初始化变量
N = 10; % 隐含层节点数
W1 = rand(2,N); % 输入层到隐含层权值矩阵
W2 = rand(N + 1,1); % 隐含层到输出层权值矩阵
maxgen = 2000;

% 画出未调整前曲线
x = linspace(0,2*pi,100);
x = [x;-ones(size(x))];
for temp = 1 : length(x)
    tempy = [logsig(W1'*x(:,temp));-1];
    tempout(temp) = tansig(tempy'*W2);
end
h = plot(x(1,:),tempout);


for iter = 1 : maxgen
    for t = 1 : n
        % 计算每一个隐含层输出
        y = logsig(W1'*P(:,t));
        % 计算输出层输出
        y = [y;-1];
        out = tansig(y'*W2);
        % 计算残差
        delta_out = (T(t) - out)*(1 - out*out);
        delta = delta_out * W2 .*y.*(1 - y) ;
        % 调整权值
        for k = 1 : 2
            for j = 1 : N
                W1(k,j) = W1(k,j) + eta*delta(j)*P(k,t);
            end
        end
        for j = 1 : N+1
            W2(j) = W2(j) + eta*delta_out*y(j);
        end
    end
    %绘制调整后曲线
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
legend('原始点','拟合曲线','理论曲线')