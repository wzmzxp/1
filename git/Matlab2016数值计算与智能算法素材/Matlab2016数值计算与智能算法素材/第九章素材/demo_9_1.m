syms x
f=@(x) x.^2-6*x -5+log(x);
ezplot(f,[-100 100])
% f1=x.^2-6*x -5+x.^3;
% df=diff(f1)
% a=double(solve(df))
[a,b]=Min_jintui(f,0,0.1)