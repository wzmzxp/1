function [ D ] = other( D )

%����֮��ĺ����Ŀ,��ͨ����Ӧ��ϵ����ɣ�0,1��
reds=randi(31,31);
for i=1:31
    for j=1:31
        reds(j,i)=reds(i,j);
    end
end
reds=reds./10;
%����֮���·��ϵ��
roads=rand(31,31);
for i=1:31
    for j=1:31
        roads(j,i)=roads(i,j);
    end
end
roads=roads./10;
%����֮��Ķ³�ϵ��
crowds=rand(31,31);
for i=1:31
    for j=1:31
        crowds(j,i)=crowds(i,j);
    end
end
crowds=crowds./10;
%�����·�����������������������Ӧ���Թ�ϵ
D=D+D.*reds+D.*roads+D.*crowds;
end

