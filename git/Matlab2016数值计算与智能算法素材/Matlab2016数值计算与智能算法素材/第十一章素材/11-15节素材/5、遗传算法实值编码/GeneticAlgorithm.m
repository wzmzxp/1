clear
close
clc
%% GeneticAlgorithm
% varnum��������
% eps ����
% lb ub������Χ
% n ��Ⱥ��С
% ������� pc
% ������� pm
% ��̬���Ա任 M
f =@(x) 11*sin(6*x) + 7*cos(5*x);
ezplot(f)
hold on
h = plot(0,0,'*');


varnum = 1;
n = 200;
lb = -pi;
ub = pi;
pc = 0.5;
pm = 0.001;
maxgen = 200;

%% ��ʼ����Ⱥ
for i = 1:varnum
    pop(:,i) = lb(i) + (ub(i)-lb(i))*rand(n,1);
end

for iter = 1:maxgen
    %% ������Ӧ��ֵ
    fitvalue = fitnessfun(pop);
    fval = objfun(pop);
    h.XData = pop;
    h.YData = fval;
    pause(0.01)
    
    %% ѡ��
    [dad] = selection (pop,fitvalue);
    
    %% ����
    newpop = crossover(dad,pc);
    
    %% ����
    newpop = mutation(newpop,pm,lb,ub);
    
    pop = newpop;
    
    
end

fitvalue = fitnessfun(pop);

[bestfitness, bestindex] = max(fitvalue)
bestindividual = pop(bestindex,:)
fval = objfun(bestindividual)

plot(bestindividual,fval,'*')