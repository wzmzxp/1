n=10;
k=4
index=randi(k+1,1,n);
a=2.^[0:1:k]
p=a(index)
p=randi(2.^(0:1),1,n);
s1=0;
s2=0;
TG1=0
TG2=0
Ub=0
p1=0;
M1=find(g==1);
N=[1:1:n]
for j=1:n
    if g(1,j)==1
        s1=s1+p(1,j);
        TG1=TG1+p(1,j);
        p1=max(p1,p(1,j));
    elseif g(1,j)==2
        TG2=TG2+p(1,j);
        p1=max(p1,p(1,j));
        ub=min((TG1+TG2)/2, TG2);
        Ub=min(ub,(TG1+TG2)-p1);
        if s1<1/(2^k)*Ub
            s1=s1+p(1,j);
            M1=[M1 j];
        else s2=s2+p(1,j);
        end
    end
end
s=s1+s2;
M1

M2 = setxor(N,M1)