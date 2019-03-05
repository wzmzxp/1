global  D type
t=1:.1:10;
%UEL ULW
type='ULW'
res=[];
for i=1:10
   D=t(i);
   res(i)=F11();
    
end
res