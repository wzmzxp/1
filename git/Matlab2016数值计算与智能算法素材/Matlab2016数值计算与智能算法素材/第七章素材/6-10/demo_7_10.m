%% 样条插值 spline
%第一种
x=0:0.5:2*pi;
y=sin(x);
xx=0:0.1:2*pi;
yy=spline(x,y,xx);
plot(x,y,'o',xx,yy,'-')
close

% 第二种
x=0:0.5:2*pi;
y=[sin(x);cos(x)];
xx=0:0.1:2*pi;
yy=spline(x,y,xx);
plot(x,y,'o',xx,yy,'-')

% 第三种 取出插值多项式的系数
x=0:0.5:2*pi;
y=sin(x);
p=spline(x,y);
xx=0:0.1:2*pi;
yy=ppval(p,xx);
plot(x,y,'o',xx,yy)

%% pchip
%第一种
x=0:0.5:2*pi;
y=sin(x);
xx=0:0.1:2*pi;
yy=pchip(x,y,xx);
plot(x,y,'o',xx,yy,'-')
% 第二种 取出插值多项式的系数
x=0:0.5:2*pi;
y=sin(x);
p=pchip(x,y);
xx=0:0.1:2*pi;
yy=ppval(p,xx);
plot(x,y,'o',xx,yy)





