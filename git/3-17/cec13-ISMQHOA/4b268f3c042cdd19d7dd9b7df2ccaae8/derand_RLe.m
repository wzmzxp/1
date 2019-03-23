%  de_rand binomial
%   RL random local, r1 by tournament, Kaelo, Ali 2007
function y=derand_RLe(P,hod,F,CR,expt)
N=length(P(:,1));
d=length(P(1,:));
y=P(expt(1),1:d);
vyb=nahvyb_expt(N,3,expt);	% three random points without expt
r123=P(vyb,:);
hod123=hod(vyb);
[fmin, indmin]=min(hod123);
r1=r123(indmin,:);
r123(indmin,:)=[];
r2=r123(1,:);
r3=r123(2,:);
v=r1+F*(r2-r3);
change=find(rand(1,d)<CR);
if isempty(change) % at least one element is changed
    change=1+fix(d*rand(1));
end
y(change)=v(change);
%