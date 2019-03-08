clear all
t=100;
z=15;
d=5;
[X,Y]=meshgrid(-200:d:200,0:d:300)
for i=1:size(X,1)
    for j=1:size(X,2)
        Z(i,j)=C(X(i,j),Y(i,j),z,t);
    end
end
mesh(X,Y,Z)



global  x y z
[X,Y]=meshgrid(-200:d:200,0:d:300);
for i=1:size(X,1)
    for j=1:size(X,2)
        x=X(i,j);y=Y(i,j);z=15;
        Z(i,j)=quad(@jifen,0,100);
    end
end
mesh(X,Y,Z)
r