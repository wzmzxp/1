% 曲面剪裁与曲面材质相关设置
%% 曲面剪裁
[x,y,z]=sphere(500);
% x(60:101,60:101)=NaN;
% y(60:101,60:101)=NaN;
% z(60:101,60:101)=NaN;
h=surf(x,y,z)
view(-130,30)
axis vis3d
shading interp
%% 反射强度  镜面反射 漫反射
light
% for i=0:0.2:1
%     h.DiffuseStrength=i;
%     for j=0:0.2:1
%         h.SpecularStrength=j;
%     end
% end
% %% 镜面反射指数
% h.SpecularExponent=300;%1-500
% %% 环境光
% h.AmbientStrength=0.9;
% %% 镜面反射颜色
% h.SpecularColorReflectance=0.5;%0-1,1也就意味着反射的是光源的颜色
%% 材质material
material shiny %发亮的 镜面强于环境和漫反射
material dull  %阴暗的 主要进行漫反射
material metal %镜面反射强一些
% material([ka,kd,ks,n,sc])%ka     %kd     %ks     %n      %sc
material([0.8,0.8,0.5,6,0.8])
