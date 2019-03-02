clear
clc
t=0:0.01:3;
v=10;
g=-9.8;
x=v*t;
y=0.5*g*t.^2;
comet(x,y,0);

%% comet3()
close
t=0:0.001:1;
r=8*t;
sita=2*pi*t*4;
fai=-2*pi*t*8;
[x,y,z]=sph2cart(fai,pi/2-sita,r);
comet3(x,y,z,0.3)

