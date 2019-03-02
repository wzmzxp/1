%% 色图
%增强或者变暗
[x,y,z]=peaks(30);
h=surf(x,y,z)
% h.FaceColor='r';
% h.FaceAlpha=0.1;
light
h.FaceLighting='gouraud';%需要Light才起作用  flat  none
h.BackFaceLighting='lit';%reverselit照亮曲面，就像顶点法线指向相机一样。 unlit  lit根据顶点法线照亮面  
h.AmbientStrength=0.5;%环境光
h.DiffuseStrength=0.5;%漫反射强度
h.SpecularStrength=0.5;%镜面反射强度

brighten(0.2)%0 - 1变亮，-1 - 0变暗
colorbar%可以设置方位，东南西北，垂直vert水平horiz

%% 光源light 
% h=light%创建灯光对象
% h.Color=[1 0 1];%光的颜色
% h.Position=[0 1 1];%光源位置
% h.Style=infinite;%光源远近，平行光与近光local，平行光为默认设置
% %lighting选取光照模式
% lighting none%没有光照模式
% lighting flat%默认的，在物体的每个面上产生均匀的照明
% lighting gouraud%知道顶点，内插值
% lighting phong %使用内插方式并计算每个像素的反射比来修改表面颜色

%camlight
%% 材质
camlight('headlight')%在始点位置创建光源
camlight('right')
camlight('left')
%% 表面着色
shading faceted
shading flat
shading interp

