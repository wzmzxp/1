%% 数值积分
syms x
y=(x*asin(x))/sqrt(1-x^2)
A=int(y,x,0,0.5);

%% trapz 梯形公式
x=0:0.0001:0.5;
format long
y=(x.*asin(x))./sqrt(1-x.^2);
A=trapz(x,y);

%% 自适应辛普森  quad    在以后的版本中会移除
% 第一种 Q=quad(fun,a,b)
y=@(x) (x.*asin(x))./sqrt(1-x.^2);
a=quad(y,0,0.5)

y=@(x) sin(x).*cos(x).^3;
q=quad(y,0,pi/2,1e-18)

% 保存成.m函数
y='sin(x).*cos(x).^3';
fid=fopen('myfun.m','w');
fprintf(fid,'%s\r\n','function y=myfun(x)');
fprintf(fid,'%s','y=');
fprintf(fid,'%s',y);
fprintf(fid,'%s',';');
fclose(fid);

a=quad(@myfun,0,pi/2)







