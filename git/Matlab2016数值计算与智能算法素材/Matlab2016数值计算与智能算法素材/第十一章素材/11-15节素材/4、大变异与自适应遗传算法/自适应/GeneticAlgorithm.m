clear
close
clc
%% GeneticAlgorithm
% varnum��������
% eps ����
% lb ub������Χ
% n ��Ⱥ��С
% ������ʳ��� pc1
% ������ʳ��� pc2
% ������ʳ��� pm1 
% ������ʳ��� pm2 
% ��̬���Ա任 M

f =@(x) 11*sin(6*x) + 7*cos(5*x);
ezplot(f)
hold on 
h = plot(0,0,'*');

global M n varnum L lb ub
M = 2;
varnum = 1;
n = 200;
lb = -pi;
ub = pi;
eps = 1e-4;
pc1 = 0.5;
pc2 = 0.9;
pm1 = 0.01;
pm2 = 0.05;
maxgen = 200;


%% ��ʼ����Ⱥ
for i = 1:varnum
    L(i) = ceil(log2((ub(i) - lb(i)) / eps + 1));
end

LS = sum(L);%��λ��

pop = randi([0 1],n,LS);
spoint = cumsum([0 L]);

for iter = 1:maxgen
    %% ��������ת��Ϊʮ����
    for i = 1:n
        for j = 1:varnum
            startpoint = spoint(j) + 1;
            endpoint = spoint(j+1);
            real(i,j) = decode(pop(i,startpoint:endpoint),lb(j),ub(j));
        end
    end
    
    %% ������Ӧ��ֵ
    fitvalue = fitnessfun(real);
    fval = objfun(real);
    h.XData = real;
    h.YData = fval;
    pause(0.01)
    
    %% ѡ��
    [dad,mom] = selection (pop,fitvalue);
    
    %% ����
    newpop = crossover(dad,mom,pc1,pc2);
    
    newpop = mutation(newpop,pm1,pm2);

    pop = newpop;  
end

%% ������ת��ʮ����
for i = 1:n
    for j = 1:varnum
        startpoint = spoint(j) + 1;
        endpoint = spoint(j+1);
        real(i,j) = decode(pop(i,startpoint:endpoint),lb(j),ub(j));
    end
end

fitvalue = fitnessfun(real);

[bestfitness, bestindex] = max(fitvalue)
bestindividual = real(bestindex,:)
fval = objfun(bestindividual)

plot(bestindividual,fval,'*')