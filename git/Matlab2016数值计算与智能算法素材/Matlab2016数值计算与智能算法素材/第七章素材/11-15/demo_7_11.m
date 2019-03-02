%% csape
x=linspace(0,2*pi,15);
y=sin(x);
plot(x,y,'o')
hold on

% %% complete
% p=csape(x,y,'complete',[2,2]);
% x1=linspace(0,2*pi,150);
% y1=ppval(p,x1);
% plot(x1,y1,'b','linewidth',1.5)

% %% second
% p=csape(x,y,'second',[2,3]);
% x1=linspace(0,2*pi,150);
% y1=ppval(p,x1);
% plot(x1,y1,'b','linewidth',1.5)

% %% periodic
% p=csape(x,y,'periodic');
% x1=linspace(0,2*pi,150);
% y1=ppval(p,x1);
% plot(x1,y1,'b','linewidth',1.5)

%% not-a-knot
% p=csape(x,y,'not-a-knot');
% x1=linspace(0,2*pi,150);
% y1=ppval(p,x1);
% plot(x1,y1,'b','linewidth',1.5)

%% variational    0
p=csape(x,y,'variational');
x1=linspace(0,2*pi,150);
y1=ppval(p,x1);
plot(x1,y1,'b','linewidth',1.5)
