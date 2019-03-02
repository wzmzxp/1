%% 匿名函数
% f=@(x) sin(x)+cos(x);
% f1=@(x,y) sin(x)+cos(y);
% f2=@(x,y) @(a) sin(x)+cos(y)+a;
% f3=f2(pi/2,pi/3);
% f3(1);
f=@(x) x.^2+2;
% fplot(f);%默认的x轴范围是[-5 5]
% fplot(f,[-2 2])
% fplot('sin(x)',[-2*pi 2*pi])%在未来的版本中会删除
fplot(@(x)sin(x),[-pi,pi])
%% 参数方程
x=@(t) cos(3*t);
y=@(t) sin(5*t);
fplot(x,y)
%% e怎么输入exp()
fplot(@(x)exp(x+1),[-5 5],'d:b')
hold on
%% 句柄
x=@(t) cos(3*t);
y=@(t) sin(5*t);
fp=fplot(x,y);

