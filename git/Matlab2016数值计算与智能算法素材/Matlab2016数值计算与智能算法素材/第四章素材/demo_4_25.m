%% –˝◊™
% x=[0 1 1 0 0];
% y=[0 0 1 1 0];
% plot(x,y)
% h=patch(x,y,'b');
% h.FaceAlpha=0.5;
% hold on
% axis([-2 2 -2 2])
% axis equal
% for i=1:40
%     M=[cos(pi/40*i) -sin(pi/40*i);
%         sin(pi/40*i) cos(pi/40*i)];
%     T=M*[x;y];
%     plot(T(1,:),T(2,:))
%     h2=patch(T(1,:),T(2,:),'r');
%     h2.FaceAlpha=0.1;
%     pause(0.2)
% end
%% x÷·…ÏÀı
% clear
close
x=[0 1 1 0 0];
y=[0 0 1 1 0];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-2 2 -2 2])
axis equal
M=[2 0;
    0 1];
T=M*[x;y];
plot(T(1,:),T(2,:))
h2=patch(T(1,:),T(2,:),'r');
h2.FaceAlpha=0.1;
%% Y÷·…ÏÀı
clear
close
x=[0 1 1 0 0];
y=[0 0 1 1 0];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-2 2 -2 2])
axis equal
M=[1 0;
   0 -2];
T=M*[x;y];
plot(T(1,:),T(2,:))
h2=patch(T(1,:),T(2,:),'r');
h2.FaceAlpha=0.1;

%% x÷·æµœÒ
clear
close
x=[0 1 1 0 0];
y=[0 0 1 1 0];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-2 2 -2 2])
axis equal
M=[1 0;
    0 -1];
T=M*[x;y];
plot(T(1,:),T(2,:))
h2=patch(T(1,:),T(2,:),'r');
h2.FaceAlpha=0.1;

%% Y÷·æµœÒ
clear
close
x=[0 1 1 0 0];
y=[0 0 1 1 0];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-2 2 -2 2])
axis equal
M=[-1 0;
    0 1];
T=M*[x;y];
plot(T(1,:),T(2,:))
h2=patch(T(1,:),T(2,:),'r');
h2.FaceAlpha=0.1;

%% X÷·ºÙ«–
clear
close
x=[0 1 1 0 0];
y=[0 0 1 1 0];
plot(x,y)
h=patch(x,y,'b');
h.FaceAlpha=0.5;
hold on
axis([-2 2 -2 2])
axis equal
M=[1 0.35;
   0  1];
T=M*[x;y];
plot(T(1,:),T(2,:))
h2=patch(T(1,:),T(2,:),'r');
h2.FaceAlpha=0.1;
%% Y÷·ºÙ«–
% clear
% close
% x=[0 1 1 0 0];
% y=[0 0 1 1 0];
% plot(x,y)
% h=patch(x,y,'b');
% h.FaceAlpha=0.5;
% hold on
% axis([-2 2 -2 2])
% axis equal
% M=[1 0;
%   0.5 1];
% T=M*[x;y];
% plot(T(1,:),T(2,:))
% h2=patch(T(1,:),T(2,:),'r');
% h2.FaceAlpha=0.1;
