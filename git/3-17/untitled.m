clear all
%x,y���ڵ������
x=[1,4,6,5,9]
y=[3,6,3,8,4]
D=[x,y]
E=reshape(D,[5,2]);
figure(1)

% JU=juli(E);
index=G(E,2);
plot(x(index),y(index))
%�������귶Χ
axis([0 10 0 10]);
hold on 
plot(x(index(1)),y(index(1)),'*')
hold on 
plot([x(index(1)) x(index(5))],[y(index(1)) y(index(5))])