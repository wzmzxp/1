%% 色图
% 颜色是由RGB [0.1 0.2 0.2]构成
% colormap是由n种颜色构成，也就是是一个n×3的矩阵，每一行是一种颜色
%% 指定色图
peaks;
colormap(jet);
colormap cool
colormap default
colormap(jet(10))
%% 获得当前色图数据
colormap default
map=colormap;
%% 自定义色图
map=rand(100,3);
colormap(map)
%% 多图指定
close
h1=subplot(2,1,1);
peaks;
colormap(h1,cool)
title(h1,'cool')

h2=subplot(2,1,2);
peaks;
colormap(h2,copper)
title(h2,'copper')

close
h1=subplot(2,1,1);
contourf(peaks);
colormap(h1,hot)
title(h1,'hot')

h2=subplot(2,1,2);
contourf(peaks);
colormap(h2,copper)
title(h2,'copper')
%% colorbar
% colorbar(h1)
colorbar(h2)
%% 放置位置
h=colorbar(h1,'westoutside')
%% 标签
h.Ticks=[-6 -3 0 3 6];
h.TickLabels={'-10^\circ','-5^\circ',...
    '0^\circ','5^\circ','10^\circ'};
h.TickDirection='out';
h.TickLength=0.02;
h.Label.String='温度';
%% bar3 根据高度设置颜色
close
x=[17 6 21;14 15 3];
h3=bar3(x);
colorbar
for k=1:length(h3)
    zdata=h3(k).ZData;
    h3(k).CData=zdata;
    h3(k).FaceColor='interp';
end
