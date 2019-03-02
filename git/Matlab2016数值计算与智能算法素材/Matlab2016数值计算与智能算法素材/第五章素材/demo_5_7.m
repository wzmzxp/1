%% ɫͼ
% ��ɫ����RGB [0.1 0.2 0.2]����
% colormap����n����ɫ���ɣ�Ҳ������һ��n��3�ľ���ÿһ����һ����ɫ
%% ָ��ɫͼ
peaks;
colormap(jet);
colormap cool
colormap default
colormap(jet(10))
%% ��õ�ǰɫͼ����
colormap default
map=colormap;
%% �Զ���ɫͼ
map=rand(100,3);
colormap(map)
%% ��ͼָ��
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
%% ����λ��
h=colorbar(h1,'westoutside')
%% ��ǩ
h.Ticks=[-6 -3 0 3 6];
h.TickLabels={'-10^\circ','-5^\circ',...
    '0^\circ','5^\circ','10^\circ'};
h.TickDirection='out';
h.TickLength=0.02;
h.Label.String='�¶�';
%% bar3 ���ݸ߶�������ɫ
close
x=[17 6 21;14 15 3];
h3=bar3(x);
colorbar
for k=1:length(h3)
    zdata=h3(k).ZData;
    h3(k).CData=zdata;
    h3(k).FaceColor='interp';
end
