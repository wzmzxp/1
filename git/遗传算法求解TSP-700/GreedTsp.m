function [path,shortlen]=GreedTsp(D,first)
%first��ʼ������
n=size(D,1);%n��ʾ����Ĺ�ģ�����и�����
path=zeros(1,n);
% D=zeros(n,n);%D��ʾ��ȫͼ�ĸ�Ȩ�ڽӾ���
%     for i=1:n
%        for j=1:n
%          if i~=j
%             D(i,j)=((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2)^0.5;
%          else
%             D(i,j)=eps;                                          % i = j ʱ�����㣬Ӧ��Ϊ0�����������������Ҫȡ��������eps��������Ծ��ȣ���ʾ
%          end
%           D(j,i)=D(i,j);                                        %�Գƾ���
%      end
%     end

    path(1)=first;
    shortlen=0;
    for(i=1:n-1)
        %��D����ĵ�path(i)����ȡ����
        row=D(path(i),:);
        rowlen=length(D);
        rowmin=inf;
        rowminloc=0;
        
        for(j=1:rowlen)
            %����������Сֵ�ҳ����Ҹ���Сֵ�±�loc������path(i)
            %����j����path������бȽ�
            istrue=1;
            path;
            
            
            if ismember(j,path)==0 & path(i)~=j
                if(D(path(i),j)<rowmin)
                    rowmin=D(path(i),j);
                    rowminloc=j;
                end
            end
        end
        rowminloc;
        path(i+1)=rowminloc;
        shortlen=shortlen+rowmin;
    end
    pathlen=length(path);
    path(pathlen);
    D(path(pathlen),1);
  shortlen=shortlen+D(path(pathlen),2);
    
    %path;
    shortlen;
end