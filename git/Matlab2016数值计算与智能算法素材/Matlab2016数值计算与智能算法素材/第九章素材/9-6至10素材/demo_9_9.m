%% ¹²éîÌİ¶È
syms x1 x2
f=x1.^2+x2.^2-x1*x2-10*x1-4*x2+60;
% f=(x1-3)^2+x2^2;
[x,result]=Min_gongetidu(f,[0 0],1e-6)