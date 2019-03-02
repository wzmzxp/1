clear
clc
%% animatedline
x=linspace(0,2*pi,100000);
y=sin(x);
ax1=subplot(2,1,1);
axis([0 2*pi -1 1])
ax2=subplot(2,1,2);
axis([0 2*pi -1 1])
h=animatedline(ax1,x(1:50000),y(1:50000));
h1=animatedline(ax2);
h1.MaximumNumPoints=100;

for i=50001:100000
    addpoints(h,x(i),y(i));
    drawnow limitrate
end

x1=linspace(0,2*pi,1000);
y1=cos(x1);
for i=1:1000
    addpoints(h1,x1(i),y1(i));
    drawnow 
end
[xx,yy]=getpoints(h);
% clearpoints(h1)
%% drawnow
% figure
% hold on
% axis([0 10000 0 100000000])
% a=tic;
% for i=2:10000
%     x(i)=i;
%     y(i)=i^2;
%     plot([x(i-1),x(i)],[y(i-1),y(i)],'k')
%     b=toc(a);
%     if b > 1/2000
%         drawnow
%         a=tic;
%     end
% end