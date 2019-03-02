function f=demo_9_26_3(x,a)
f=5*exp(0.5*x)*cos(2*x+a)-1.5;
for i=1:10
    f=f+sin(i*x-2-i);
end