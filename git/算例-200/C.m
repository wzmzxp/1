function [ output_args ] = C( x,y,z,t )
%C 此处显示有关此函数的摘要
%   此处显示详细说明
Q=8000;u=9.64;
a1=Q/((power(2*pi,3/2)*sigmax(x)*sigmay(x)*sigmaz(x))+eps);
 a2=(power((x-u*t),2)+eps)/(power(sigmax(x),2)+eps)+(y*y)/(power(sigmay(y),2)+eps);
 a3=exp(-1*a2);
% a2=exp(-0.5*(power((x-u*t),2)/power(sigmax(x),2)+(y*y)/(sigmay(y)*sigmay(y))));

a4=exp(-1*((power((z+H(t)),2)+eps)/(power(sigmaz(z),2)+eps)+(power((z-H(t)),2)+eps)/(power(sigmaz(z),2)+eps)));
output_args=(a1+eps)*(a3+eps)*(a4+eps);
end

