clear
clc
close
syms x y y1
y=x^3+2*x;
y1=diff(y,x);
x1=-5:0.5:5;
y=double(subs(y,x,x1));
y1=double(subs(y1,x,x1));
sita=atan(y1);
tx=y1.*cos(sita);
ty=y1.*sin(sita);
p=plot(x1,y);
axis([-5 10 -150 200])
hold on

xlim=get(p.Parent,'XLim');
ylim=get(p.Parent,'YLim');
po=get(p.Parent,'Position');
[~,px]=mapminmax(xlim,po(1),po(1)+po(3));
[~,py]=mapminmax(ylim,po(2),po(2)+po(4));
xx1=mapminmax('apply',x1,px);
y1=mapminmax('apply',y,py);
ttx=mapminmax('apply',x1+tx,px);
tty=mapminmax('apply',y+ty,py);
for i=1:length(x1)
    p1=annotation('arrow',[xx1(i),ttx(i)],[y1(i),tty(i)],'HeadStyle','plain');
end
%% annotation
% annotation('arrow',[0 1],[0 1])

% quiver(x1,y,tx,ty,0.3);