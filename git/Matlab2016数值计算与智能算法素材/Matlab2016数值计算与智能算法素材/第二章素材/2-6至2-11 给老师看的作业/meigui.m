clear
clc

k=10;
n=4;
sita=0:0.01:2*pi;
r=k*sin(n*sita);
polar(sita,r,'r:')