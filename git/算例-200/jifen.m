function output_args = jifen(t )
%C �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global  x y z
Q=6.5*1e+12;u=6;
a1=Q/(power(2*pi,3/2)*sigmax(x)*sigmay(x)*sigmaz(x));
a2=exp(-0.5*(power((x-u*t),2)/power(sigmax(x),2)+y*y/(sigmay(x)*sigmay(x))));
a3=exp(-0.5*(power((z+H(t)),2)/power(sigmaz(x),2)+power((z-H(t)),2)/power(sigmaz(x),2)));
output_args=a1*a2.*a3;
end

