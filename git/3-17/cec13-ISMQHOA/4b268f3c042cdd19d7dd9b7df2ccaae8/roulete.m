function [res, p_min]=roulete(cutpoints)
%
% returns an integer from [1, length(cutpoints)] with probability proportional
% to cutpoints(i)/ summa cutpoints
%
h =length(cutpoints);
ss=sum(cutpoints);
p_min=min(cutpoints)/ss;
cp(1)=cutpoints(1);
for i=2:h
    cp(i)=cp(i-1)+cutpoints(i);
end
cp=cp/ss;
res=1+fix(sum(cp<rand(1)));
