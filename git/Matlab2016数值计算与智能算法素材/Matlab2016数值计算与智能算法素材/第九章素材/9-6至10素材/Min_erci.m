function [x,result]=Min_erci(f,x0,k)

x1=x0(1);
x3=x0(2);
x2=(x1+x3)/2;

n=1;
while n < k
    % 确定抛物线的系数
    f1=f(x1);
    f2=f(x2);
    f3=f(x3);
    A=[x1^2    x1   1;
       x2^2    x2   1;
       x3^2    x3   1;];
   b=[f1;f2;f3];
   XS=A\b;
   xp=-XS(2)/(2*XS(1));
   fp=f(xp);
   if abs(xp-x2) < 1e-8
       x=xp;
       result=f(x);
       return;
   end
   if fp > f2
       if xp < x2
           x1=xp;
       else
           x3=xp;
       end
   else
       if xp < x2
           x3=x2;
           x2=xp;
       else
           x1=x2;
           x2=xp;
       end
   end
    n=n+1;
end

if n == k
    x=[];
    result=[];
    disp('超过迭代次数');
end


