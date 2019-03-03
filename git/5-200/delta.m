function [ output_args ] = delta( cita,ganma )
%DELTA 此处显示有关此函数的摘要
%   此处显示详细说明
global s citaf citar citam;
if cita>=citam && cita<=citaf
    a1=181683.25*power(cos(cita)*cos(cita)+sin(cita)*sin(cita)*sec(ganma)*sec(ganma),1/4);
    a2=power(cos(cita)-cos(citaf),0.5);
    output_args=a1*a2;
else
    a1=181683.25*power(cos(cita)*cos(cita)+sin(cita)*sin(cita)*sec(ganma)*sec(ganma),1/4);
    a2=cos(citaf-((cita-citar)/(citam-citar))*(citaf-citam))-cos(citaf);
    a3=power(a2,0.5);
     output_args=a1*a3;
end
end

