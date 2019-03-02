%% Matlab¹¤¾ßÏäº¯Êý newgrnn
% net = newgrnn(P,T,spread)

P = -9 : 1 : 8;
T = [129,-32,-118,-138,-125,-97,-55,-23,-4,2,1,-31,-72,-121,-142,-174,-155,-77];
x = - 9 : 0.1 : 8;
i = 1;
for spread = 0.1 : 0.1 :1
    net = newgrnn(P,T,spread);
    y = net(x);
    subplot(4,3,i);
    i = i + 1;
    plot(P,T,'o',x,y)
end
