

function z=MOP4(X)
global typ
if typ==1
    z1=90*X(1)+85*X(2)+80*X(3)+80*X(4);
    z2=878*X(1)+8785*X(2)+9817*X(3)+17911*X(4);
     err=X(1)+130*X(2)+200*X(3)+190*X(4)-500 
    err=sum((err>0).*err);
    z=[z1,z2,err];
%     z=z*-1;
end
if typ==2
     z1=90*X(1)+85*X(2)+80*X(3)+80*X(4);
     z2=10*X(1)+9*X(2)+8*X(3)+9*X(4);  
      err=X(1)+130*X(2)+200*X(3)+190*X(4)-500 
    err=sum((err>0).*err);
    z=[z1,z2,err];
end
if typ==3
    z1=878*X(1)+8785*X(2)+9817*X(3)+17911*X(4);
    z2=10*X(1)+9*X(2)+8*X(3)+9*X(4);  
      err=X(1)+130*X(2)+200*X(3)+190*X(4)-500 
    err=sum((err>0).*err);
    z=[z1,z2,err];
end

end