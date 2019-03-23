function [gbest,gbestval,C,fitcount]= mqhao_with_subgroup1(fhd,Dimension,Particle_Number,group,gr,Max_Gen,VRmin,VRmax,varargin)
%对种群进行分组进化比对
fopt=[-1400,-1300,-1200,-1100,-1000,-900,-800,-700,-600,-500,-400,-300,-200,-100,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400];
% fopt=zeros(1,28);
DIM=Dimension;
minDomain=VRmin;
maxDomain=VRmax;
maxFE=Max_Gen;

repeat=1;
C=zeros(1,310000);


% group=g;
% gr=gr;%每组数目
% groupNum=gr*group;
optimalNum=gr*group;%k值的大小

%------参数定义区域结束------
%------多次重复计算所需参数------
gbestV=zeros(1,repeat); 
gfe=zeros(1,repeat); 
tot_time1 = zeros(1,repeat);
%取前alfa中的最优解作为下一代的向标
alfa=0.5;

%------多次重复计算------

for kk=1:repeat
    tic;
    %------参数初始化区域开始------
    funcV=zeros(1,optimalNum);  %定义保存k个采样点的函数值，初始化为0
    samplePos=zeros(optimalNum,DIM);%采样点矩阵
    sigma=maxDomain-minDomain; %初始尺度为目标函数定义域的大小
    stdPre=zeros(1,DIM);%存储每一个维度上的标准差
    stdNow=zeros(1,DIM);
    %------计算k个采样位置的目标函数值------
    optimalSolution=unifrnd(minDomain,maxDomain,optimalNum,DIM);%定义k个DIM维采样点的坐标，并初始化
    stdPre=std(optimalSolution,1,1) ;%计算初始时k个采样点的标准差，按行求
    w=1;% function evolution times
    
%     VRmin=repmat(minDomain,gr,DIM);
%     VRmax=repmat(maxDomain,gr,DIM);
        VRmin=repmat(minDomain,ceil(alfa*optimalNum),DIM);
    VRmax=repmat(maxDomain,ceil(alfa*optimalNum),DIM);
%     for k=1:optimalNum  %求最优解函数值
%         funcV(k)=func(optimalSolution(k,:),DIM,varargin{:});
%         
%     end
%  for k=1:optimalNum 
%         funcV(k)=feval(fhd,optimalSolution(k,:)',varargin{:})-fopt(varargin{:});%func(id,optimalSolution(:,k),DIM);
%        
%     end
funcV=feval(fhd,optimalSolution',varargin{:})-fopt(varargin{:});
    C(w)=min(funcV);
%     csigma = ones(1,DIM)*(sigma);
%         covv = diag(csigma.^2);
%     covv=cov(optimalSolution);
   %第一代初始化的optimalSolution均值
    first_optimalSolution_mean=1/(optimalNum).*(sum(optimalSolution));
    %偏移数据到原点中心
%     optimalSolution=optimalSolution-first_optimalSolution_mean;
    
    [~,index_sort]=sort(funcV);
    optimalSolution=optimalSolution(index_sort,:);
    prefix_optimalSolution =optimalSolution(1:ceil(alfa*optimalNum),:);
    first_prefix_optimalSolution_mean=1/(ceil(alfa*optimalNum)).*(sum(prefix_optimalSolution));
    first_prefix_optimalSolution_covv=cov(prefix_optimalSolution);
    covv=first_prefix_optimalSolution_covv;
    mea=first_prefix_optimalSolution_mean;
%     covv=cov(prefix_optimalSolution);
%     covv=diag(covv);

    while w<=maxFE   % M iteration begin
        while w<=maxFE  %QHO iteration begin
            while w<=maxFE
                %分组计算 组数：group 每组：gr个元素；
                group=1;
                %上一代的协方差
%                 precovv=covv;
                %上一代均值
                premean=mea;
                
                prefix_optimalSolution=prefix_optimalSolution-premean;
                pre_covv=covv;
                for g=1:group
                    while 1
                        change_flag=0; % op_solution更新判断标志
%                         samplePos = mvnrnd(mean(optimalSolution((((g-1)*gr+1)):(g*gr),:),1),covv,gr);
                        samplePos = mvnrnd(mean(prefix_optimalSolution(1:ceil(alfa*optimalNum),:),1),covv,ceil(alfa*optimalNum));
%                         samplePos = mvnrnd(premean,pre_covv,ceil(alfa*optimalNum));
                        
samplePos=(samplePos>VRmax).*VRmax+(samplePos<=VRmax).*samplePos;
                        samplePos=(samplePos<VRmin).*VRmin+(samplePos>=VRmin).*samplePos;
                        %分组计算
                         sampleValue=feval(fhd,samplePos',varargin{:})-fopt(varargin{:});
                        for i=1:ceil(alfa*group*gr)
%                               sampleValue=feval(fhd,samplePos(i,:)',varargin{:})-fopt(varargin{:});%func(id,samplePos(:,k),DIM);
                     
%                             sampleValue=func(samplePos(i,:),DIM,varargin{:});%求第i个采样点的函数值
                            w=w+1;
                            C(w)=min(funcV);
%                             if sampleValue<funcV((((g-1)*gr+i))) %如果采样点值小于当前点函数值，则替换,
%                                 funcV((((g-1)*gr+i)))=sampleValue;
%                                 optimalSolution((((g-1)*gr+i)),:)=samplePos(i,:);
%                                 change_flag=1;
%                             end

                             if sampleValue(i)<funcV(i) %如果采样点值小于当前点函数值，则替换,
                                funcV(i)=sampleValue(i);
                                optimalSolution(i,:)=samplePos(i,:);
                                change_flag=1;
                            end
                        end
                        if(change_flag==0)
                            break;
                        end
                    end
                end
                break;
            end
            swarmNum=optimalNum;%群体数量
            a=1:swarmNum;
            alpha=sum(log((swarmNum+1)./(2*a)));
            weights=(log((swarmNum+1)./(2.*a)))/alpha;
            [v,vIndex] = sort(funcV);
            nm=zeros(swarmNum,DIM);
            for ii=1: swarmNum
                nm(ii,:)=nm(ii,:)+weights(ii)'.*optimalSolution(vIndex(ii),:);
            end
            nom=sum(nm,1);
            [v_max,index_max]=max(funcV);%取得最大值的序号index_max
            optimalSolution(index_max,:)=nom;%用平均坐标替换最大值对应坐标
              funcV(index_max)=feval(fhd,nom',varargin{:})-fopt(varargin{:});
%               funcV(index_max)=func(nom,DIM,varargin{:})-fopt(varargin{:});
%             funcV(index_max)=func(nom,DIM,varargin{:});%
            w=w+1;
            C(w)=min(funcV);
            stdPre=std(optimalSolution,1,1);  %新解标准差
            
            %筛选前alfa%
            
            prefix_optimalSolution =optimalSolution(1:ceil(alfa*optimalNum),:);
%             funcV(index_max)=feval(fhd,meanPos,varargin{:})-fopt(varargin{:});
            %------均值替换
            if w>maxFE
                break;
            end
            % ------能级下降结束------
            if max(stdPre)<sigma
                break;
            end
        end
        sigma=sigma/2.0;
        
        csigma = ones(1,DIM)*(sigma);
%         covv = diag(csigma.^2);
%       covv=cov(optimalSolution);
        %求前alfa%的均值
         mea=1/(ceil(alfa*optimalNum)).*(sum(prefix_optimalSolution));
        covv=cov(prefix_optimalSolution-premean);
       
%         mea=mean(prefix_optimalSolution,1);
%         covv=diag(covv);
        if w>maxFE
            break;
        end
    end
    %optimalSolution
    tot_time1(kk) = toc;
    
    [global_min,index]=min(funcV);
    gbest=min(funcV);
    gbestval=min(funcV);
    fitcount=w;
end
end