%% ���ַ�  ͨ���ж�һ�׵��������ж�����
syms x
f=@(x) x.^2-5*x+9;% func2str  sym
% ezplot(f)
[x,fx]=Min_EF(f,[0 6],100)  % a ����ֵ  b������