%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA120
% Project Title: Non-dominated Sorting Genetic Algorithm II (NSGA-II)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function y=Mutate(x,mu,sigma)

%     nVar=numel(x);
%     
%     nMu=ceil(mu*nVar);
% 
%     j=randsample(nVar,nMu);
%     if numel(sigma)>1
%         sigma = sigma(j);
%     end
%     
    y=x;
%     
%     y(j)=x(j)+sigma.*randn(size(j));
%     if (y(j)) <=0
%         disp('----------');
%     end
end