%% SAA ģ���˻�
clear
close
clc

%% ������ʼ��
T = 1000;
Lk = 100;
maxgen = 200;
alfa = 0.95;
lb = -pi;
ub = pi;

x0 = lb + (ub - lb)*rand;
y0 = objfunc(x0);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(x0,y0,'*');

for iter = 1 : maxgen
    for i = 1 : Lk
        y0 = objfunc(x0);
        x1 = x0 + randn;
        if x1 < lb
            x1 = lb;
        end
        if x1 > ub
            x1 = ub;
        end
        y1 = objfunc(x1);
        if y1 > y0    %С�ں��Լ�y0 - y1��Сֵ�����ں��Լ�y1 - y0 �󼫴�ֵ
            x0 = x1;
        else
            p = exp((y1 - y0)/T);
            if rand < p
                x0 = x1;
            end
        end
    end
    h.XData = x0;
    h.YData = y0;
    pause(0.05);
    T = alfa*T;
end