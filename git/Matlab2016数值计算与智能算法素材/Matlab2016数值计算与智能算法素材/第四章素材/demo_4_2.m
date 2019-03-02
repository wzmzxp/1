x=0:0.01:2*pi;
y=sin(x);
plot(x,y,'-o','markerindices',[1:10:length(x),length(x)]);%标记的间隔标记
% hold on
% plot([x(1:10:end),x(end)],[y(1:10:end),y(end)],'o')

%网格
grid on%打开网格
% grid off
grid minor

%边框
% box off
% box on

%坐标轴
% axis([0 8 -2 2])
% axis([-1 inf  -inf 2])
axis auto%自动模式
axis tight%紧凑模式
axis equal%横纵坐标轴间隔相等模式
axis square%绘图窗口的方框模式
axis off%关了所有的模式

