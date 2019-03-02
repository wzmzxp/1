function D=duoxiangshi(X,Y)
A=vander(X)
Y=Y'
B=[A,Y]
C=rref(B)
D=C(:,end)
fprintf('\n  这是一个%d阶的多项式，从高阶到低阶排列！\n',length(Y)-1);

plot(X,Y','o');
hold on 
x=X(1):0.01:X(end);
y=polyval(D,x)
plot(x,y)