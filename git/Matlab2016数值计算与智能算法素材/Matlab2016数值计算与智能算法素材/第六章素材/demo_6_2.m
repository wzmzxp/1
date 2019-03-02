% 符号表达式的整理
%% 化简
syms a b
y=(cot(a/2)-tan(a/2))*(1+tan(a)*tan(a/2));
y=simplify(y);
% y=simple(y)  已经删除
%% 因式分解
syms m n x
y=-24*m^2*x-16*n^2*x
y=factor(y);
y1=m^3-n^3
y1=factor(y1);
y2=factor(104);
%% 展开
syms a x
y=a*(x^2-a)^2+(x-2);
y=expand(y)
%% 合并
syms x y
z=(x+y)^2*y+5*y*x-2*x^3;
z=collect(z,y)
%% 计算分子与分母
syms x y
z=1/x*y+x/(x^2-2*y)
[z1,z2]=numden(z)%z1分子，z2分母
%有理数
[z1,z2]=numden(sym(3.14159))
%% pretty
% mupad
syms a b c
M1=[cos(a) sin(b);
    -sin(c) cos(b);];
M2=[1/2*a+b c/b^2;
    (a+b)/c   c];
M=M1*M2;
M=M(1)*M(2)*M(3)*M(4);
pretty(M);
%% 反函数
syms x y
z=x+y
z1=finverse(z,x)
z2=finverse(z,y)
%% 函数复合
syms x y z g h
z=x^2+y-2*x
g=cos(h)
z=compose(z,g,'x','h')

z=x^2+2/x;
g=sin(x);
z=compose(z,g)

%% 嵌套
syms x y
y=2*x^6-3*x^3-5*x^2+12;
y=horner(y)


