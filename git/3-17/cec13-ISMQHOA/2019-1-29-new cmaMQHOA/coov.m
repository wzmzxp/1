function [covv]=coov(matrix,mea)
    
    if nargin==1 
        mea=mean(matrix);
    end
    [row,col]=size(matrix);
    covv=zeros(col,col);
     for i=1:col
         for j=1:col
             if i~=j
                 covv(i,j) =sum((matrix(:,i)-mea(i)).*(matrix(:,j)-mea(j)))/(size(matrix,1)-1);
                  
            
             else
                covv(i,i)=std(matrix(:,i))^2;
             end
         end
     end
%      covv= roundn(covv,-4)  ;
end