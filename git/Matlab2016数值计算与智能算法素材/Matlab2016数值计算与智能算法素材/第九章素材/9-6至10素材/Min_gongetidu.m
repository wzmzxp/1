function [x,result]=Min_gongetidu(f,x0,tol)

if nargin == 2
    tol=1e-6;
end

%��ǰ���ݶ�
h=length(x0); % ������������
FF='F_td(';
ff='f(';
f_x1='f(';
for k=1:h
    FF=[FF,'x0(',num2str(k),'),'];
    ff=[ff,'x0(',num2str(k),'),'];
    f_x1=[f_x1,'x1(',num2str(k),'),'];
end
FF(end)=[];
FF=[FF,')'];
ff(end)=[];
ff=[ff,')'];
f_x1(end)=[];
f_x1=[f_x1,')'];
%% FFΪ�˼����ݶ�ֵ  ffΪ�˼��㺯��ֵ,f_x1 �� ����x1��ı��ʽ

F_td=matlabFunction(gradient(f));%�ݶȺ������
f_td_0=eval(FF);%���㵱ǰ�ݶ�
d_0=-f_td_0;%�½�����
f=matlabFunction(f);
if norm(f_td_0) < tol
    x=x0;
    result=eval(ff);
    return;
end

syms alfa
x1=x0(:)+alfa*d_0;%���������뺯������alfa
fx1=eval(f_x1);%����x1������ԭ�������ʽ
d_x1=diff(fx1);%������������
d_alfa=double(solve(d_x1));%�����ʽΪ0ʱ��alfa
x0=x0(:)+d_alfa*d_0;
f_td_1=eval(FF);%���㵱ǰ�ݶ�
if norm(f_td_1) < tol
    x=x0;
    result=eval(ff);
    return;
end

while 1
    beta0=norm(f_td_1)^2/norm(f_td_0)^2;
    d_1=-f_td_1+beta0*d_0;
    x1=x0(:)+alfa*d_1;
    fx1=eval(f_x1);%����x1������ԭ�������ʽ
    d_x1=diff(fx1);%������������
    d_alfa=double(solve(d_x1));%�����ʽΪ0ʱ��alfa
    x0=x0(:)+d_alfa*d_1;
    d_0=d_1;
    f_td_0=f_td_1;
    f_td_1=eval(FF);%���㵱ǰ�ݶ�
    if norm(f_td_1) < tol
        x=x0;
        result=eval(ff);
        return;
    end
end

