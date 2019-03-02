%% ��ֵ����
syms x
y=(x*asin(x))/sqrt(1-x^2)
A=int(y,x,0,0.5);

%% trapz ���ι�ʽ
x=0:0.0001:0.5;
format long
y=(x.*asin(x))./sqrt(1-x.^2);
A=trapz(x,y);

%% ����Ӧ����ɭ  quad    ���Ժ�İ汾�л��Ƴ�
% ��һ�� Q=quad(fun,a,b)
y=@(x) (x.*asin(x))./sqrt(1-x.^2);
a=quad(y,0,0.5)

y=@(x) sin(x).*cos(x).^3;
q=quad(y,0,pi/2,1e-18)

% �����.m����
y='sin(x).*cos(x).^3';
fid=fopen('myfun.m','w');
fprintf(fid,'%s\r\n','function y=myfun(x)');
fprintf(fid,'%s','y=');
fprintf(fid,'%s',y);
fprintf(fid,'%s',';');
fclose(fid);

a=quad(@myfun,0,pi/2)







