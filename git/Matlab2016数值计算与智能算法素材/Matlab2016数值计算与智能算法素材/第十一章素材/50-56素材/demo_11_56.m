%% 线性感知器 linearlayer 
clear
close
x = -10 : 1 : 10;
y = 2*x-1 + rand(1,length(x))*2;
plot(x,y,'o');
hold on 

LR = maxlinlr(x,'bias');
net = linearlayer(0,LR); % 创建延迟输入向量为0的线性神经网络
net = train(net,x,y);
yy = net(x);
plot(x,yy)

%% newlind
clear
close
x = -10 : 1 : 10;
y = 2*x-1 + rand(1,length(x))*2;
plot(x,y,'o');
hold on 

net = newlind(x,y); 
yy = net(x);
plot(x,yy)
%% 蠓虫分类 触角长和翼长作为输入信息
clear
close
P=[1.24 1.36 1.38 1.378 1.38 1.40 1.48 1.54 1.56 1.14 1.18 1.20 1.26 1.28 1.30; 
   1.72 1.74 1.64 1.82 1.90 1.70 1.70 1.82 2.08 1.78 1.96 1.86 2.00 2.00 1.96];
T=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
plotpv(P,T)
hold on

net = newlind(P,T); %创建线性神经网络
w = net.IW{1,1};
b = net.b{1,1};
plotpc(w,b-0.5);
hold on
p1=[1.24;1.80];
plot(p1(1),p1(2),'*')
a1 = sim(net,p1)>0.5

p2 =[1.28;1.84];
plot(p2(1),p2(2),'>')
a2 = sim(net,p2)>0.5

p3=[1.40;2.04];
plot(p3(1),p3(2),'<')
a3 = sim(net,p3)>0.5





