P = [2 1 -2 -1;2 -2 2 0;];
T = [0 1 0 1];
net = perceptron('hardlim');
net = train(net,P,T);
y = sim(net,P)
y1 = net(P)
W = net.IW
b = net.b
%% 
nntool