clear
close
clc
%% bar
year=1948:10:2008;
num=[203 660 NaN 871.5 1061 1245.6 1695];
% bar(year,num)

%��һ���ص���ͼ
% h1=gca;
% h1.Box='off';
% h2=axes('Position',get(h1,'Position'));
% plot(h2,year,num)
% h2.YAxisLocation='right';
% h2.YLim=h1.YLim;
% h2.XLim=h1.XLim;
% h2.XTick=[];
% h2.XTickLabel=[];
% h2.Color='none';

%�ڶ��ֵ���
plotyy(year,num,year,num,'bar','plot');

%% ���� �Ϻ� �����˿ڱ任
close
year=1948:10:2008;
num=[203 200 1.5;660 560 2;NaN 600 4;871.5 700 7.56;1061 956 15.3;1245.6 1123 34.07; 1695 1563 876;];
b=bar(year,num);
hh=legend('������','�Ϻ���','������');
hh.Location='Northwest';
b(1).EdgeColor='red';
b(1).FaceColor=[0.3 0.5 0.1];


%% barh
close
barh(year,num)

%% bar3
close
bar3(year,num)
xlabel('x��')
ylabel('y��')
zlabel('z��')




