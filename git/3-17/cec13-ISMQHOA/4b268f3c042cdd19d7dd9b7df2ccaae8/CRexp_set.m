%  setting CR for given probability of mutation 
%  and dimension of search space
%
function CR=CRexp_set(p,d)
	y=zeros(1,d+1);
    y(1)=1;
    y(d)=-d*p;
    y(d+1)=d*p-1;
    r=roots(y);
    ri=imag(r);
    zrus=find(ri~=0);
    r(zrus)=[];
    zrus=find(r<0 | r>=1);
    r(zrus)=[];
    r=sort(r);
    CR=r(1);
%   