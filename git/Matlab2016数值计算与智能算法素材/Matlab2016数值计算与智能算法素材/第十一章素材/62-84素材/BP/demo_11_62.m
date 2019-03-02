%% BP 3维曲线拟合
close
clear
clc

x1 = -pi : 0.1 : pi;
x2 = sin(x1) + 0.1*rand(size(x1));
y = cos(x1 .* x2) + 0.1*rand(size(x1));
plot3(x1,x2,y,'o')
hold on 

P = [x1;x2];
T = y;
% 归一化
[inputn,inputps] = mapminmax(P);
[outputn,outputps] = mapminmax(T);


net = feedforwardnet(15 ,'trainbfg');
net.layers{1}.transferFcn = 'logsig';
net = train(net,inputn,outputn);

x1 = -pi : 0.1 : pi;
x2 = sin(x1) + 0.1*rand(size(x1));
x = [x1;x2];

test_x = mapminmax('apply',x,inputps);
y = net(test_x);
test_y = mapminmax('reverse',y,outputps);

plot3(x1,x2,test_y)

%% 曲面拟合
close
clear
clc

rang = -10 : 0.6 : 10;
[x,y] = meshgrid(rang,rang);
x = x + eps;
y = y + eps;
z = (sin(x).*sin(y))./(x.*y);
x1 = x(:)';
y1 = y(:)';
z1 = z(:)'+ 0.1*rand(size(z(:)'));

scatter3(x1,y1,z1,'o')
hold on 

P = [x1;y1];
T = z1;

net = feedforwardnet(20);
net = train(net,P,T);

% 绘图
rang = -10 : 0.1 : 10;
[x,y] = meshgrid(rang,rang);
x = x + eps;
y = y + eps;
zz = (sin(x).*sin(y))./(x.*y) + eps;
x1 = x(:)';
y1 = y(:)';
P = [x1;y1];
z1 = net(P);
z = reshape(z1,size(x,1),size(x,2));
mesh(x,y,z)
surf(x,y,zz)

legend('原始点','拟合曲面','理想曲面')