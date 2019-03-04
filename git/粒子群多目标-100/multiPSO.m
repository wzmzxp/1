function XX=multiPSO(fhd,ps,D,VRmin,VRmax,me)
%fhd='runpf_1';
%VRmin=-12;%位置上限
%VRmax=24;%位置下限值
%rand('state',sum(100*clock));
%me=35;%最大迭代次数
%ps=30;%粒子数
%D=10;%粒子位数
cc=[2.05 2.05];   %acceleration constants
if length(VRmin)==1
   VRmin=repmat(VRmin,1,D);
   VRmax=repmat(VRmax,1,D);
end
mv=0.5*(VRmax-VRmin);
VRmin=repmat(VRmin,ps,1);
VRmax=repmat(VRmax,ps,1);
Vmin=repmat(-mv,ps,1);
Vmax=-Vmin;
pos=round(VRmin+(VRmax-VRmin).*rand(ps,D));
mu=2;%目标个数
tt=ones(1,mu);
bb=zeros(1,mu);
for i=1:ps;
   [e1(i,1),e2(i,1)]=feval(fhd,pos(i,:));
end
P=[e1,e2];
A=P;%目标值
B=pos;%解集
m=ps;
%初始化外部解
%% 
i=1;
while (1)
   for j=i+1:m   %% 对劣解置空
       %%
      if  tt==(A(i,:)<A(j,:))
          A(j,:)=[];
          B(j,:)=[];
          i=i-1;
          m=m-1;
       break;
       %%
      else if bb==(A(i,:)<A(j,:))
           A(i,:)=[];
           B(i,:)=[];
           i=i-1;
           m=m-1;
         break;
        end
      end
   end
i=i+1;
[mm,nn]=size(A);
if i>mm                     %% i从1开始上升，mm从m开始下降，当i>mm时，劣解筛选完毕。
   break;
end
if mm<=1
   break;
 end
end

fitcount=ps;
vel=Vmin+2.*Vmax.*rand(ps,D);%initialize the velocity of the particles
pbest=pos;
gbest=pos;
K=0.7295;

for i=2:me
   for k=1:ps
      vel(k,:)=(vel(k,:)+cc(1).*rand(1,D).*(pbest(k,:)-pos(k,:))+cc(2).*rand(1,D).*(gbest(k,:)-pos(k,:)));
      pos(k,:)=round(pos(k,:)+vel(k,:));
      pos(k,:)=round(((pos(k,:)>=VRmin(1,:))&(pos(k,:)<=VRmax(1,:))).*pos(k,:)...
            +(pos(k,:)<VRmin(1,:)).*(VRmin(1,:)+0.25.*(VRmax(1,:)-VRmin(1,:)).*rand(1,D))+(pos(k,:)>VRmax(1,:)).*(VRmax(1,:)-0.25.*(VRmax(1,:)-VRmin(1,:)).*rand(1,D)));
      [e1(k,1),e2(k,1)]=feval(fhd,pos(k,:));
     end
    %找出非支配解
     E=[e1,e2];
    %更新个体极值
     for i=1:ps
         if tt==E(i,:)<P(i,:)
              P(i,:)=E(i,:);
            pbest(i,:)=pos(i,:);
         end
     end
%更新外部集
 A=[E;A];
 B=[pos;B];
 [mm,nn]=size(A);
 m=mm;
%%
 i=1;
while (1)
   for j=i+1:m   %% 对劣解置空
       %%
      if  tt==(A(i,:)<A(j,:))
          A(j,:)=[];
          B(j,:)=[];
          i=i-1;
          m=m-1;
       break;
       %%
      else if bb==(A(i,:)<A(j,:))
           A(i,:)=[];
           B(i,:)=[];
           i=i-1;
           m=m-1;
         break;
        end
      end
  end
i=i+1;
[mm,nn]=size(A);
if i>mm                     %% i从1开始上升，mm从m开始下降，当i>mm时，劣解筛选完毕。
   break;
end
if mm<=1
   break;
 end
end

%更新全局极值
[mm,nn]=size(A);
for i=1:ps
vv=floor(rand*mm)+1;
gbest(i,:)=B(vv,:);
end
end
XX=A;
return