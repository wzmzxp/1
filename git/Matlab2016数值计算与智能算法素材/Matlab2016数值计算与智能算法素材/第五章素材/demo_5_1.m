%% ��׼����  �ӽǱ任

%% ��λԲ  sphere
sphere
sphere(60)
[x,y,z]=sphere(60);
mesh(x,y,z)

%% Բ�� cylinder
cylinder
%ָ���뾶
cylinder(2)
cylinder(2,60)
[x1,y1,z1]=cylinder(2,60);
t=-1:0.02:1;
y2=t+0.1;
cylinder(y2)

%% peaks
peaks
peaks(60)

%% �ӽ�
peaks(60)
xlabel('����x��')
ylabel('����y��')
view(30,60)
view([50 60])
view(2)
view(3)
