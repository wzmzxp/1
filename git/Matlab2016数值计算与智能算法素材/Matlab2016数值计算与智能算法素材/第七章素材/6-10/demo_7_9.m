%��2018��1��18���Ͼ����ػ����������¶�Ϊ��  ����ֵ����Ϊ��������������Ϊ1ά��ֵ
tem=[2 2 0 2 2 2 2 3 5 7 9 10 11 12 12 11 10 9 7 7 6 6 5 5];
time=1:24;
plot(time,tem,'o')
hold on

% ��һ���÷�
xq=1:0.5:24;
vq=interp1(time,tem,xq);
plot(xq,vq)
close

% �ڶ���
% linear  ����
% nearest 
% next
% previous
% pchip ���ηֶ����β�ֵ
% cubic 
% v5cubic
% spline

% ����
subplot(2,3,1)
xq=1:0.5:24;
vq=interp1(time,tem,xq,'linear');
plot(xq,vq,'*')
title('linear')

% �ٽ���
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
% ������
x=0:0.5:2*pi;
y=sin(x);
p=interp1(x,y,'spline','pp');
yy=ppval(p,linspace(0,2*pi,101))
plot(x,y,'o',linspace(0,2*pi,101),yy)

% ������
x=0:0.5:2*pi;
y=sin(x);
xi=-1:0.2:7;
p=interp1(x,y,xi,'spline')
p=interp1(x,y,xi,'linear','extrap')
plot(x,y,'o',xi,p)
% next
p=interp1(x,y,xi,'nearest',9)



