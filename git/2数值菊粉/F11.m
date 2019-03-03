clear all

global r lamada lamada_cita n_cita lamada_fai n_fai h0 D
r=5;lamada=0.05;lamada_cita=lamada;n=30;n_cita=n;lamada_fai=lamada;n_fai=n;h0=0.158;D=1;
[a,GAB1 ]=UAB(1,1);
[a,UEL1]=UEL(1,1);%+
[a,ULW1]=ULW(1,1);
p=3;q=3;
a=0;b=2*pi;c=0;d=2*pi;
g=(b-a)/(2*p);k=(d-c)/(2*q);
x=zeros(p*2,1);
y=zeros(q*2,1);
X=zeros(7,7);
for i=1:2*p+1;
    x(i)=a+(i-1)*g
end
for i=1:2*p+1;
    y(i)=c+(i-1)*g
end
% temp=0;
for i=1:7
    for j=1:7
        [X(i,j),a]=ULW(x(i),y(j));
        
    end
end
coef=a;
result0=0;
result=0;
result1=0;
% for i=1:6
%     for j=1:6
%        result=result+X(2i-2,2j-2)+X(2i,2j-2)+X(2i,2j)+X(2i-2,2j);
%        result1=result1+4*(X(2i-1,2j-2)+X(2i,2j-1)+X(2i-1,2j)+X(2i-2,2j-1)+16*X(2i-1,2j-1);
%         result0=result0+result+result1;
%     end
% end
% for i=1:6
%     for j=1:6
%        result=result+X(2*i-2,2*j-2)+X(2*i,2*j-2)+X(2*i,2*j)+X(2*i-2,2*j);
%        result1=result1+4*(X(2*i-1,2*j-2)+X(2*i,2*j-1)+X(2*i-1,2*j)+X(2*i-2,2*j-1))+16*X(2*i-1,2*j-1);
%         result0=result0+result+result1;
%     end
% end
for i=1:3
    for j=1:3
       result=result+X(2*i-1,2*j-1)+X(2*i,2*j-1)+X(2*i-1,2*j-1)+X(2*i-1,2*j);
       result1=result1+4*(X(2*i-1,2*j-1)+X(2*i,2*j-1)+X(2*i-1,2*j)+X(2*i-1,2*j-1))+16*X(2*i-1,2*j-1);
        result0=result0+result+result1;
    end
end
% result0=result0*(g*k)/9;

result0=coef*result0*(g*k)/9;
result0