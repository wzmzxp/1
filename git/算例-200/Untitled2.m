clear all

t=120;
d=1;
y=-200:d:200;
x=0:d:300;
z=1;
[Q,H]=meshgrid(x,y);

for i=1:size(Q,1)
    for j=1:size(Q,2)
            Z(i,j)=C(Q(i,j),H(i,j),z,t);
    end
end
mesh(Q,H,Z)

d=10;
clear Z
global  x y z
[X,Y]=meshgrid(-200:d:200,0:d:300);
for i=1:size(X,1)
    for j=1:size(X,2)
        x=X(i,j);y=Y(i,j);z=15;
        Z(i,j)=quad(@jifen,0,t);
    end
end
figure(2)
mesh(X,Y,Z)
