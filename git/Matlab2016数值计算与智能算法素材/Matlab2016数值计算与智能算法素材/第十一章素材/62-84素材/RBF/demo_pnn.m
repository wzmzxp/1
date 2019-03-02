%% 概率神经网络分类
P = [1 2; 2 2; 1 1]';
Tc = [1 2 3];
plot(P(1,:),P(2,:),'.','markersize',30)
for i=1:3, text(P(1,i)+0.1,P(2,i),sprintf('class %g',Tc(i))), end
axis([0 3 0 3])
title('3个样本向量')
xlabel('P(1,:)')
ylabel('P(2,:)')
%%
T = ind2vec(Tc);
spread = 1;
net = newpnn(P,T,spread);
A = sim(net,P);
Ac = vec2ind(A);
plot(P(1,:),P(2,:),'o','markersize',10)
axis([0 3 0 3])
for i=1:3,text(P(1,i)+0.1,P(2,i),sprintf('class %g',Ac(i))),end
title('网络仿真测试结果')
xlabel('P(1,:)')
ylabel('P(2,:)')
%%
p = [2; 1.5];
a = sim(net,p);
ac = vec2ind(a);
hold on
plot(p(1),p(2),'.','markersize',30,'color',[1 0 0])
text(p(1)+0.1,p(2),sprintf('class %g',ac))
hold off
title('新输入样本的分类仿真结果')
xlabel('P(1,:) and p(1)')
ylabel('P(2,:) and p(2)')
%%
p1 = 0:.05:3;
p2 = p1;
[P1,P2] = meshgrid(p1,p2);
pp = [P1(:) P2(:)]';
aa = sim(net,pp);
aa = full(aa);
m = mesh(P1,P2,reshape(aa(1,:),length(p1),length(p2)));
%%
set(m,'facecolor',[0 0.5 1],'linestyle','none');
hold on
m = mesh(P1,P2,reshape(aa(2,:),length(p1),length(p2)));
set(m,'facecolor',[0 1.0 0.5],'linestyle','none');
m = mesh(P1,P2,reshape(aa(3,:),length(p1),length(p2)));
set(m,'facecolor',[0.5 0 1],'linestyle','none');
plot3(P(1,:),P(2,:),[1 1 1]+0.1,'.','markersize',30)
%%
plot3(p(1),p(2),1.1,'.','markersize',30,'color',[1 0 0])
hold off
view(2)
title('3类划分区域')
xlabel('P(1,:) and p(1)')
ylabel('P(2,:) and p(2)')