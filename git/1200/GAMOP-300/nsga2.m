

clc;
clear;
close all;
clear all
global n b jifenk Ck Cp Cf Tk Tp Tf
global N h up uf
% h=792;
n=6027.639;b=2.196;
N=6;
% up=544;
Ck=25; Cp=100; Cf=1500;
Tk=0.2; Tp=4; Tf=8;
% uf=432;
%% Problem Definition

CostFunction=@(x) MOP2(x);      % Cost Function

nVar=2;             % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin1=0;          % Lower Bound of Variables
VarMax1=1000;          % Upper Bound of Variables

VarMin=0;
VarMax=1000;
% Number of Objective Functions
x=unifrnd(VarMin,VarMax,1);
x2=unifrnd(VarMin1,VarMax1,[1,nVar-1]);
nObj=numel(CostFunction([x,x2]));


%% NSGA-II Parameters

MaxIt=50;      % Maximum Number of Iterations

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
    
    % Mutation
    popm=repmat(empty_individual,nMutation,1);
    for k=1:nMutation
        
        i=randi([1 nPop]);
        p=pop(i);
        
        popm(k).Position=Mutate(p.Position,mu,sigma);
        
        popm(k).Cost=CostFunction(popm(k).Position);
        
    end
    
    % Merge
    pop=[pop
         popc
         popm]; %#ok
     
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
end

%% Results
% t=size(F2);
% index=[];
% for i3=2:t(2)
%     if F2(i3).Cost(2)<=2
%         index=[index,F2(i3)];
%     end
% end
% index1=[];
% t1=size(index);
% for i4=2:t1(2)
%     if index(i4).Cost(2)<=0.08
%         index1=[index1,index(i4)];
%     end
% end
