x=0:0.01:2*pi;
y=sin(x);
plot(x,y,'-o','markerindices',[1:10:length(x),length(x)]);%��ǵļ�����
% hold on
% plot([x(1:10:end),x(end)],[y(1:10:end),y(end)],'o')

%����
grid on%������
% grid off
grid minor

%�߿�
% box off
% box on

%������
% axis([0 8 -2 2])
% axis([-1 inf  -inf 2])
axis auto%�Զ�ģʽ
axis tight%����ģʽ
axis equal%���������������ģʽ
axis square%��ͼ���ڵķ���ģʽ
axis off%�������е�ģʽ

