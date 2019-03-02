clear
clc
%% quiver(u,v)
% u=[0.1 0.3 0.5 0.6];
% v=[0.6 0.1 0.5 0.6];
% quiver(u,v)
%% quiver(x,y,u,v)
% syms x y y1
% y=x^3+2*x;
% y1=diff(y,x);
% x1=-5:0.5:5;
% y=double(subs(y,x,x1));
% y1=double(subs(y1,x,x1));
% sita=atan(y1);
% tx=y1.*cos(sita);
% ty=y1.*sin(sita);
% q=quiver(x1,y,tx,ty,0.3);
% hold on 
% plot(x1,y,'r')

%% x,y «æÿ’Û
x=1:0.1:2;
y=x;
[X,Y]=meshgrid(x,y);
u=cos(X).*cos(Y);
v=sin(X).*sin(Y);
quiver(X,Y,u,v)

