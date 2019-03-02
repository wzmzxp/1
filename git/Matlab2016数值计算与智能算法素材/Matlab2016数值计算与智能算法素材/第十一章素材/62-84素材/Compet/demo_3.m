%% 使用matlab工具箱函数 competlayer
% competlayer(numClasses,kohonenLR,conscienceLR)   5  0.01  0.001
clear
close
clc
%% 
x0 = [4.1,1.8,0.5,2.9,4.0,0.6,3.8,4.3,3.2,1.0,3.0,3.6,3.8,3.7,3.7,8.6,9.1,7.5,8.1,9.0,6.9,8.6,8.5,9.6,10.0,9.3,6.9,6.4,6.7,8.7;
      8.1,5.8,8.0,5.2,7.1,7.3,8.1,6.0,7.2,8.3,7.4,7.8,7.0,6.4,8.0,3.5,2.9,3.8,3.9,2.6,4.0,2.9,3.2,4.9,3.5,3.3,5.5,5.0,4.4,4.3;];
net = competlayer(3);
net = train(net,x0);
outputs = net(x0);
classes = vec2ind(outputs);
ind1 = find(classes == 1);
ind2 = find(classes == 2);
ind3 = find(classes == 3);
% 第一类
plot(x0(1,ind1),x0(2,ind1),'o')
hold on
% 第二类
plot(x0(1,ind2),x0(2,ind2),'*')
plot(x0(1,ind3),x0(2,ind3),'<')
w = net.IW{1,1};
plot(w(1,1),w(1,2),'pk',w(2,1),w(2,2),'pk',w(3,1),w(3,2),'pk')
legend('第一类','第二类','第三类','聚类中心')