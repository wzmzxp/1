clear
clc
x=0:0.05:2*pi;
y=sin(x);
plot(x,y);
%%
% text(x(50),y(50),'sin')
% text(x(50),y(50)+0.1,'sin')
%%
% h=text(x(50),y(50)+0.1,'sin','color','r','fontsize',15,'fontname','Times New Roman');
% h.FontAngle='it';
% h.Color='blue';
%%
% text(x(50),y(50),['y=',num2str(y(50))])
% str=['y=',num2str(y(50))];
% text(x(50),y(50),str)

% text(x(50),y(50)+0.1,['\fontname{Times New Roman}y=sin(\it x\rm )',num2str(y(50))])%����������ɫ���������ƣ�б�壬������ŵȵ�
%�����ʾ
% text([x(50),x(70)],[y(50),y(70)],{['y=',num2str(y(50))],['y=',num2str(y(70))]})
%������ʾ
text([x(50),x(70)],[y(50),y(70)],{{['\leftarrow','y=',num2str(y(50)),'\pi'],['y=',num2str(y(70))]},['y=',num2str(y(70))]})
