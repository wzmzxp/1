n=5;
p=randi([1,5],1,n);
g=randi(2.^(0:1),1,n);
p1_index=find(g==1)
temp=0;
TG1=10;
temp1=[];
for i=1:size(p1_index,2)-1
    %����0-TG1�ڵ������a
    
    a=floor((TG1-temp)*rand(1));
    if a>TG1/2
        a=floor(a/2);
    end
    temp=temp+a;
    temp1=[temp1,a];
end
temp1=[temp1,TG1-temp];
p(p1_index)=temp1
% g1=g(p1_index)./sum(g(p1_index))
% p(p1_index)=g1
% p
s1=0;
s2=0;
TG1=1
TG21=0
TG22=0
% M1=find(g==1);
% tempM=find(g~=1);
% N=[1:1:n]
M1=[];
M2=[];
for i=1:n

      if g(i)==1 
          M1=[M1,i];
          TG21=TG21+p(i);
      end
      if  g(i)==2
          if (TG21+1)<=TG22
            M1=[M1,i];
             TG21=TG21+p(i);
          else
            M2=[M2,i];
             TG22=TG22+p(i);
          end
      
      end
end
sum(p(M1))
sum(p(M2))