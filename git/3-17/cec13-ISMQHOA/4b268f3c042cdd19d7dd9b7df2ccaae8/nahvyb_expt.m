% random sample, k of N without repetition, 
% numbers given in vector expt are not included
%
function vyb=nahvyb_expt(N,k,expt);
opora=1:N;
if nargin==3 opora(expt)=[]; end
vyb=zeros(1,k);
for i=1:k
	index=1+fix(rand(1)*length(opora));
	vyb(i)=opora(index);
	opora(index)=[];
end
%