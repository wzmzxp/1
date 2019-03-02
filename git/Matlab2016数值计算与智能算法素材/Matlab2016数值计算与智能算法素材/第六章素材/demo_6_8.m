%% ·ûºÅ¼«ÏŞ limit
syms x b
y=(sin(pi/2+x)-1)/x

a=limit(y,0)
a1=limit(y,b)
a2=limit(y,x,0)
a3=limit(y,x,0,'left')
a4=limit(y,x,0,'right')

syms h x
y=(sin(pi/2+x+h)-1)/x
a=limit(y,h,0)

y=[1/x,x];
a=limit(y,x,inf)



