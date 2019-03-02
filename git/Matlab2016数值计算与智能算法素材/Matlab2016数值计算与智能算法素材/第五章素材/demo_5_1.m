%% 标准曲面  视角变换

%% 单位圆  sphere
sphere
sphere(60)
[x,y,z]=sphere(60);
mesh(x,y,z)

%% 圆柱 cylinder
cylinder
%指定半径
cylinder(2)
cylinder(2,60)
[x1,y1,z1]=cylinder(2,60);
t=-1:0.02:1;
y2=t+0.1;
cylinder(y2)

%% peaks
peaks
peaks(60)

%% 视角
peaks(60)
xlabel('这是x轴')
ylabel('这是y轴')
view(30,60)
view([50 60])
view(2)
view(3)
