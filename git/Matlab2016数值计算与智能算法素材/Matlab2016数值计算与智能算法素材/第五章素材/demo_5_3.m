%% �ȸ���
% contour
[x,y,z]=peaks(50);
contour(z)
contour(z,20)
v=linspace(min(min(z)),max(max(z)),10);
contour(z,v)

contour(x,y,z)
[c,h]=contour(x,y,z,v);
h.ShowText='on';
% ��������
v=[1 2 5];
[c,h]=contour(x,y,z,v);
% ����
% clabel(c)
% clabel(c,h,[2 5])
clabel(c,h,'fontname','����','fontweight','bold')

% contourf
contourf(z)
% contour3
contour3(z)

