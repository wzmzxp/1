%% 积分 int
syms x x1
y=1/x^2+x1
y1=x^2/(1+x^2)

Iy=int(y,x1)
Iy1=int(y1)

%% 定积分
syms x
y=sin(x)*cos(x)^3 % 0 pi/2
y1=x*atan(x) % 0 1
a=int(y,x,0,pi/2)
b=int(y1,x,0,1)
% 上下限也可是是符号变量
syms t1 t2
a=int(y,x,t1,t2)
b=int(y1,x,t1,t2)
% 无穷
y=(1+x^2)/(1+x^4)
a=double(int(y,x,-inf,inf))

%% 二重积分
syms x y 
w=sin(pi*x/(2*y))
IIW=int( int(w,y,sqrt(x),x), x,1,2) + int ( int(w,y,sqrt(x),2),     x,2,4)
IIW=simplify(IIW)

%% 三重积分
syms x y z rho
rho=x+y+z
W= int( int( int(rho,z,0,1),y,0,1), x,0,1)


