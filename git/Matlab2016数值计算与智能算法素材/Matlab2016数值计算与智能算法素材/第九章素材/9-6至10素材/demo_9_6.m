%% ������ֵ
syms x
f=@(x) x.^2-6*x+9;
% ezplot(f)
[x,fx]=GeXian(f,0,1,100)  % a ����ֵ  b������
