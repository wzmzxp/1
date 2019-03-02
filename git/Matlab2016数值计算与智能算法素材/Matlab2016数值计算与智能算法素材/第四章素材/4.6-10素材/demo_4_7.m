clear
clc
x=0:0.1:2*pi;
y=sin(x);
h=plot(x,y);
h2=gca;
h2.YGrid='on';
h2.XGrid='on';
h2.XMinorGrid = 'on';%打开小网格线
h2.GridLineStyle = '--';%网格线线型
h2.MinorGridLineStyle = '-.';%小网格线线型
h2.XColor='b';%设置坐标轴框边线颜色
h2.GridColor = 'b';%设置网格线颜色
h2.MinorGridColor = 'b';%设置小网格线颜色
h2.GridAlpha = 0.1;%设置网格线透明度，数值越小越透明
h2.MinorGridAlpha = 0.1;%小网格线透明度
h2.Color='b';
h2.Color=[1 1 1];
h2.Box='off';
h2.LineWidth = 1.5;%坐标轴，刻度线，网格线宽度
%get 获取当前坐标轴的各种属性值
set(gca,'XTick',0:pi/2:2*pi);%坐标线格控制与标记
set(gca,'XTickLabel',{ '0','pi/2','\pi','2/3\pi','2\pi' })
h2.XMinorTick='on'
h2.XAxisLocation='top'
h2.TickDir='both';
h2.TickLength=[0.01 0.035];
h1=axes('Position',[0.1 0.1 0.7 0.3])
plot(h1,x,y)

