function V=smit(W)
for i=1:size(W,2)
    w{i}=W(:,i);
end
V{1}=w{1};
for i=2:size(W,2) %ÁÐÊý
    V{i}=w{i};
    temp=0;
    for j=1:i-1
        temp=temp+((V{j}'*w{i})/(V{j}'*V{j}))*V{j};
    end
    V{i}=V{i}-temp;
    V{i}=V{i}/norm(V{i});
end
V{1}=V{1}/norm(V{1});
V=cell2mat(V);
