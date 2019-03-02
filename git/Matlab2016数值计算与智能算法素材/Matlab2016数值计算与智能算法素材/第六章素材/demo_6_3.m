%% 符号表达式运算与整理实例
syms Rp1 gama1 faip nx ny nz rx ry rz Rn1 Rn2 Rn3 
Mnp=[cos(faip) -sin(faip) 0;
     sin(faip)  cos(faip) 0;
     0     0   1;];
wnp=[0;0;1/Rp1];
wn1=[cos(gama1);0;sin(gama1)];
wn=wnp-wn1;
Rn=[Rn1;Rn2;Rn3];
r=[rx;ry;rz;];
n=[nx;ny;nz];
r1=Mnp*r;
n1=Mnp*n;
vnp1=cross(wn,r1)-cross(Rn,wn1);
F=n1(1)*vnp1(1)+n1(2)*vnp1(2)+n1(3)*vnp1(3);
simplify(F)
expand(F);

