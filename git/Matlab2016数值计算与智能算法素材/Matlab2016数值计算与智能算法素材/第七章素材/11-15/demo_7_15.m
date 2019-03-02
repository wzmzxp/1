%% 最小二乘拟合  lsqcurvefit
xdata=linspace(0,2*pi,15);
y=5*sin(xdata)+2*xdata+xdata.^2;
y=y+2*rand(1,15);
plot(xdata,y,'o')
hold on

fun=@(x,xdata) x(1)*sin(xdata)+x(2)*xdata+x(3)*xdata.^2;
% x=lsqcurvefit(fun,[0 0 0],xdata,y);
% xx=linspace(0,2*pi,150);
% yy=fun(x,xx);
% plot(xx,yy)

% lb=[-1 -1 -1];
% ub=[6 3 2];
% x=lsqcurvefit(fun,[0 0 0],xdata,y,lb,ub);
% xx=linspace(0,2*pi,150);
% yy=fun(x,xx);
% plot(xx,yy)

% options=optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
options=optimoptions('lsqcurvefit','Display','final');
lb=[-1 -1 -1];
ub=[6 3 2];
[x,~,~,exitflag,~,~,jacobian]=lsqcurvefit(fun,[0 0 0],xdata,y,lb,ub,options)
xx=linspace(0,2*pi,150);
yy=fun(x,xx);
plot(xx,yy)

