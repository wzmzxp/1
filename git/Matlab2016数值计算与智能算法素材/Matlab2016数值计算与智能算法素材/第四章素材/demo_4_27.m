clear
clc
close
point1=[0 ,1];
point2=[cos(18/180*pi),sin(18/180*pi)];
point3=[cos(54/180*pi),-sin(54/180*pi)];
point4=[-cos(54/180*pi),-sin(54/180*pi)];
point5=[-cos(18/180*pi),sin(18/180*pi)];
x=[point1(1),point3(1),point5(1),point2(1),point4(1),point1(1)];
y=[point1(2),point3(2),point5(2),point2(2),point4(2),point1(2)];
h1=plot(x,y)
hold on
axis equal
axis([-2 2 -2 2])
plot([0 0],[-1 1.5],':b','Linewidth',1)
% delete(h1)
% for i=1:100
%     M=[cos(10*pi/100*i) 0;
%       0       1;];
%     wx=M*[x;y];
%     h=plot(wx(1,:),wx(2,:),'k');
%     axis equal
%     axis([-2 2 -2 2])
%     pause(0.1)
%     delete(h)
% end
%%
for i=1:100
    M=[cos(10*pi/100*i) 0;
      0       1;];
    wx=M*[x;y];
    h1.XData=wx(1,:);
    h1.YData=wx(2,:);
    axis equal
    axis([-2 2 -2 2])
    pause(0.1)
end


