function [X,tol]=newton_sys(f,x0,n)
e=1e-6;
F=matlabFunction(f);% º¯Êý¾ä±ú
F1=jacobian(f,symvar(f))^(-1);
B=symvar(F1);
F1=matlabFunction(F1); %ÑÅ¿Ë±È¾ØÕóº¯Êý¾ä±ú

i=1;
h=length(x0);
m=length(B);
FF='F(';
FF1='F1(';
for k = 1:h
    FF=[FF,'x0(',num2str(k),'),'];
    for j=1:m
        A=char(B(j));
        if A == ['x',num2str(k)]
            FF1=[FF1,'x0(',num2str(k),'),'];
        end
    end
end
FF(end)=')';
FF1(end)=')';

while 1
    x1=x0(:)-eval(FF1)*eval(FF);
    if norm(x0-x1) < e
        X=x1;
        tol=eval(FF);
        return;
    end
    if i > n
        X=x1;
        tol=eval(FF);
        return;
    end
    i=i+1;
    x0=x1;
end



