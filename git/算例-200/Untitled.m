
sigmax=0;sigmay=0;sigmaz=0;H=106.3227-101.0689e(-0.0763*4)
a1=Q/(power(2*pi,3/2)*sigmax*sigmay*sigmaz)
a2=exp(-0.5*(power((x-u*t),2)/power(sigmax,2)+y*y/(sigmay*sigmay)))
a3=exp(-0.5*(power((z+H),2)/power(sigmaz,2)+power((z-H),2)/power(sigmaz,2)))
