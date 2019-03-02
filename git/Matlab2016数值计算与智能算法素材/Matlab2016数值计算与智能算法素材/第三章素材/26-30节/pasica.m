function P=pasica(n)

if n == 0
    warning('ÊäÈëÊı×ÖÎª0');
    return;
end
P=zeros(n);
P(1,:)=1;
P(:,1)=1;

for m=2:n
    for k=2:n
        P(m,k)=P(m-1,k)+P(m,k-1);
    end
end
