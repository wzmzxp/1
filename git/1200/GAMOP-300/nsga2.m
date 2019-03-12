

clc;
clear;
close all;
clear all
global n b jifenk Ck Cp Cf Tk Tp Tf
global N h up uf VarMin1 VarMax1 VarMin VarMax
% h=792;
n=6027.639;b=2.196;
N=6;
% up=544;
Ck=50; Cp=100; Cf=1500;
Tk=0.2; Tp=4; Tf=8;
% uf=432;
%% Problem Definition

CostFunction=@(x) MOP2(x);      % Cost Function

nVar=2;             % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin1=100;          % Lower Bound of Variables
VarMax1=1000;          % Upper Bound of Variables

VarMin=100;
VarMax=1000;
% Number of Objective Functions
x=unifrnd(VarMin,VarMax,1);
x2=unifrnd(VarMin1,VarMax1,[1,nVar-1]);
nObj=numel(CostFunction([x,x2]));


%% NSGA-II Parameters

MaxIt=50;      % Maximum Number of Iterations
MaxIts1=[100000];
MaxIts2=[100000];
MaxIts11=[];
MaxIts21=[];
nPop=100;        % Population Size

pCrossover=0.7;                         % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.4;                          % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

mu=0.02;                    % Mutation Rate

sigma=0.1*(VarMax-VarMin);  % Mutation Step Size


%% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    % Number of Objective Functions
    x=unifrnd(VarMin,VarMax,1);
    x2=unifrnd(VarMin1,VarMax1,1,nVar-1);
%     nObj=numel(CostFunction([x,x2]));
    pop(i).Position=[x x2];
    
    pop(i).Cost=CostFunction(pop(i).Position);
    
end

% Non-Dominated Sorting
[pop, F]=NonDominatedSorting(pop);

% Calculate Crowding Distance
pop=CalcCrowdingDistance(pop,F);

% Sort Population
[pop, F]=SortPopulation(pop);

F2=[empty_individual];
%% NSGA-II Main Loop
% F2=empty_individual;
for it=1:MaxIt
    
    % Crossover
    
    popc=repmat(empty_individual,nCrossover/2,2);
    for k=1:nCrossover/2
        
        i1=randi([1 nPop]);
        p1=pop(i1);
        
        i2=randi([1 nPop]);
        p2=pop(i2);
        
        [popc(k,1).Position, popc(k,2).Position]=Crossover(p1.Position,p2.Position);
        
        popc(k,1).Cost=CostFunction(popc(k,1).Position);
        popc(k,2).Cost=CostFunction(popc(k,2).Position);
        
    end
    popc=popc(:);
    if(it==3)
        for i=1:size(popc)
            if (popc(i).Position<0)
                break;
            end
        end
        
    end
    % Mutation
    popm=repmat(empty_individual,nMutation,1);
    for k=1:nMutation
        
        i=randi([1 nPop]);
        p=pop(i);
        
        popm(k).Position=Mutate(p.Position,mu,sigma);
        
        popm(k).Cost=CostFunction(popm(k).Position);
        
    end
    if(it==3)
        for i=1:size(popm)
            if (popm(i).Position<0)
                break;
            end
        end
        
    end
    % Merge
    pop=[pop
         popc
         popm]; %#ok
     if(it==3)
         for i=1:size(pop)
             if (pop(i).Position<0)
                 break;
             end
         end
         
     end
    % Non-Dominated Sorting
    
    [pop, F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    pop=SortPopulation(pop);
    
    % Truncate
    pop=pop(1:nPop);
    
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    [pop, F]=SortPopulation(pop);
    
    % Store F1
    F1=pop(F{1});
    t=size(F1);
    F1=reshape(F1,1,t(1));
    F2=[F2 F1];
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
    
    % Plot F1 Costs
    figure(1);
    PlotCosts(F1);
    pause(0.01);
%     if  it==3
%         break;
%     end
    for i=2:size(F2,2)
        MaxIts1(i)=F2(i).Cost(1);
        MaxIts2(i)=F2(i).Cost(2);
    end
    Maxlts11(it)=min(MaxIts1);
    Maxlts21(it)=min(MaxIts2);
%     a(1:4891)=[F2(1:end).Cost(1)]
end
figure(2)
plot([1:MaxIt],Maxlts11);
figure(3)
plot([1:MaxIt],Maxlts21);


%% Results
t=size(F2);
index=[];
for i3=2:t(2)
    if F2(i3).Cost(1)>=500 && F2(i3).Cost(1)<=600
        index=[index,F2(i3)];
    end
end
index1=[];
t1=size(index);
for i4=2:t1(2)
    if -index(i4).Cost(2)>=0.9 && -index(i4).Cost(2)<=0.9999
        index1=[index1,index(i4)];
    end
end
index2=[];
t1=size(index1);
for i4=2:t1(2)
    if index1(i4).Position(1)>=100 && index1(i4).Position(1)<=900
        index2=[index2,index1(i4)];
    end
end
index3=[];
t1=size(index2);
for i4=2:t1(2)
    if index2(i4).Position(2)>=300 && index2(i4).Position(2)<900
        index3=[index3,index2(i4)];
    end
end