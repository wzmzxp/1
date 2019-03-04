function [X,fval,e,g] = pso_2(fhd,N,D,~,~,MaxDT,x)
format long;
%------给定初始化条件----------------------------------------------
c1=1.4962;             %学习因子1
c2=1.4962;             %学习因子2
w=0.7298;              %惯性权重
%MaxDT=1000;            %最大迭代次数
%D=10;                  %搜索空间维数（未知数个数）
%N=40;                  %初始化群体个体数目
eps=10^(-6);           %设置精度(在已知最小值时候用)
%------初始化种群的个体(可以在这里限定位置和速度的范围)------------
for i=1:N
    for j=1:D
        %x(i,j)=randi(VRmax); %随机初始化位置
        v(i,j)=randn; %随机初始化速度
    end
end
%------先计算各个粒子的适应度，并初始化Pi和Pg----------------------

for i=1:N
    p(i)=feval(fhd,x(i,:));
    y(i,:)=x(i,:);
end
e(1,1)=0;
g(1,1)=min(p);
pg=x(1,:);             %Pg为全局最优
for i=2:N
    if feval(fhd,x(i,:))<feval(fhd,pg)
        pg=x(i,:);
    end
end
%------进入主要循环，按照公式依次迭代，直到满足精度要求------------
for t=1:MaxDT
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        
        if feval(fhd,x(i,:))<p(i)
            p(i)=feval(fhd,x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i)<feval(fhd,pg)
            pg=y(i,:);
        end
    end
   pbest(t)=feval(fhd,pg);
   e(t+1,1)=t;
   g(t+1,1)=pbest(t);
end
%------最后给出计算结果
%disp('*************************************************************')
%disp('函数的全局最优位置为：')
X=round(pg);
%disp('最后得到的优化极值为：')
fval=feval(fhd,pg);
%disp('*************************************************************') 
return