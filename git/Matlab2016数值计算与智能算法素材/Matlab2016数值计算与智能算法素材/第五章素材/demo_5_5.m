% ���������������
clear
close
clc
%% ����
[x,y,z]=peaks(10);
surf(x,y,z)
% brighten(0.9)
%% ����
h=light;
h.Color=[0.5 0.6 1];
h.Position=[-4 -4  10];
h.Style='local';%local
% ��ɫ Զ�� [1 0 1]
%% ����ģʽ lighting
lighting none
lighting flat
lighting gouraud

