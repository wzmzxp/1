function [l,d,u]=LDU(A)
[l,u]=Doolittle_DQ(A)
d=diag(diag(u))

for i=1:size(A,1)
    u(i,:)=u(i,:)/d(i,i);
end

