% 符号函数的三维图形绘制
%% ezplot3
syms t
x=sin(t)+1;
y=cos(t);
z=t;
ezplot3(x,y,z)
ezplot3(x,y,z,[0 4*pi])
ezplot3(x,y,z,[0 4*pi],'animate')
%% ezmesh 三维网格图
syms x y
z=x^2+y^2;
ezmesh(z)
ezmesh(z,[-2*pi 2*pi -2*pi 3*pi])
ezmesh(z,[-2*pi 2*pi -2*pi 3*pi],10)%60

% 空间参数方程
syms u v 
x=u^2-v;
y=u+v;
z=u-2*v;
ezmesh(x,y,z,[-2*pi 2*pi -2*pi 3*pi])
%% ezmeshc
syms x y
z=x^2+y^2;
ezmeshc(z)
ezmeshc(z,[-2*pi 2*pi -2*pi 3*pi])
ezmeshc(z,[-2*pi 2*pi -2*pi 3*pi],10)%60

% 空间参数方程
syms u v 
x=u^2-v;
y=u+v;
z=u-2*v;
ezmeshc(x,y,z,[-2*pi 2*pi -2*pi 3*pi])
%% ezsurf
syms u v 
x=u^2-v;
y=u+v;
z=u-2*v;
ezsurf(x,y,z,[-2*pi 2*pi -2*pi 3*pi])
%% ezsurf
syms x y
z=x^2+y^2;
ezsurf(z)
ezsurf(z,[-2*pi 2*pi -2*pi 3*pi])
ezsurf(z,[-2*pi 2*pi -2*pi 3*pi],10)%60

% 空间参数方程
syms u v 
x=u^2-v;
y=u+v;
z=u-2*v;
ezmeshc(x,y,z,[-2*pi 2*pi -2*pi 3*pi])
%% ezsurfc
syms x y
z=x^2+y^2;
ezsurfc(z)
ezsurfc(z,[-2*pi 2*pi -2*pi 3*pi])
ezsurfc(z,[-2*pi 2*pi -2*pi 3*pi],10)%60

% 空间参数方程
syms u v 
x=u^2-v;
y=u+v;
z=u-2*v;
ezsurfc(x,y,z,[-2*pi 2*pi -2*pi 3*pi])
%% ezcontour
syms x y
z=x^2+y^2;
ezcontour(z)
ezcontour(z,[-2*pi 2*pi -2*pi 3*pi],5)
%% ezcontourf
syms x y
z=x^2+y^2;
ezcontourf(z)
ezcontourf(z,[-2*pi 2*pi -2*pi 3*pi],5)

