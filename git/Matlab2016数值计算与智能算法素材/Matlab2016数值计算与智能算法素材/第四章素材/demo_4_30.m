close
clear
clc
%% 画圆
r=3;
t=linspace(0,2*pi,200);
x=r*cos(t);
y=r*sin(t);
plot(x,y);

%% 产生线
l=8;%发生线长度
fx=[r r];
fy=[0 l];
hold on
h=plot(fx,fy,'r','linewidth',1);
h1=plot(r,0,'o','markersize',1);
axis([-4*r 4*r -4*r 4*r])
axis equal
fx=[0;0;1];
fy=[0;l;1];
v = VideoWriter('jiankaixian.avi');
open(v)
for i=linspace(0,pi,500)
    M1=[1  0  r*cos(i);
        0  1  r*sin(i);
        0  0   1;];
    M2=[cos(i)  -sin(i)  0;
        sin(i)  cos(i)   0;
        0      0      1;];
    l1=i*r;
    detax=l1*sin(i);
    detay=-l1*cos(i);
    M3=[1  0  detax;
        0  1  detay;
        0  0    1;];
    fxx=M3*M1*M2*fx;
    fyy=M3*M1*M2*fy;
    axis([-4*r 4*r -4*r 4*r])
    axis equal
    plot(fxx(1),fxx(2),'o','markersize',1)
    h1.XData=fxx(1);
    h1.YData=fxx(2);
    h.XData=[fxx(1),fyy(1)];
    h.YData=[fxx(2),fyy(2)];
    M = getframe;
    M.cdata=imresize(M.cdata,[343,434]);
    pause(0.01)
    writeVideo(v,M);
end
close(v)