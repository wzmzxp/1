%% 
% GRNN 计算过程演示

close
clear
clc
%%
% 没有训练过程，把训练数据输入网络结构就确定了
P = -9 : 1 : 8;
T = [129,-32,-118,-138,-125,-97,-55,-23,-4,2,1,-31,-72,-121,-142,-174,-155,-77];
x = - 9 : 0.1 : 8;
%% 
% 为了方便理解，我们把逼近数据x一个一个输入，用for循环代替
y = zeros(1,length(x));
for i = 1 : length(x)  % 把x中的数据一个一个带入
    y_h = zeros(1,length(T));
    sigma = 0.5;
    for j = 1 : length(T) % 计算第一个数据与训练数据P的距离并计算隐含层输出
        d = norm(x(i) - P(j));
        y_h(j) = exp(-d^2/(2 * sigma^2));
    end
    y(i) = sum(y_h.*T)/(eps + sum(y_h));
end
%%
plot(P,T,'o')
hold on
plot(x,y,'Color','b');
legend('原始点','逼近曲线')

