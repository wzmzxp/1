clear
clc
a=imread('timg.jpg');
imshow(a);
%% getpts
% [x,y]=getpts(gcf);%右键结束选取
%% ginput
% [x,y,button]=ginput(3);

%% mapminmax
% x1=[1 2 3.6 8 9];
% [x11,ps]=mapminmax(x1,5,10);
% x12=mapminmax('reverse',x11,ps)
% c=5;
% cc=mapminmax('apply',c,ps)
% button=1;
% i=1;
% while button ==1
%     [x(i),y(i),button]=ginput(1);
%     i=i+1;
% end

[x,y]=getpts(gcf);
X=input('请输入坐标点：');
x1=mapminmax(x',X(1),X(3))
y1=mapminmax(y',X(2),X(4))
plot(x1,y1)



