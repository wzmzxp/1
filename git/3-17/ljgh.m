clear
clc

for i = 1:7
    for j = 1:4
        X(i,j) = 4*i+8;
        Y(i,j) = 4*j+0;
    end
end
X = reshape(X,4*7,1);
Y = reshape(Y,4*7,1);
index = randperm(28);
sj0 = [X(index),Y(index)];
sj0 = [ 12,8;
        12,4;
        12,12;
       16,28;
      16,8;
      16,20;
      16,24;
       20,8;
     20,20;
      20,28;
    24,4 
    24,16
    24,24]; %必经点

d1 = [8,0]; %出发点
d2 = [28,0]; %结束点
sj = [d1;sj0;d2];
N = size(sj,1);
d = zeros(N); %距离矩阵d的初始值
for i=1:N
    for j=1:N
        d(i,j) = abs(sj(i,1)-sj(j,1))+abs(sj(i,2)-sj(j,2));
    end
end

w = 10; %w为种群的个数
g = 100; %为进化的代数
rand('state',sum(clock)); %初始化随机数发生器
for k = 1:w  %通过改良圈算法选取初始种群
    c = randperm(N-2); %产生1，...，8的一个全排列  
    c1 = [1,c+1,N]; %生成初始解
    for t = 1:N %该层循环是修改圈 
        flag = 0; %修改圈退出标志
    for m = 1:(N-2)
      for n = m+2:(N-1)
        if d(c1(m),c1(n))+d(c1(m+1),c1(n+1))<d(c1(m),c1(m+1))+d(c1(n),c1(n+1))
           c1(m+1:n) = c1(n:-1:m+1);  flag=1; %修改圈
        end
      end
    end
   if flag==0
      J(k,c1) = 1:N; break %记录下较好的解并退出当前层循环
   end
   end
end
J(:,1) = 0;
J = J/N; %把整数序列转换成[0,1]区间上的实数，即转换成染色体编码
for k = 1:g  %该层循环进行遗传算法的操作 
    A = J; %交配产生子代B的初始染色体
    c = randperm(w); %产生下面交叉操作的染色体对 
    for i = 1:2:(w-1)  
        F = 2+floor((N-2)*rand(1)); %产生交叉操作的地址
        temp = A(c(i),[F:N]); %中间变量的保存值
        A(c(i),[F:N]) = A(c(i+1),[F:N]); %交叉操作
        A(c(i+1),F:N) = temp;  
    end
    by = [];  %为了防止下面产生空地址，这里先初始化
while ~length(by)
    by = find(rand(1,w)<0.1); %产生变异操作的地址
end
B = A(by,:); %产生变异操作的初始染色体
for j = 1:length(by)
   bw = sort(2+floor((N-2)*rand(1,3)));  %产生变异操作的3个地址
   B(j,:) = B(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:N]); %交换位置
end
   G = [J;A;B]; %父代和子代种群合在一起
   [SG,ind1] = sort(G,2); %把染色体翻译成1，...,10的序列ind1
   num = size(G,1);
   long = zeros(1,num); %路径长度的初始值
   for j = 1:num
       for i = 1:(N-1)
           long(j) = long(j)+d(ind1(j,i),ind1(j,i+1)); %计算每条路径长度
       end
   end
     [slong,ind2] = sort(long); %对路径长度按照从小到大排序
     J = G(ind2(1:w),:); %精选前w个较短的路径对应的染色体
     kkk(k) = slong(1);
end
path = ind1(ind2(1),:); %解的路径
flong=slong(1); %路径长度
xx = sj(path,1);
yy = sj(path,2);

huatu1 = [sj;0,0;4,0;32,0];
huatu2 = [X,Y;0,0;4,0;8,0;28,0;32,0];
plot(huatu2(:,1),huatu2(:,2),'.','Color','k','Markersize',12)
hold on;
aa = plot(huatu1(:,1),huatu1(:,2),'o','Color','r','Markersize',8);
width = 1.1;
clr = 'b';
for i = 1:length(xx)-1
    x1 = xx(i);
    y1 = yy(i);
    x2 = xx(i+1);
    y2 = yy(i+1);
    if x1<12
        plot([x1,x2],[y1,y1],'-','Color',clr,'LineWidth',width)
        plot([x2,x2],[y1,y2],'-','Color',clr,'LineWidth',width)
    else
        if x2>24
            plot([x1,x1],[y1,y2],'-','Color',clr,'LineWidth',width)
            plot([x1,x2],[y2,y2],'-','Color',clr,'LineWidth',width)
        else
            plot([x1,x2],[y1,y1],'-','Color',clr,'LineWidth',width)
            plot([x2,x2],[y1,y2],'-','Color',clr,'LineWidth',width)
        end
    end
end
bb = plot([0,32],[0,0],'-','Color',clr,'LineWidth',width);
legend([aa,bb],'位置','路线');
axis([-4,36,-4,36])
set(gca,'XTick',0:4:32)
set(gca,'YTick',0:4:32)
grid on
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
text(0,-1.5,'起点','horiz','center')
text(0,-3,'(终点)','horiz','center')
text(4,-1.5,'换针头点','horiz','center')
text(8,-1.5,'取样点','horiz','center')
text(28,-1.5,'废液点','horiz','center')
text(32,-1.5,'清洗点','horiz','center')
plot([10,26,26,10,10],[2,2,30,30,2],':','Color','m','LineWidth',1.2)
text(18,31,'点样区域','horiz','center')