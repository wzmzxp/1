clear
clc
x=0:0.01:2*pi;
y=sin(x);
% plot(x,y)%Ĭ�ϻ�ͼ
plot(x,y,'-')%ʵ��
plot(x,y,'--')%����
plot(x,y,':')
plot(x,y,'-.')%�㻭��

plot(x,y,'-.ko')%Բ�α��
plot(x,y,'-.hk')%�����α��

%�߿�linewidth
plot(x,y,'-.ko','LineWidth',1.5)
%��ǵı�Ե��ɫ 
plot(x,y,'-.ks','markeredgecolor','y')
%����������ɫ
plot(x,y,'-.ks','markeredgecolor','y','markerfacecolor','r')
%��ǵĴ�С
plot(x,y,'-.ks','markeredgecolor','y','markerfacecolor','r','markersize',4)
