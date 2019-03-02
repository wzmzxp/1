syms  Q1 H1;
% 0.6 .1 0.9 0.9 5
global x y z c 
global Q H
x =20.6;y=40.21; z=0.9; c=0; u=5;
Q=-15:.1:15;H=-15:.1:15;
% Z=Q

[Q,H]=meshgrid(Q,H);
for i=1:size(Q,1)
    for j=1:size(Q,2)
            Z(i,j)=MOP4(Q(i,j),H(i,j));
    end
end
mesh(Q,H,Z)
