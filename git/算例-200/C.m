function [ output_args ] = C( x,y,z,t )
%C �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% <<<<<<< HEAD
Q=8;u=1;
a1=Q/(power(2*pi,3/2)*sigmax(x)*sigmay(x)*sigmaz(x));
a2=power((x-u*t),2)/(2*power(sigmax(x),2))+(y*y)/(2*power(sigmay(y),2));
a3=exp(-1*a2)+eps;
% a2=exp(-0.5*(power((x-u*t),2)/power(sigmax(x),2)+(y*y)/(sigmay(y)*sigmay(y))));

a4=exp(-1*(power((z+H(t)),2)/(2*power(sigmaz(z),2))));
a5=exp(-1*power((z-H(t)),2)/(2*power(sigmaz(z),2)));
output_args=a1*a3*(a4+a5+eps)*1000;
% % =======
% Q=8000;u=9.64;
% a1=Q/((power(2*pi,3/2)*sigmax(x)*sigmay(x)*sigmaz(x))+eps);
%  a2=(power((x-u*t),2)+eps)/(power(sigmax(x),2)+eps)+(y*y)/(power(sigmay(y),2)+eps);
%  a3=exp(-1*a2);
% % a2=exp(-0.5*(power((x-u*t),2)/power(sigmax(x),2)+(y*y)/(sigmay(y)*sigmay(y))));
% 
% a4=exp(-1*((power((z+H(t)),2)+eps)/(power(sigmaz(z),2)+eps)+(power((z-H(t)),2)+eps)/(power(sigmaz(z),2)+eps)));
% output_args=(a1+eps)*(a3+eps)*(a4+eps);
% >>>>>>> 50bdf56daa6ee16ee69d89b24b35d3dfe9ca35f6
end

