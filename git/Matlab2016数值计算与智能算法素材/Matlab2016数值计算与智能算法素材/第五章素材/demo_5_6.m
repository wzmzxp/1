% �����������������������
%% �������
[x,y,z]=sphere(500);
% x(60:101,60:101)=NaN;
% y(60:101,60:101)=NaN;
% z(60:101,60:101)=NaN;
h=surf(x,y,z)
view(-130,30)
axis vis3d
shading interp
%% ����ǿ��  ���淴�� ������
light
% for i=0:0.2:1
%     h.DiffuseStrength=i;
%     for j=0:0.2:1
%         h.SpecularStrength=j;
%     end
% end
% %% ���淴��ָ��
% h.SpecularExponent=300;%1-500
% %% ������
% h.AmbientStrength=0.9;
% %% ���淴����ɫ
% h.SpecularColorReflectance=0.5;%0-1,1Ҳ����ζ�ŷ�����ǹ�Դ����ɫ
%% ����material
material shiny %������ ����ǿ�ڻ�����������
material dull  %������ ��Ҫ����������
material metal %���淴��ǿһЩ
% material([ka,kd,ks,n,sc])%ka     %kd     %ks     %n      %sc
material([0.8,0.8,0.5,6,0.8])
