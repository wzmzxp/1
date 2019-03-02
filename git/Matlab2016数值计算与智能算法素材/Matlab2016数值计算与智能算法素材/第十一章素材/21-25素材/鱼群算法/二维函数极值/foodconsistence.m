function Y = foodconsistence (x)
y = x(:,2);
x = x(:,1);

Y = sin(sqrt((x-10).^2+(y-10).^2))./sqrt((x-10).^2+(y-10).^2);