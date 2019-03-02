close
clear
clc
x=[0 1 1 0 0];
y=[0 0 1 1 0];
t=[1 1 1 1 1];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-6 6 -6 6])
axis equal
M=[cos(pi) -sin(pi) 2;
   sin(pi) cos(pi)  3;
      0           0     1;];
M1=M^(1/50);
for i=1:50
    T=M1^i*[x;y;t];
    plot(T(1,:),T(2,:))
    h1=patch(T(1,:),T(2,:),'r');
    h1.FaceAlpha=0.5;
    hold on
    axis([-6 6 -6 6])
    axis equal
    pause(0.1)
end


