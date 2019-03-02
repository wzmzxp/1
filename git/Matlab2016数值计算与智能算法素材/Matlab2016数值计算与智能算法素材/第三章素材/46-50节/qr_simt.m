function [q,r]=qr_simt(W)
for i=1:size(W,2)
    w{i}=W(:,i);
end
V{1}=w{1};
for i=2:size(W,2) %列数
    V{i}=w{i};
    temp=0;
    for j=1:i-1
        temp=temp+((V{j}'*w{i})/(V{j}'*V{j}))*V{j};
    end
    V{i}=V{i}-temp;
    beta(i)=norm(V{i});%保存模长
    V{i}=V{i}/norm(V{i});
end
beta(1)=norm(V{1});
V{1}=V{1}/norm(V{1});
% V=cell2mat(V);

q=cell2mat(V);
m=size(q,1);
for i=1:m
    for j=i:m
        if i == j
            r(i,j)=beta(i);
        end
        r(i,j)=w{j}'*V{i};%计算叉乘
    end
end