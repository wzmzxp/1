%% ��������
% f=@(x) sin(x)+cos(x);
% f1=@(x,y) sin(x)+cos(y);
% f2=@(x,y) @(a) sin(x)+cos(y)+a;
% f3=f2(pi/2,pi/3);
% f3(1);
f=@(x) x.^2+2;
% fplot(f);%Ĭ�ϵ�x�᷶Χ��[-5 5]
% fplot(f,[-2 2])
% fplot('sin(x)',[-2*pi 2*pi])%��δ���İ汾�л�ɾ��
fplot(@(x)sin(x),[-pi,pi])
%% ��������
x=@(t) cos(3*t);
y=@(t) sin(5*t);
fplot(x,y)
%% e��ô����exp()
fplot(@(x)exp(x+1),[-5 5],'d:b')
hold on
%% ���
x=@(t) cos(3*t);
y=@(t) sin(5*t);
fp=fplot(x,y);

