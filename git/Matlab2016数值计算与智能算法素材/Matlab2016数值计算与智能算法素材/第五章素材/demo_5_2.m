%% mesh ����ͼ
[X,Y]=meshgrid(-5:0.5:5);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;

mesh(Z)
mesh(X,Y,Z)

h=meshc(Z);
meshz(Z)
%% �̶��ݺ��
axis vis3d
%% ͸��
% hidden off
% alpha(0.9)
%% surf ����ͼ
surf(Z)
surf(X,Y,Z)
% surfc(Z)
% surfl(Z)
%% ��ʾ��ʽ
% shading faceted%Ĭ�ϵ�
% shading flat
shading interp
