function  A=shangxia(A)

m=size(A,1);
if rem(m,2) == 1
    n=(m-1)/2;
end
if rem(m,2) == 0, n=m/2; end

for i=1:n
    B=A(i,:);
    A(i,:)=A(m-i+1,:);
    A(m-i+1,:)=B;
end