popsize=20;  %群体规模
MAXITER=2000; %最大迭代次数
dimension=20; %问题维数 模糊系数
irange_l=-100; %位置初始化下届    ？
irange_r=100;  %位置初始化上界   ？
xmax=100;  %搜索范围上界
xmin=0;    %搜索范围下界
M=(xmax-xmin)/2
sum1=0;
st=0;
runno=50;
datal=zeros(runno,MAXITER);
figure(1)      % 绘制变化曲线
% plot(y_fitness,'LineWidth',2)
title('最优个体适应值','fontsize',18);
xlabel('迭代次数','fontsize',18);ylabel('适应值','fontsize',18);
for run=1:runno
    T=cputime;
    x=(irange_r-irange_l)*rand(popsize,dimension,1)+irange_l;
    pbest=x;
    gbest=zeros(1,dimension);
    for i=1:popsize
        f_x(i)=F(x(i,:));
        f_pbest(i)=f_x(i);
    end
    g=min(find(f_pbest==min(f_pbest(1:popsize))));
    gbest=pbest(g,:);
    f_gbest=f_pbest(g);
    MINMUM=f_pbest(g);
    for t=1:MAXITER
        alpha=(1.0-0.5)*(MAXITER-t)/MAXITER+0.5;
        mbest=sum(pbest)/popsize;
        for i=1:popsize
            for d=1:dimension
                fi=rand;
                p=fi*pbest(i,d)+(1-fi)*gbest(d);
                u=rand;
                b=alpha*abs(mbest(d)-x(i,d));
                v=-log(u);
                if rand>0.5
                    x(i,d)=p+b*v;
                else
                    x(i,d)=p-b*v;
                end
                if x(i,d)>xmax;
                    x(i,d)=xmax;
                end
                if x(i,d)<-xmax;
                    x(i,d)=-xmax;
                end
            end
            if(f_x(i)<f_pbest(i))
                pbest(i,:)=x(i,:);
                f_pbest(i)=f_x(i);
            end
            if f_pbest(i)<f_gbest
                gbest=pbest(i,:);
                f_gbest=f_pbest(i);
            end
            MINIMUM=f_gbest;
        end
        MINIMUM;
        datal(run,t)=MINMUM;
    end
    sum1=sum1+MINMUM;
    time=cputime-T;
    st=st+time;
    hold on
    plot(F(y_fitness),t,'*')
end
av=sum1/runno;
st/50
y_fitness(2,MAXITER)=f_gbest;

