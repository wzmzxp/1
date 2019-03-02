clear
close
clc
%% bar
year=1948:10:2008;
num=[203 660 NaN 871.5 1061 1245.6 1695];
% bar(year,num)

%第一种重叠绘图
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

%第二种叠绘
plotyy(year,num,year,num,'bar','plot');

%% 北京 上海 深圳人口变换
close
year=1948:10:2008;
num=[203 200 1.5;660 560 2;NaN 600 4;871.5 700 7.56;1061 956 15.3;1245.6 1123 34.07; 1695 1563 876;];
b=bar(year,num);
hh=legend('北京市','上海市','深圳市');
hh.Location='Northwest';
b(1).EdgeColor='red';
b(1).FaceColor=[0.3 0.5 0.1];


%% barh
close
barh(year,num)

%% bar3
close
bar3(year,num)
xlabel('x轴')
ylabel('y轴')
zlabel('z轴')




