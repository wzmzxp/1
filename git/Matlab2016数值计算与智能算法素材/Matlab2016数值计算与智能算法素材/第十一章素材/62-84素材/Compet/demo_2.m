% matlab ����֯����������������
close
clear
clc
% ��Ȼ�������ڵ�
p = [0.1 0.8 0.1 0.9; 0.2 0.9 0.1 0.8];
w = midpoint(2,p); % �������һ������������ֵ��������ֵ����2ʱ��w������������ֵ����ȷ��������ڶ�������minmax(p)����ô��һ������������
b = initcon(2); % c = ones(2,1)/2; b = exp(1 - log(c));
lr = 0.001;
b_lr = 0.001;
for iter = 1 : 200000
    for i = 1 : 4
        x= p(:,i)';
        d = - sqrt(sum((x - w).^2,2)) + b;  % ���㸺���뺯�� negdist
        a = compet(d);
        index = find(a==1);
        w(index,:) = w(index,:) + lr*(x - w(index,:));
        
        c = exp(1-log(b));  %initcon learncon
        c = (1 - b_lr) * c + b_lr * a; % c Ϊ����ֵ��aΪ��Ԫ�����bΪ��һ����ֵ
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
% ��һ��
plot(p(1,class1),p(2,class1),'o')
hold on
% �ڶ���
plot(p(1,class2),p(2,class2),'*')
plot(w(1,1),w(1,2),'pk',w(2,1),w(2,2),'pk')
axis([-1 2 -1 2])
