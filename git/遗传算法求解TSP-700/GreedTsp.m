function [path,shortlen]=GreedTsp(D,first)
%first起始点的序号
n=size(D,1);%n表示问题的规模（城市个数）
path=zeros(1,n);
% D=zeros(n,n);%D表示完全图的赋权邻接矩阵
%     for i=1:n
%        for j=1:n
%          if i~=j
%             D(i,j)=((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2)^0.5;
%          else
%             D(i,j)=eps;                                          % i = j 时不计算，应该为0，但后面的启发因子要取倒数，用eps（浮点相对精度）表示
%          end
%           D(j,i)=D(i,j);                                        %对称矩阵
%      end
%     end

    path(1)=first;
    shortlen=0;
    for(i=1:n-1)
        %将D矩阵的第path(i)行提取出来
        row=D(path(i),:);
        rowlen=length(D);
        rowmin=inf;
        rowminloc=0;
        
        for(j=1:rowlen)
            %将该行中最小值找出，且该最小值下标loc不等于path(i)
            %假如j不在path中则进行比较
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
    pathlen=length(path);D
    path(pathlen)
    D(path(pathlen),1)
  shortlen=shortlen+D(path(pathlen),2);
    
    %path;
    shortlen;
end