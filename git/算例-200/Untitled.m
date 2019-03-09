clear all
% sigmax=0;sigmay=0;sigmaz=0;H=106.3227-101.0689*exp(-0.0763*4)
t=180;Q=8000;
% a1=Q/(power(2*pi,3/2)*sigmax*sigmay*sigmaz)
% a2=exp(-0.5*(power((x-u*t),2)/power(sigmax,2)+y*y/(sigmay*sigmay)))
% a3=exp(-0.5*(power((z+H),2)/power(sigmaz,2)+power((z-H),2)/power(sigmaz,2)))
d=10;
y=-200:d:200;
x=0:d:300;
z=1;
[Q,H]=meshgrid(x,y);

for i=1:size(Q,1)
    for j=1:size(Q,2)
            Z(i,j)=C(Q(i,j),H(i,j),z,t);
%            Z(i,j)=quad(@jifen,0,100);
    end
end
mesh(Q,H,Z)


% global  x y z
% x=0.72;y=0.93;z=0.8;
% r=quad(@jifen,0,100);
% r