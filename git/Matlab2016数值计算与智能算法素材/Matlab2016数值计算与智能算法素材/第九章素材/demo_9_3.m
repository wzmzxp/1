syms x
f=@(x) x.^3-6*x+9;
ezplot(f)
[a,b]=Min_jintui(f,0,0.001);
[fx,x]=huangjin(f,[a b],100)  % a º¯ÊýÖµ  bºá×ø±ê