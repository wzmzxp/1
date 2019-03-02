%% 粒子群 particleswarm
clear
clc

%%
% options = optimoptions(@particleswarm,'PlotFcn','pswplotbestf')
% x = particleswarm(@demo_11_1,2)

%% 
% lb = [-15 -15];
% ub = [15 15];
% x1 = particleswarm(@demo_11_1,2,lb,ub)

%% 粒子数量 min(100,10*nvars)
% options = optimoptions('particleswarm','SwarmSize',100);
% x2 = particleswarm(@demo_11_1,2,[],[],options)

%% 后续求解 'HybridFcn',fminco fminunc fminsearch patternsearch

% options = optimoptions('particleswarm','HybridFcn',@fminsearch);
% x3 = particleswarm(@demo_11_1,2,[],[],options)

%% Display off  final iter
% options = optimoptions('particleswarm','Display','iter');
% x4 = particleswarm(@demo_11_1,2,[],[])

%% 惯性权重范围 InertiaRange W = max(InertiaRange) W = min(InertiaRange)
% options = optimoptions('particleswarm','InertiaRange',[0.1 1.2]);
% x5 = particleswarm(@demo_11_1,2,[],[],options)

%% 初始粒子群矩阵 InitialSwarmMatrix
% M = rand(80,2);
% options = optimoptions('particleswarm','SwarmSize',100,'InitialSwarmMatrix',M);
% x2 = particleswarm(@demo_11_1,2,[],[],options)


%% InitialSwarmSpan [-InitialSwarmSpan/2 InitialSwarmSpan/2]   min(ub(k) - lb(k),InitialSwarmSpan(k))
% options = optimoptions('particleswarm','SwarmSize',100,'InitialSwarmSpan',[500 1000]);
% x2 = particleswarm(@demo_11_1,2,[],[],options)

%% MaxIterations  200*nvars
% options = optimoptions('particleswarm','MaxIterations',100);
% x2 = particleswarm(@demo_11_1,2,[],[],options)


%% MaxStallIterations 20  FunctionTolerance
% options = optimoptions('particleswarm','MaxStallIterations',100);
% x2 = particleswarm(@demo_11_1,2,[],[],options)



%% MaxStallTime inf

%% MaxTime inf

%% MinNeighborsFraction 0.25 max(2,floor(SwarmSize*MinNeighborsFraction))

%% SelfAdjustmentWeight 1.49

%% SocialAdjustmentWeight 1.49

