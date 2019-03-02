% matlab 自组织竞争神经网络计算过程
close
clear
clc
% 依然是两个节点
p = [0.1 0.8 0.1 0.9; 0.2 0.9 0.1 0.8];
w = midpoint(2,p); % 如果后面一个输入是样本值，当样本值大于2时，w的行数由样本值行数确定，如果第二个输入minmax(p)，那么第一个参数起作用
b = initcon(2); % c = ones(2,1)/2; b = exp(1 - log(c));
lr = 0.001;
b_lr = 0.001;
for iter = 1 : 200000
    for i = 1 : 4
        x= p(:,i)';
        d = - sqrt(sum((x - w).^2,2)) + b;  % 计算负距离函数 negdist
        a = compet(d);
        index = find(a==1);
        w(index,:) = w(index,:) + lr*(x - w(index,:));
        
        c = exp(1-log(b));  %initcon learncon
        c = (1 - b_lr) * c + b_lr * a; % c 为良心值，a为神经元输出，b为上一次阈值
        db = exp(1-log(c)) - b;
        b = b + db;
    end
end
w
b
for i = 1 : 4
        x= p(:,i)';
        d = - sqrt(sum((x - w).^2,2)) + b;
        class(i) = vec2ind(compet(d));
end
class1 = find(class == 1);
class2 = find(class == 2);
% 第一类
plot(p(1,class1),p(2,class1),'o')
hold on
% 第二类
plot(p(1,class2),p(2,class2),'*')
plot(w(1,1),w(1,2),'pk',w(2,1),w(2,2),'pk')
axis([-1 2 -1 2])
