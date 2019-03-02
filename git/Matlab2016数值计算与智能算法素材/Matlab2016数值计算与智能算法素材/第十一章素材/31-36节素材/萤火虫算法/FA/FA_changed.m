%% FA Yang X.S.ө����㷨
% Ⱥ�����Ż�������Ӧ��    ����ӱ
clear
close
clc

alfa = 0.5;
gama = 1;
beta0 = 1;
fireflynum=30;
maxgen = 300;
lb = -pi;
ub = pi;

X = lb + (ub - lb)*rand(fireflynum,1);
Y = objfunc(X); % �Ժ���ֵ��ʾ��������

%% ��ͼ
plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty)
hold on
h = plot(X,Y,'*');

for iter = 1 : maxgen
    for i = 1 : fireflynum
        D = sqrt((X(i) - X).^2);
        I = Y.*exp(-gama*D.^2);
        [ymax,ymaxindex] = maxk(I,2);
        if ymaxindex(1) == i
            ymaxindex = ymaxindex(2);
        end
        xmax = X(ymaxindex(1));
        
        d = sqrt( (X(i) - xmax)^2 );
        beta = beta0*exp(-gama*d^2);
        newX = X(i) + (xmax - X(i))*beta + alfa*randn;
        if newX < lb
            newX = lb;
        end
        if newX > ub
            newX = ub;
        end
        newY = objfunc(newX);
        if newY > Y(i)
            X(i) = newX;
            Y(i) = newY;
        end
    end
    Y = objfunc(X);
    h.XData = X;
    h.YData = Y;
    pause(0.01);
end
[bestY,bestYindex] = max(Y);
bestX = X(bestYindex);

fprintf('���λ�ã�%f\r�����ֵ:%f\r',bestX,bestY);
