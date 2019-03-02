% 曲面的明暗及光照
clear
close
clc
%% 明暗
[x,y,z]=peaks(10);
surf(x,y,z)
% brighten(0.9)
%% 光照
h=light;
h.Color=[0.5 0.6 1];
h.Position=[-4 -4  10];
h.Style='local';%local
% 白色 远光 [1 0 1]
%% 光照模式 lighting
lighting none
lighting flat
lighting gouraud

