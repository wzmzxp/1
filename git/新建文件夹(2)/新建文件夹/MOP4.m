function OUT=MOP4(Q,H)
global x y z c 
   %��ʼģ��   
   u=5;
   sigmay=0.22*x/power((1+0.0001*x),0.5);
   sigmaz=0.2*x;
   a1=Q/(2*pi*u*sigmay*sigmaz)*exp(-0.5*(y*y/(sigmay*sigmay)));
   a2=exp(-0.5*((z-H)*(z-H)/(sigmaz*sigmaz)));
   a3=exp(-0.5*((z+H)*(z+H)/(sigmaz*sigmaz)));
   Z=a1*(a2+a3);
   
   
   OUT=Z;
   
   
   
   
end