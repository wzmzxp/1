t=0:0.01:1;
rho=2*sin(t*2*pi)+6*cos(t*2*pi*2*pi);
sita=t*2*pi;
phi=log(1+t*2*pi).*t*2*pi;

x=rho.*sin(sita).*cos(phi);
y=rho.*sin(sita).*sin(phi);
z=rho.*cos(sita);

plot3(x,y,z,'b--');