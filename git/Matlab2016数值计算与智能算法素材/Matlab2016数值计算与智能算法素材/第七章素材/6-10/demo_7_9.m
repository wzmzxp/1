%以2018年1月18号南京市秦淮区的天气温度为例  被插值函数为单变量函数，故为1维插值
tem=[2 2 0 2 2 2 2 3 5 7 9 10 11 12 12 11 10 9 7 7 6 6 5 5];
time=1:24;
plot(time,tem,'o')
hold on

% 第一种用法
xq=1:0.5:24;
vq=interp1(time,tem,xq);
plot(xq,vq)
close

% 第二种
% linear  连续
% nearest 
% next
% previous
% pchip 保形分段三次插值
% cubic 
% v5cubic
% spline

% 线性
subplot(2,3,1)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'linear');
plot(xq,vq,'*')
title('linear')

% 临近点
subplot(2,3,2)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'nearest');
plot(xq,vq,'*')
title('nearest')

% next
subplot(2,3,3)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'next');
plot(xq,vq,'*')
title('next')


% previous
subplot(2,3,4)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'previous');
plot(xq,vq,'*')
title('previous')

% pchip
subplot(2,3,5)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'pchip');
plot(xq,vq,'*')
title('pchip')

% spline
subplot(2,3,6)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'spline');
plot(xq,vq,'*')
title('spline')
close
% 第三种
x=0:0.5:2*pi;
y=sin(x);
p=interp1(x,y,'spline','pp');
yy=ppval(p,linspace(0,2*pi,101))
plot(x,y,'o',linspace(0,2*pi,101),yy)

% 第四种
x=0:0.5:2*pi;
y=sin(x);
xi=-1:0.2:7;
p=interp1(x,y,xi,'spline')
p=interp1(x,y,xi,'linear','extrap')
plot(x,y,'o',xi,p)
% next
p=interp1(x,y,xi,'nearest',9)



