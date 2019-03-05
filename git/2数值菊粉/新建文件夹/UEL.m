function [outputArg1,coef]= UEL(cita,fai)
global r lamada lamada_cita n_cita lamada_fai n_fai h0 D
epis=7*1e-11;k=10;
% ksi_f1:-31.53+-1.32
% ksi_f2:-21.90+-1.76
R=r+r*lamada_cita*cos(n_cita*cita)+r*lamada_fai*cos(n_fai*fai)+eps;
ksi_f1=-31.53;ksi_f2=-21.90;
% h=0.1;
h=2*r+4*lamada*r+D-2*R*cos(cita);
% GEL=(epis*k)*0.5*(ksi_f1*ksi_f1+ksi_f2*ksi_f2)*(1-coth(k*h0)+((2*ksi_f1*ksi_f2)/(ksi_f1*ksi_f1+ksi_f2*ksi_f2+eps))*csch(k*h0));
vector_zi=R*sin(cita)*cos(cita)-r*lamada_cita*n_cita*sin(n_cita*cita)*sin(cita)*sin(cita)+eps;
vector_mu=power(R*R*sin(cita)*sin(cita)+r*r*lamada_fai*lamada_fai*n_fai*n_fai*sin(n_fai*fai)*sin(n_fai*fai)+r*r*lamada_cita*lamada_cita*n_cita*n_cita*sin(n_cita*cita)*sin(n_cita*cita)*sin(cita)*sin(cita),0.5)+eps;
vector=vector_zi/vector_mu;
coef=epis*k*ksi_f1*ksi_f2;
outputArg1=(((power(ksi_f1,2)+power(ksi_f2,2))/(2*ksi_f1*ksi_f2))*(1-coth(k*h))+1/(sinh(k*h)+eps))*vector*R*R*sin(cita);

end

