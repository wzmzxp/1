%title  legend
clear
clc
x=0:0.1:2*pi;
y1=sin(x);
y2=cos(x);
h=plot(x,y1,'--r',x,y2,'-b',x,y1+y2,':k');
title('���Ǻ���ͼ')
title(['\color{red}��',' \color{black}��\color{blue}����ͼ'])
leg=legend([h(1) h(3)],'sin','sin+cos','location','northeast','Orientation','horizontal')
legend('boxoff')
leg.Box='on';
leg.Color='b';