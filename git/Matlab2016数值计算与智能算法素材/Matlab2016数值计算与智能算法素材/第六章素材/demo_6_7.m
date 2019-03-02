% quadl quadv dblquad triplequad 
% integral  integral2  integral3
%% integral
y=@(x) 1./(sqrt(4-x.^2));
q=integral(y,0,2-eps)

y=@(x) (1+x.^2)./(1+x.^4);
q=integral(y,-inf,inf)

% 函数可以带参数
y=@(x,c) (1+x.^2)./(c+x.^4);
q=integral(@(x) y(x,5),-inf,inf)

% 向量积分
y=@(x) (1:6)*x;
q=integral(y,0,1,'ArrayValued',true)

% 设置误差
y=@(x) log(x);
q=integral(y,0,1)
q1=integral(y,0,1,'RelTol',1e-19,'AbsTol',1e-15)

%% 二重积分 integral2
w=@(x,y) sin(pi*x./(2.*y));
ymin=@(x) sqrt(x);
ymax=@(x) x;
q=integral2(w,1,2,ymin,ymax)

a=2;
w=@(x,y) a*sin(pi*x./(2.*y));
ymin=@(x) sqrt(x);
ymax=@(x) x;
q=integral2(w,1,2,ymin,ymax)

% 积分方法 tiled 用于有限区间   iterated
f=@(x,y) exp(-(x.^2+y.^2));
a=integral2(f,-inf,inf,-inf,inf,'method','tiled')
a=integral2(f,-inf,inf,-inf,inf,'method','iterated')

%% 三重积分 integral3
rho=@(x,y,z) x+y+z;
w=integral3(rho,0,1,0,1,0,1)

w=@(x,y,z) z;
ymin=@(x) -sqrt(1-x.^2);
ymax=@(x) sqrt(1-x.^2);
zmin=@(x,y) x.^2+y.^2;
zmax=@(x,y) sqrt(2-x.^2-y.^2);

q=integral3(w,-1,1,ymin,ymax,zmin,zmax)




