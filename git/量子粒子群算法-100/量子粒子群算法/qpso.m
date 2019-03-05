
popsize=20;
MAXITER=200;
dimension=2;
irange_l=-32;
irange_r=32;
xmax=100;

sum1=0;
sum2=0;
mean=0;
st=0;
runno=10;
data1=zeros(runno,MAXITER);
for run=1:runno
T=cputime;
x=(irange_r- irange_l)*rand(popsize,dimension,1) + irange_l;


pbest=x;
gbest=zeros(1,dimension);



for i=1:popsize
    f_x(i)=F(x(i,:));
    f_pbest(i)=f_x(i);
end
   
   
    g=min(find(f_pbest==min(f_pbest(1:popsize))));
    gbest=pbest(g,:);
   
    f_gbest=f_pbest(g);


MINIUM=f_pbest(g);
for t=1:MAXITER
  
    beta=(1-0.5)*(MAXITER-t)/MAXITER+0.5;
    mbest=sum(pbest)/popsize;

       
 for i=1:popsize  
        fi=rand(1,dimension);
        p=fi.*pbest(i,:)+(1-fi).*gbest;
        u=rand(1,dimension);
        b=beta*(mbest-x(i,:));
        v=-log(u);
        y=p+((-1).^ceil(0.5+rand(1,dimension))).*b.*v;
        x(i,:)=y;
        x(i,:)=sign(y).*min(abs(y),xmax); 
          
            f_x(i)=f5(x(i,:));
            if f_x(i)<f_pbest(i)
                pbest(i,:)=x(i,:);
                f_pbest(i)=f_x(i);
            end
            if f_pbest(i)<f_gbest
                gbest=pbest(i,:);
                f_gbest=f_pbest(i);
            end            
            MINIUM=f_gbest;                    
 end
    data1(run,t)=MINIUM;
    if MINIUM>1e-007
        mean=t;
    end
    
  end
sum1=sum1+mean;  
sum2=sum2+MINIUM;
 %MINIUM
time=cputime-T;
st=st+time;

end
figure
plot(1:200,data1(1,:));
av1=sum1/10  %输出平均收验代数
av2=sum2/10  %输出平均最优解
st/10  %就是最后anw输出的解
        
 