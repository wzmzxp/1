function [outputArg1] = F(t)
%F �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
u=1000;cigama=2000;
a=1/(power(2*pi,0.5)*power(cigama,0.5));
a2=exp(-1*power((t-u),2)/(2*cigama));
outputArg1=a.*a2;
outputArg1
end

