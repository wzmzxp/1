x=-30:0.1:30;
y=-30:0.1:30;
[X,Y]=meshgrid(x,y);
f = (X.^2+2*X).*exp(-X.^2-Y.^2-X.*Y);
mesh(x,y,f)