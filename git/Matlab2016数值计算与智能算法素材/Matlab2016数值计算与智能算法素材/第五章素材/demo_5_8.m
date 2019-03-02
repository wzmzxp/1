clear
clc
close
%% 画一个单位立方体
x1=[1 1 1 1 1];
y1=[0 1 1 0 0];
z1=[0 0 1 1 0];
x2=[0 0 0 0 0];
y2=[0 1 1 0 0];
z2=[0 0 1 1 0];
x3=[0 1];
y3=[0 0];
z3=[0 0];
x4=[0 1];
y4=[1 1];
z4=[0 0];
x5=[0 1];
y5=[1 1];
z5=[1 1];
x6=[0 1];
y6=[0 0];
z6=[1 1];
figure(1)
hold on
axis equal
axis([-2 2 -2 2 -2 2])
for i=1:6
    x=strcat('x',num2str(i));
    y=strcat('y',num2str(i));
    z=strcat('z',num2str(i));
    plot3(eval(x),eval(y),eval(z),'k');
end
view(3)
x=[1 1 0 0 1];
y=[0 1 1 0 0];
z=[1 1 1 1 1];
patch(x,y,z,'r')
xlabel('x轴');
ylabel('y轴');
zlabel('z轴');
quiver3(0,0,0,0,0,1,2,'k','filled')
quiver3(0,0,0,0,1,0,2,'k','filled')
quiver3(0,0,0,1,0,0,2,'k','filled')
%% x轴逆时针旋转，掌握旋转矩阵写法，不用死记
% M=[1     0         0;
%    0  cos(pi/3)  -sin(pi/3)
%    0  sin(pi/3)   cos(pi/3)];
% 
% for i=1:6
%     R=M*[eval(strcat('x',num2str(i)));...
%          eval(strcat('y',num2str(i)));...
%          eval(strcat('z',num2str(i)));];
%     plot3(R(1,:),R(2,:),R(3,:),'k')
% end
% R=M*[x;y;z];
% patch(R(1,:),R(2,:),R(3,:),'r')

%% x轴伸缩
% M=[2 0 0;
%    0 1 0;
%    0 0 1;]
% for i=1:6
%     R=M*[eval(strcat('x',num2str(i)));eval(strcat('y',num2str(i)));eval(strcat('z',num2str(i)));];
%     plot3(R(1,:),R(2,:),R(3,:),'k')
% end
% R=M*[x;y;z];
% patch(R(1,:),R(2,:),R(3,:),'r')

%% z轴即xy平面镜像
% M=[1 0 0;
%    0 1 0;
%    0 0 -1;]
% for i=1:6
%     R=M*[eval(strcat('x',num2str(i)));eval(strcat('y',num2str(i)));eval(strcat('z',num2str(i)));];
%     plot3(R(1,:),R(2,:),R(3,:),'k')
% end
% R=M*[x;y;z];
% patch(R(1,:),R(2,:),R(3,:),'r')

%% 沿x轴剪切,z有了x方向分量
% M=[1 0 1.1;
%    0 1 0;
%    0 0 1;]
% for i=1:6
%     R=M*[eval(strcat('x',num2str(i)));eval(strcat('y',num2str(i)));eval(strcat('z',num2str(i)));];
%     plot3(R(1,:),R(2,:),R(3,:),'k')
% end
% R=M*[x;y;z];
% patch(R(1,:),R(2,:),R(3,:),'r')
%% 各项剪切
% M=[ 1   0.1   0.5;
%    0.1   1    0.4;
%    0.2  0.3    1;];
% for i=1:6
%     R=M*[eval(strcat('x',num2str(i)));eval(strcat('y',num2str(i)));eval(strcat('z',num2str(i)));];
%     plot3(R(1,:),R(2,:),R(3,:),'k')
% end
% R=M*[x;y;z];
% patch(R(1,:),R(2,:),R(3,:),'r');
%% 向xy平面投影，也就是说z轴基向量分量全为0
M=[1 0 0;
   0 1 0;
   0 0 0;];
for i=1:6
    R=M*[eval(strcat('x',num2str(i)));eval(strcat('y',num2str(i)));eval(strcat('z',num2str(i)));];
    plot3(R(1,:),R(2,:),R(3,:),'k')
end
R=M*[x;y;z];
patch(R(1,:),R(2,:),R(3,:),'r')
%% 齐次坐标跟二维的也差不多，我们就不讲了

