function [outputArg1,coef] = UAB(cita,fai)
%GAB 此处显示有关此函数的摘要
%   此处显示详细说明
global r lamada lamada_cita n_cita lamada_fai n_fai h0 D
rw0=25.5;rw1=25.5;rf10=16.950; rf11=0.15;rf20=17.720;rf21=0.04;lamada0=0.6;
a1=power(rw1,0.5);
a2=power(rf20,0.5)+power(rf10,0.5)-power(rw0,0.5);
a3=power(rw0,0.5);
a4=power(rf21,0.5)+power(rf11,0.5)-power(rw1,0.5);
a5=-power(rf20*rf11,0.5);
a6=-power(rf21*rf10,0.5);

GAB=2*(a1*a2+a3*a4+a5+a6);
R=r+r*lamada_cita*cos(n_cita*cita)+r*lamada_fai*cos(n_fai*fai)+eps;
vector_zi=R*sin(cita)*cos(cita)-r*lamada_cita*n_cita*sin(n_cita*cita)*sin(cita)*sin(cita)+eps;
vector_mu=power(R*R*sin(cita)*sin(cita)+r*r*lamada_fai*lamada_fai*n_fai*n_fai*sin(n_fai*fai)*sin(n_fai*fai)+r*r*lamada_cita*lamada_cita*n_cita*n_cita*sin(n_cita*cita)*sin(n_cita*cita)*sin(cita)*sin(cita),0.5)+eps;
vector=vector_zi/vector_mu;
coef=GAB;
b1=exp((h0-2*r-4*lamada*r-D+2*R*cos(cita))/(lamada0+eps))*vector*R*R*sin(cita);
outputArg1 = b1;

end

