function newpop = Lmutation(pop,Lpm,Bestindex)
[row,col] = size(pop);

newpop = zeros(size(pop));
for i = 1 : row
    r = rand;
    mpoint = randi([1 col]);
    if r < Lpm && i~=Bestindex
        newpop(i,:) = ~pop(i,mpoint);
    else
        newpop(i,:) = pop(i,:);
    end
end