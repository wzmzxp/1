%% ������ֵ spline
%��һ��
x=0:0.5:2*pi;
y=sin(x);
xx=0:0.1:2*pi;
yy=spline(x,y,xx);
plot(x,y,'o',xx,yy,'-')
close

% �ڶ���
x=0:0.5:2*pi;
y=[sin(x);cos(x)];
xx=0:0.1:2*pi;
yy=spline(x,y,xx);
plot(x,y,'o',xx,yy,'-')

% ������ ȡ����ֵ����ʽ��ϵ��
x=0:0.5:2*pi;
y=sin(x);
p=spline(x,y);
xx=0:0.1:2*pi;
yy=ppval(p,xx);
plot(x,y,'o',xx,yy)

%% pchip
%��һ��
x=0:0.5:2*pi;
y=sin(x);
xx=0:0.1:2*pi;
yy=pchip(x,y,xx);
plot(x,y,'o',xx,yy,'-')
% �ڶ��� ȡ����ֵ����ʽ��ϵ��
x=0:0.5:2*pi;
y=sin(x);
p=pchip(x,y);
xx=0:0.1:2*pi;
yy=ppval(p,xx);
plot(x,y,'o',xx,yy)





