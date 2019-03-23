%  de_rand exponential RL
%
function y=derandexp_RLe(P,hod,F,CR,expt)
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
L=1+fix(d*rand(1));  % starting position for crossover
change=L;
position=L;
while rand(1) < CR && length(change) < d
    position=position+1;
    if position <= d
        change(end+1)=position;
    else
        change(end+1)=mod(position,d);
    end
end
y(change)=v(change);
%