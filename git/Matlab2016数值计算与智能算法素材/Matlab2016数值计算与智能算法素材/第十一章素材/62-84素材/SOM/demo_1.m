% Matlab 工具箱函数演示
% selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn)
% dimensions	 表示输出层拓扑结构的行向量 (default = [8 8])
% coverSteps	 训练次数 (default = 100)
% initNeighbor   邻域初始大小 (default = 3)
% topologyFcn	 拓扑函数 (default = 'hextop') gridtop  randtop tritop
% distanceFcn	 距离函数 (default = 'linkdist')  boxdist   dist  mandist
%% 
close
clear
clc
x = simplecluster_dataset; % 载入数据
plot(x(1,:),x(2,:),'o') % 显示图形
net = selforgmap([2 2]);
net = train(net,x);
y = vec2ind(net(x));
plot(x(1,y == 1),x(2,y == 1),'o')
hold on
plot(x(1,y == 2),x(2,y == 2),'*')
plot(x(1,y == 3),x(2,y == 3),'<')
plot(x(1,y == 4),x(2,y == 4),'>')
w = net.IW{1};
plot(w(1,1),w(1,2),'kp',w(2,1),w(2,2),'kp',w(3,1),w(3,2),'kp',w(4,1),w(4,2),'kp')
figure(2)
plotsompos(net,x) %  类别中心位置
figure(3)
plotsomhits(net,x) % 类别个数


