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
% ��Ѹ���ѡ����� pmax
% ������ѡ����� pmin

f =@(x) 11*sin(6*x) + 13*cos(5*x);
ezplot(f)
hold on 
h = plot(0,0,'*');

global M n varnum lb ub L
M = 2;
varnum = 1;
n = 100;
lb = -pi;
ub = pi;
eps = 1e-5;
q = 0.3;
pc = 0.9;
pm = 0.01;
maxgen = 100;


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
    
    [bestfitvalue,bestindex] = max(fitvalue);
    bestx = pop(bestindex,:);
    
    
    fval = objfun(real);
    h.XData = real;
    h.YData = fval;
    pause(0.01)
    
    %% ѡ��
    [dad,mom] = selection (pop,fitvalue);
    
    %% ����
    newpop = crossover(dad,mom,pc);
    
    %% ����
    newpop = mutation(newpop,pm);
    newpop = eselection(newpop,bestfitvalue,bestx);
    
    pop = newpop;
end

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