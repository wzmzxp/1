%% ɫͼ
%��ǿ���߱䰵
[x,y,z]=peaks(30);
h=surf(x,y,z)
% h.FaceColor='r';
% h.FaceAlpha=0.1;
light
h.FaceLighting='gouraud';%��ҪLight��������  flat  none
h.BackFaceLighting='lit';%reverselit�������棬���񶥵㷨��ָ�����һ���� unlit  lit���ݶ��㷨��������  
h.AmbientStrength=0.5;%������
h.DiffuseStrength=0.5;%������ǿ��
h.SpecularStrength=0.5;%���淴��ǿ��

brighten(0.2)%0 - 1������-1 - 0�䰵
colorbar%�������÷�λ��������������ֱvertˮƽhoriz

%% ��Դlight 
% h=light%�����ƹ����
% h.Color=[1 0 1];%�����ɫ
% h.Position=[0 1 1];%��Դλ��
% h.Style=infinite;%��ԴԶ����ƽ�й������local��ƽ�й�ΪĬ������
% %lightingѡȡ����ģʽ
% lighting none%û�й���ģʽ
% lighting flat%Ĭ�ϵģ��������ÿ�����ϲ������ȵ�����
% lighting gouraud%֪�����㣬�ڲ�ֵ
% lighting phong %ʹ���ڲ巽ʽ������ÿ�����صķ�������޸ı�����ɫ

%camlight
%% ����
camlight('headlight')%��ʼ��λ�ô�����Դ
camlight('right')
camlight('left')
%% ������ɫ
shading faceted
shading flat
shading interp

