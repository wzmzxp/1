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
    24,24]; %�ؾ���

d1 = [8,0]; %������
d2 = [28,0]; %������
sj = [d1;sj0;d2];
N = size(sj,1);
d = zeros(N); %�������d�ĳ�ʼֵ
for i=1:N
    for j=1:N
        d(i,j) = abs(sj(i,1)-sj(j,1))+abs(sj(i,2)-sj(j,2));
    end
end

w = 10; %wΪ��Ⱥ�ĸ���
g = 100; %Ϊ�����Ĵ���
rand('state',sum(clock)); %��ʼ�������������
for k = 1:w  %ͨ������Ȧ�㷨ѡȡ��ʼ��Ⱥ
    c = randperm(N-2); %����1��...��8��һ��ȫ����  
    c1 = [1,c+1,N]; %���ɳ�ʼ��
    for t = 1:N %�ò�ѭ�����޸�Ȧ 
        flag = 0; %�޸�Ȧ�˳���־
    for m = 1:(N-2)
      for n = m+2:(N-1)
        if d(c1(m),c1(n))+d(c1(m+1),c1(n+1))<d(c1(m),c1(m+1))+d(c1(n),c1(n+1))
           c1(m+1:n) = c1(n:-1:m+1);  flag=1; %�޸�Ȧ
        end
      end
    end
   if flag==0
      J(k,c1) = 1:N; break %��¼�½ϺõĽⲢ�˳���ǰ��ѭ��
   end
   end
end
J(:,1) = 0;
J = J/N; %����������ת����[0,1]�����ϵ�ʵ������ת����Ⱦɫ�����
for k = 1:g  %�ò�ѭ�������Ŵ��㷨�Ĳ��� 
    A = J; %��������Ӵ�B�ĳ�ʼȾɫ��
    c = randperm(w); %�������潻�������Ⱦɫ��� 
    for i = 1:2:(w-1)  
        F = 2+floor((N-2)*rand(1)); %������������ĵ�ַ
        temp = A(c(i),[F:N]); %�м�����ı���ֵ
        A(c(i),[F:N]) = A(c(i+1),[F:N]); %�������
        A(c(i+1),F:N) = temp;  
    end
    by = [];  %Ϊ�˷�ֹ��������յ�ַ�������ȳ�ʼ��
while ~length(by)
    by = find(rand(1,w)<0.1); %������������ĵ�ַ
end
B = A(by,:); %������������ĳ�ʼȾɫ��
for j = 1:length(by)
   bw = sort(2+floor((N-2)*rand(1,3)));  %�������������3����ַ
   B(j,:) = B(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:N]); %����λ��
end
   G = [J;A;B]; %�������Ӵ���Ⱥ����һ��
   [SG,ind1] = sort(G,2); %��Ⱦɫ�巭���1��...,10������ind1
   num = size(G,1);
   long = zeros(1,num); %·�����ȵĳ�ʼֵ
   for j = 1:num
       for i = 1:(N-1)
           long(j) = long(j)+d(ind1(j,i),ind1(j,i+1)); %����ÿ��·������
       end
   end
     [slong,ind2] = sort(long); %��·�����Ȱ��մ�С��������
     J = G(ind2(1:w),:); %��ѡǰw���϶̵�·����Ӧ��Ⱦɫ��
     kkk(k) = slong(1);
end
path = ind1(ind2(1),:); %���·��
flong=slong(1); %·������
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
legend([aa,bb],'λ��','·��');
axis([-4,36,-4,36])
set(gca,'XTick',0:4:32)
set(gca,'YTick',0:4:32)
grid on
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
text(0,-1.5,'���','horiz','center')
text(0,-3,'(�յ�)','horiz','center')
text(4,-1.5,'����ͷ��','horiz','center')
text(8,-1.5,'ȡ����','horiz','center')
text(28,-1.5,'��Һ��','horiz','center')
text(32,-1.5,'��ϴ��','horiz','center')
plot([10,26,26,10,10],[2,2,30,30,2],':','Color','m','LineWidth',1.2)
text(18,31,'��������','horiz','center')