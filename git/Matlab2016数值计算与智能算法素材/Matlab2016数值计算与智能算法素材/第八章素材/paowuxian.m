function [result,tol]=paowuxian(h,x)

if nargout == 1|| nargout == 1
    flag=1;
elseif nargout == 2
    flag=2;
end
f=h;
x1=x(1);
x2=x(2);
x3=x(3);
while 1
    y1=f(x1);
    y2=f(x2);
    y3=f(x3);
    f1=lagrange([x1,x2,x3],[y1,y2,y3]);
    a=f1(1); b=f1(2); c=f1(3);
%     if b^2-4*a*c <=0
%         disp('³õÖµ²»ºÏÊÊ£¡');
%         result=[];
%         tol=[];
%         return;
%     end
    x4_1=(-b+sqrt(b^2-4*a*c))/(2*a);
    x4_2=(-b-sqrt(b^2-4*a*c))/(2*a);
    if abs(x1-x4_1) < abs(x1-x4_2)
        x4=x4_1;
    else
        x4=x4_2;
    end
    if abs(f(x4)) < 1e-6
        if flag==1 || flag==0
            result=x4;
            return;
        elseif flag == 2
            result=x4;
            tol=abs(f(x4));
            return;
        end
    end
        x1=x2;
        x2=x3;
        x3=x4;    
end
