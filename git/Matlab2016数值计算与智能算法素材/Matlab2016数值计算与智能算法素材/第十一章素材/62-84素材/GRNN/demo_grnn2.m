%% Matlab 计算过程
close
clear
clc

addpath(genpath(pwd))
P = -9 : 1 : 8;
T = [129,-32,-118,-138,-125,-97,-55,-23,-4,2,1,-31,-72,-121,-142,-174,-155,-77];
x = - 9 : 0.1 : 8;
Q = length(P);

for spread = 0.01 : 0.1 :1.5
    
    b = zeros(Q,1)+sqrt(-log(.5))/spread;
    iw = P';
    lw = T;
    
    d = dist(iw,x); % iw中每行是一个输入向量，P中每列是一个输入向量
    a1 = radbas(d.*b);
    
    a2 = purelin(normprod(lw,a1));   % normprod 归一化点积权函数  z = w * p / sum(p)
    plot(P,T,'o',x,a2);
    name = ['图片/','spread_',num2str(spread),'.jpg'];
    saveas(gcf,name)  
end


