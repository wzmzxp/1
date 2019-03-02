%% 单变量最小化
f=@(x) exp(-2*x)*sin(3*x-2)+5*exp(0.5*x)*cos(x)-1.5;
ezplot(f,[0 5])
[x,fval]=fminbnd(f,2,4)

%% 额外参数
a=2;
f=@(x) exp(-2*x)*sin(3*x-2)+5*exp(0.5*x)*cos(x+a)-1.5;
ezplot(f,[0 5])
[x,fval]=fminbnd(f,2,4)

%% 文件形式
[x,fval]=fminbnd(@demo_9_26_1,2,4);

%% 文件形式当中有额外参数
[x,fval]=fminbnd(@demo_9_26_2,2,4,[],2);

%% 循环
a=2;
f=@(x) sin(x-2-1)+sin(2*x-2-2)+sin(3*x-2-3)+sin(4*x-2-4)+sin(5*x-2-5)+sin(6*x-2-6)+sin(7*x-2-7)+sin(8*x-2-8)+sin(9*x-2-9)+sin(10*x-2-10)+5*exp(0.5*x)*cos(2*x+a)-1.5;
ezplot(f,[0 5])
[x,fval]=fminbnd(f,2,4)
[x,fval]=fminbnd(@demo_9_26_3,2,4,[],2)






