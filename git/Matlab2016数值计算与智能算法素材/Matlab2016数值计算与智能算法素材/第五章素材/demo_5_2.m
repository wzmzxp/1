%% mesh 网格图
[X,Y]=meshgrid(-5:0.5:5);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;

mesh(Z)
mesh(X,Y,Z)

h=meshc(Z);
meshz(Z)
%% 固定纵横比
axis vis3d
%% 透明
% hidden off
% alpha(0.9)
%% surf 曲面图
surf(Z)
surf(X,Y,Z)
% surfc(Z)
% surfl(Z)
%% 显示方式
% shading faceted%默认的
% shading flat
shading interp
