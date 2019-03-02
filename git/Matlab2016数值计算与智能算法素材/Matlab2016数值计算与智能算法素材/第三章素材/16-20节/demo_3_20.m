%Ä§·½¾ØÕóºÍ¶Ô½Ç¾ØÕó

%Ä§·½¾ØÕó
% A=magic(5)
% a=sum(A,1)
% a=sum(A,2)
% b=0;
% for m=1:size(A,1)
%     b=b+A(m,m);
% end
% c=trace(A)

%¶Ô½Ç¾ØÕódiag blkdiag
% a=[1 2 3 4]
% A=diag(a)
% B=diag(a,1)
% C=diag(a,-1)

%blkdiag
a=[2 3 4]
b=[2;3]
c=3
A=blkdiag(a,b,c)



    