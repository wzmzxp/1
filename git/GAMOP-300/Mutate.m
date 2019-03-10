

function y=Mutate(x,mu,sigma)

    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    if numel(sigma)>1
        sigma = sigma(j);
    end
    
    y=x;
    
    y(j)=x(j)+sigma.*randn(size(j));

end