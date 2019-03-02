popsize=20;  %Ⱥ���ģ
MAXITER=2000; %����������
dimension=20; %����ά�� ģ��ϵ��
irange_l=-100; %λ�ó�ʼ���½�    ��
irange_r=100;  %λ�ó�ʼ���Ͻ�   ��
xmax=100;  %������Χ�Ͻ�
xmin=0;    %������Χ�½�
M=(xmax-xmin)/2
sum1=0;
st=0;
runno=50;
datal=zeros(runno,MAXITER);
figure(1)
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
        result(t)=f_gbest;
    end
    sum1=sum1+MINMUM;
    time=cputime-T;
    st=st+time;
          % ���Ʊ仯����
          hold on
    plot(g,run,'*')
end
av=sum1/runno;
st/50;  
% figure(1)      % ���Ʊ仯����
% plot(result,'LineWidth',2)
% title('���Ÿ�����Ӧֵ','fontsize',18);
% xlabel('��������','fontsize',18);ylabel('��Ӧֵ','fontsize',18);
% set(gca,'Fontsize',18);