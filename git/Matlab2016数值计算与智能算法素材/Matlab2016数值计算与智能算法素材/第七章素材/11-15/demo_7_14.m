%% polyfit   polyval
% x=linspace(0,2*pi,10);
% y=sin(x);
% P=polyfit(x,y,7)
% poly2str(P,'x');
% x1=linspace(0,2.5*pi,100);
% y1=polyval(P,x1);
% plot(x,y,'o',x1,y1)

x=linspace(1000,2000,10);
y=1e5*[0.02 0.04 0.05 0.055 0.5 0.6 0.9 1.52 2.3 3.6];
plot(x,y,'o')
hold on
x1=linspace(1000,2000,100);
[P,~,mu]=polyfit(x,y,6);
y1=polyval(P,x1,[],mu);
plot(x1,y1)







