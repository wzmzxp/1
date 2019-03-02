n=5;
p=randi([1,5],1,n);
g=randi(2.^(0:1),1,n);
s1=0;
s2=0;
A=0
TG21=0
TG22=0
M1=find(g==1);
N=[1:1:n]
for j=1:n
    if g(1,j)==1
        A=A+p(1,j);
      s1=A
        
    elseif g(1,j)==2
        if TG21+A<TG22
            TG21=TG21+p(1,j);
            s1=s1+TG21;
            M1=[M1 j];
        else TG22=TG22+p(1,j);
        end
    end
end
s=s1+TG21+TG22;
M1
M2 = setxor(N,M1)