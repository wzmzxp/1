%% ţ�ٷ���ֵ
syms x
f=@(x) x.^3-6*x+9;
% ezplot(f)
[a,b]=Min_jintui(f,0,0.1)
[x,fx]=Min_ND_1(f,(a+b)/2)  % a ����ֵ  b������

