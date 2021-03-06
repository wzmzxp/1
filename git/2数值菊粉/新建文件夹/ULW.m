function [ULW,coef]= ULW( cita,fai )
global r lamada lamada_cita n_cita lamada_fai n_fai h0 D
R=r+r*lamada_cita*cos(n_cita*cita)+r*lamada_fai*cos(n_fai*fai)+eps;

vector_zi=R*sin(cita)*cos(cita)-r*lamada_cita*n_cita*sin(n_cita*cita)*sin(cita)*sin(cita)+eps;
vector_mu=power(R*R*sin(cita)*sin(cita)+r*r*lamada_fai*lamada_fai*n_fai*n_fai*sin(n_fai*fai)*sin(n_fai*fai)+r*r*lamada_cita*lamada_cita*n_cita*n_cita*sin(n_cita*cita)*sin(n_cita*cita)*sin(cita)*sin(cita),0.5)+eps;
vector=vector_zi/vector_mu;
rf1=47.25;rw=21.8;rf2=37.98;
GLW=-2*(power(rf1,0.5)-power(rw,0.5))*(power(rf2,0.5)-power(rw,0.5));
coef=GLW;
ULW=((h0*h0+eps)/(power(2*r+4*lamada*r+D-2*R*cos(cita),2)+eps))*vector*R*R*sin(cita);
end


