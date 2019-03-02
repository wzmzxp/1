%% 等高线
% contour
[x,y,z]=peaks(50);
contour(z)
contour(z,20)
v=linspace(min(min(z)),max(max(z)),10);
contour(z,v)

contour(x,y,z)
[c,h]=contour(x,y,z,v);
h.ShowText='on';
% 单条绘制
v=[1 2 5];
[c,h]=contour(x,y,z,v);
% 文字
% clabel(c)
% clabel(c,h,[2 5])
clabel(c,h,'fontname','宋体','fontweight','bold')

% contourf
contourf(z)
% contour3
contour3(z)

