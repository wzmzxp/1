function [ output_args ] = C( x,y,z,t )
%C �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Q=6.5*1e+12;u=6;
a1=Q/(power(2*pi,3/2)*sigmax(x)*sigmay(x)*sigmaz(x));
 a2=power((x-u*t),2)/power(sigmax(x),2)+(y*y)/power(sigmay(y),2);
 a3=exp(-0.5*a2);
% a2=exp(-0.5*(power((x-u*t),2)/power(sigmax(x),2)+(y*y)/(sigmay(y)*sigmay(y))));

a4=exp(-0.5*(power((z+H(t)),2)/power(sigmaz(z),2)+power((z-H(t)),2)/power(sigmaz(z),2)));
output_args=a1*a3*a4;
end

