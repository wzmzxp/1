%% ABC ��Ⱥ�㷨
clear
close all
clc

FoodNum = 50;
limit = 20;
maxgen = 100;
d = 1;% ����ά��
alfa = 0.1;
beta = 1.5;
lb = -pi;
ub = pi;

%% ������Դ
X = lb + (ub - lb)*rand(FoodNum,1); % ���д洢
Fitnessvalue = fitnessfunc(X);
%% ��ͼ
plotx = linspace(-pi,pi,1000)';
ploty = fitnessfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(X,Fitnessvalue,'*');


[bestfitness,bestfitnessindex] = min(Fitnessvalue);
bestFood = X(bestfitnessindex,:);
trial = zeros(FoodNum,1);
for iter = 1 : maxgen
    for i = 1 : FoodNum
        % ����Դ������������
        % ����Ѱ��һ����ͬ�����������Դ
        leftfood = setdiff(1:FoodNum,i);
        foodindex = leftfood(randi([1,length(leftfood)],1,1));
        sourcefood = X(i,:);
        nextfood = sourcefood;
        neighbourfood = X(foodindex,:);
        changenode = randi([1 d]);
        nextfood(changenode) = sourcefood(changenode) + alfa*levyrand(beta) * (neighbourfood(changenode) - sourcefood(changenode));
        if nextfood(changenode) < lb(changenode)
            nextfood(changenode) = lb(changenode);
        end
        if nextfood(changenode) > ub(changenode)
            nextfood(changenode) = ub(changenode);
        end
        
        Fitnesssourcefood = fitnessfunc(nextfood);
        if Fitnesssourcefood > Fitnessvalue(i)
            X(i,:) = nextfood;
            Fitnessvalue(i) = Fitnesssourcefood;
            trial(i)=0;
        else
            trial(i) = trial(i) + 1;
        end
    end
    %% �����ǹ�Ӷ��׶�
    %% �����ǹ۲��׶�
    P = cumsum(Fitnessvalue./sum(Fitnessvalue));
    for k = 1 : FoodNum
        r = rand;
        index = find(P > r);
        Beeindex = index(1);
        leftfood = setdiff(1:FoodNum,Beeindex);
        foodindex = leftfood(randi([1,length(leftfood)],1,1));
        sourcefood = X(Beeindex,:);
        nextfood = sourcefood;
        neighbourfood = X(foodindex,:);
        changenode = randi([1 d]);
        nextfood(changenode) = nextfood(changenode) + alfa*levyrand(beta) * (neighbourfood(changenode) - sourcefood(changenode));
        if nextfood(changenode) < lb(changenode)
            nextfood(changenode) = lb(changenode);
        end
        if nextfood(changenode) > ub(changenode)
            nextfood(changenode) = ub(changenode);
        end
        
        Fitnesssourcefood = fitnessfunc(nextfood);
        if Fitnesssourcefood > Fitnessvalue(Beeindex)
            X(Beeindex,:) = nextfood;
            Fitnessvalue(Beeindex) = Fitnesssourcefood;
            trial(Beeindex)=0;
        else
            trial(Beeindex) = trial(Beeindex) + 1;
        end
    end
    %% �۲��׶����
    h.XData = X;
    h.YData = Fitnessvalue;
    pause(0.01);

    %% ����׶ο�ʼ
    ind = find(trial > limit);
    for j = 1 : length(ind)
        % �������ɵ�ind(j)��Դ
        x = lb + (ub - lb)*rand(1,d);
        X(ind(j),:) = x;
        Fitnessvalue(ind(j)) = fitnessfunc(x);
        trial(ind(j)) = 0;
    end
end
plotx = linspace(-pi,pi,1000)';
ploty = objfunc(plotx);
figure
plot(plotx,ploty)
hold on
fval = objfunc(X);
plot(X,fval,'*');

[bestObj,ind] = min(fval);
bestFood = X(ind,:);
fprintf('���λ�ã� %f\n��Ѻ���ֵ��%f\n',bestFood,bestObj)


