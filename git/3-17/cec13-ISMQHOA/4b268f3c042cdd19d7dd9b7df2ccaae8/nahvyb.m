% random sample, k of N without repetiotion
%
function nahv=nahvyb(N,k);
opora=1:N;
nahv=zeros(1,k);
for i=1:k
	index=1+fix(rand(1)*length(opora));
	nahv(i)=opora(index);
	opora(index)=[];
end
%