function [ output_args ] = obi2( cita )
%OBI2 此处显示有关此函数的摘要
%   此处显示详细说明
global s citaf citar citam;
delta=0;j=30;ganma=0;
ksi=atan(cos(ganma)*tan(cita));
a2=(4140+delta*tan(13))*(1-exp(-100*j))*cos(ksi)-delta*sin(ksi);
a3=0.055*power(cos(cita).*cos(cita)+sin(cita).*sin(cita)*sec(ganma),0.5)
output_args=a2.*a3;
end

