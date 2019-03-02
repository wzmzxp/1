%% ezplot  easyplot
% ezplot('x^3+x^2+2') 默认范围[-2*pi 2*pi]
ezplot('x^3+x^2+2')
ezplot('x^3+x^2+2',[-5 5])

%匿名函数句柄
f=@(x) x.^2;
ezplot(f)

%隐函数 e^x+y^2+-2=0
ezplot('exp(x)+y^2-2',[-5 5 -5 4])

%参数方程
syms fai
r=input('输入圆半径：');
x=r*(cos(fai)+fai*sin(fai));
y=r*(sin(fai)-fai*cos(fai));
ezplot(x,y)
axis([-4*r 4*r -4*r 4*r])
hold on
x1=r*sin(fai);
y1=r*cos(fai);
ezplot(x1,y1)

