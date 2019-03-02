% griddata
x1=linspace(-5,5,20);
y1=linspace(-5,5,20);
[X,Y]=meshgrid(x1,y1);
Z=X.^2+Y.^2;

x=[1 5 2 3 4 8 2 0 4 -1 -6 -5 5 2 5 4 3 4 1];
y=[2 3 5 4 7 5 -3 5 3 6 -6  5 -5 1 8 3 0 1 8];
z=x.^2+y.^2;
% Z=griddata(x,y,z,X,Y);%默认的是线性插值
% mesh(X,Y,Z)

% nearest
% Z=griddata(x,y,z,X,Y,'nearest');%默认的是线性插值
% mesh(X,Y,Z)

% cubic
Z=griddata(x,y,z,X,Y,'cubic');%默认的是线性插值
mesh(X,Y,Z)

% v4
Z=griddata(x,y,z,X,Y,'v4');%默认的是线性插值
mesh(X,Y,Z)

% natural
Z=griddata(x,y,z,X,Y,'natural');%默认的是线性插值
mesh(X,Y,Z)

