

function y=Mutate(x,mu,sigma)
global VarMin VarMax
    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    if numel(sigma)>1
        sigma = sigma(j);
    end
    
    y=x;
    
    y(j)=x(j)+sigma.*randn(size(j));
%      if y(j)<0
%         y(j)= unifrnd(VarMin,VarMax,1);
%     end
%     if y2<0
%         y2= unifrnd(VarMin1,VarMax1,1);
%     end
end