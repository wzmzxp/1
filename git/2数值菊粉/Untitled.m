global r lamada lamada_cita n_cita lamada_fai n_fai h0

rf1=47.25;rw=21.8;rf2=37.98;
GLW=-2*(power(rf1,0.5)-power(rw,0.5))*(power(rf2,0.5)-power(rw,0.5));
% epis0*episr=8.85*1e-12;
h0=0.158;
epis=8.85*1e-12;k=(1e-3);
GEL=(epis*k)*0.5*(ksi_f1*ksi_f1+ksi_f2*ksi_f2)*(1-coth(K*h0)+((2*ksi_f1*ksi_f2)/(ksi_f1*ksi_f1+ksi_f2*ksi_f2))*csch(k*h0))

rw0=0;rw1=0;rf10=0; rf11=0;rf20=0;rf21=0;
GAB=2*(power(rw1,0.5)*(power(rf20,0.5)+power(rf10,0.5)-power(rw0,0.5))+power(rw0,0.5)*(power(rf21,0.5)+power(rf11,0.5)-power(rw1,0.5))-power(rf20*rf11,0.5)))))))

lamada=0.05;D=1;n=30;
%fai cita
r=0;lamada_cita=lamada;n_cita=n;cita=0;lamada_fai=lamada;n_fai=n;fai=0;
R=r+r*lamada_cita*cos(n_cita*cita)+r*lamada_fai*cos(n_fai*fai);


h=2*r+4*lamada*r+D-2*R*cos(cita);

vector_zi=R*sin(cita)*cos(cita)-r*lamada_cita*n_cita*sin(n_cita*cita)*sin(cita)*sin(cita);
vector_mu=power(R*R*sin(cita)*sin(cita)+r*r*lamada_fai*lamada_fai*n_fai*n_fai*sin(n_fai*fai)*sin(n_fai*fai)+r*r*lamada_cita*lamada_cita*n_cita*n_cita*sin(n_cita*cita)*sin(n_cita*cita)*sin(cita)*sin(cita),0.5);
vector=vector_zi/vector_zi;

a=0;b=2*pi;c=0;d=2*pi;
h0=0.158;
% ULW=GLW*(2*r+4*lamada*r+D-2*Rcos(cita)*vector*R*R*sin(cita)
%fai cita
%R=r+r*lamada_cita*cos(n_cita*cita)+r*lamada_fai*cos(n_fai*fai);
%Ŀ�꺯��1
ULW=((h0*h0)/(power(2*r+4*lamada*r+D-2*Rcos(cita),2)))*vector*R*R;

p=3;q=3;
g=(b-a)/(2*p);k=(d-c)/(2*q);
x=zeros(p*2,1);
y=zeros(q*2,1);
X=zeros(6,6);
for i=1:2*p+1;
    x(i)=a+(i-1)*g
end
for i=1:2*p+1;
    y(i)=c+(i-1)*g
end
temp=0;
for i=1:6
    for j=1:6
        X(i,j)
    end
end