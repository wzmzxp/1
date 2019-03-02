%xlabel ylabel zlabel
x=0:0.1:2*pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,'--r',x,y2,'-b');
%x轴简单标注
xlabel('正弦曲线 sin')
%多行标注
xlabel({'正弦曲线 sin','余弦曲线 cos'})
%上下标
xlabel('正弦曲线 sin^{cos}')
xlabel('正弦曲线 sin_{cos}')
%格式化输出
t=4;
xlabel(['第',num2str(t),'天的气温'])
%字体大小
xlabel('正弦曲线 sin','fontsize',18)
%字体的加粗
xlabel('正弦曲线 sin','fontweight','bold')%normal
%字体的颜色
xlabel('正弦曲线 sin','color','r')
%字体名称
xlabel('正弦曲线 sin','color','r','fontname','隶书')

%特殊的字符
xlabel('正弦曲线 sin 0\leq x \leq 2\pi','color','r')

xlabel(['\fontname{宋体} 正弦曲线', '\fontname{Times New Roman} \it sin',...
    '\fontsize{19}\rm 0\leq \fontname{Times New Roman}\it \color{black}x \color{red}\rm \leq 2\pi'])

