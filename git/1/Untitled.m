clear all
clc
X1=rand(6,6);
X=X1 ;
n=size(X ,1);
m=size(X,2);
s=5;
beta=zeros(n,1);
k=2;
cita=0;
lamada=zeros(n,1);
deta=0;
t=zeros(1,m);
b=zeros(s,n);
alfa=zeros(1,n);
%均值方差矩阵n*2
mede=zeros(n,2);
%第j各决策单元的第r各输出指标的均值
y=zeros(s,n);
for i=1:m
    for j=1:n
        t(i)=t(i)+beta(j)*X(i,j)*lamada(j);
    end
        t(i)=-1*t(i)+cita*X(i,k);
end
t2=zeros(1,s);
for r=1:s
    for j=1:n
       t2(r)=t2(r)+y(r,j)+b(r,j)*deta* norminv([1-alfa(j)],mede(j,1),mede(j,2))*lamada(j);
    end
        t2(r)=t2(r)-y(r,k);
end

