%绘制路径示意图 R纪录最短路径
function plotaiwa(a,R)
scatter(a(:,1),a(:,2),'x')
hold on
plot([a(R(1),1),a(R(31),1)],[a(R(1),2),a(R(31),2)])
hold on
for i=2:length(R)
    x0=a(R(i-1),1);
    y0=a(R(i-1),2);
    x1=a(R(i),1);
    y1=a(R(i),2);
    xx=[x0,x1];
    yy=[y0,y1];
    plot(xx,yy)
    hold on
end
