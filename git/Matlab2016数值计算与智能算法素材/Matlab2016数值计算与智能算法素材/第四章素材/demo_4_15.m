%% ezplot  easyplot
% ezplot('x^3+x^2+2') Ĭ�Ϸ�Χ[-2*pi 2*pi]
ezplot('x^3+x^2+2')
ezplot('x^3+x^2+2',[-5 5])

%�����������
f=@(x) x.^2;
ezplot(f)

%������ e^x+y^2+-2=0
ezplot('exp(x)+y^2-2',[-5 5 -5 4])

%��������
syms fai
r=input('����Բ�뾶��');
x=r*(cos(fai)+fai*sin(fai));
y=r*(sin(fai)-fai*cos(fai));
ezplot(x,y)
axis([-4*r 4*r -4*r 4*r])
hold on
x1=r*sin(fai);
y1=r*cos(fai);
ezplot(x1,y1)

