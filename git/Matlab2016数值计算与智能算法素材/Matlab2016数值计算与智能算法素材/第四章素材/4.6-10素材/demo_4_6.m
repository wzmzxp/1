clear
clc
x=0:0.1:2*pi;
y=sin(x);
h=plot(x,y);
h.LineStyle=':';
h.Color='r';
h.DisplayName='sin';
set(h,'color','b')
% h.LineWidth=5;
% h.Marker='*';
% h.MarkerEdgeColor='k';
% h.MarkerFaceColor='b';
% h.MarkerIndices=1:3:length(x);
% h.MarkerSize=9;
legend('show')
get(h)
