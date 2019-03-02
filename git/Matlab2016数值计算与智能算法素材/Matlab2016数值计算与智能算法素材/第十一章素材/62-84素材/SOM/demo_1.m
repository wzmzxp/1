% Matlab �����亯����ʾ
% selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn)
% dimensions	 ��ʾ��������˽ṹ�������� (default = [8 8])
% coverSteps	 ѵ������ (default = 100)
% initNeighbor   �����ʼ��С (default = 3)
% topologyFcn	 ���˺��� (default = 'hextop') gridtop  randtop tritop
% distanceFcn	 ���뺯�� (default = 'linkdist')  boxdist   dist  mandist
%% 
close
clear
clc
x = simplecluster_dataset; % ��������
plot(x(1,:),x(2,:),'o') % ��ʾͼ��
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
plotsompos(net,x) %  �������λ��
figure(3)
plotsomhits(net,x) % ������


