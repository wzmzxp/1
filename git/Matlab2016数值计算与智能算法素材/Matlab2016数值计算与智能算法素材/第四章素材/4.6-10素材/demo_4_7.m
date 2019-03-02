clear
clc
x=0:0.1:2*pi;
y=sin(x);
h=plot(x,y);
h2=gca;
h2.YGrid='on';
h2.XGrid='on';
h2.XMinorGrid = 'on';%��С������
h2.GridLineStyle = '--';%����������
h2.MinorGridLineStyle = '-.';%С����������
h2.XColor='b';%����������������ɫ
h2.GridColor = 'b';%������������ɫ
h2.MinorGridColor = 'b';%����С��������ɫ
h2.GridAlpha = 0.1;%����������͸���ȣ���ֵԽСԽ͸��
h2.MinorGridAlpha = 0.1;%С������͸����
h2.Color='b';
h2.Color=[1 1 1];
h2.Box='off';
h2.LineWidth = 1.5;%�����ᣬ�̶��ߣ������߿��
%get ��ȡ��ǰ������ĸ�������ֵ
set(gca,'XTick',0:pi/2:2*pi);%�����߸��������
set(gca,'XTickLabel',{ '0','pi/2','\pi','2/3\pi','2\pi' })
h2.XMinorTick='on'
h2.XAxisLocation='top'
h2.TickDir='both';
h2.TickLength=[0.01 0.035];
h1=axes('Position',[0.1 0.1 0.7 0.3])
plot(h1,x,y)

