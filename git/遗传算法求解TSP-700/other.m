function [ D ] = other( D )

%各地之间的红灯数目,可通过对应关系换算成（0,1）
reds=randi(31,31);
for i=1:31
    for j=1:31
        reds(j,i)=reds(i,j);
    end
end
reds=reds./10;
%各地之间的路况系数
roads=rand(31,31);
for i=1:31
    for j=1:31
        roads(j,i)=roads(i,j);
    end
end
roads=roads./10;
%各地之间的堵车系数
crowds=rand(31,31);
for i=1:31
    for j=1:31
        crowds(j,i)=crowds(i,j);
    end
end
crowds=crowds./10;
%假设道路距离与以上三个参数满足对应线性关系
D=D+D.*reds+D.*roads+D.*crowds;
end

