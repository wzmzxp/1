function C=fandem(V)

n=max(size(V));
k=n:-1:1;
for i=1:n
    C(:,k(i))=V.^(i-1);
end