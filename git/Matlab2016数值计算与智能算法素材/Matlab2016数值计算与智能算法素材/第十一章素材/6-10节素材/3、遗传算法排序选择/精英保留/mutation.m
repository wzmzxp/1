function newpop = mutation(pop,pm)

[row,col] = size(pop);
newpop = zeros(row,col);
for i = 1:row
    mpoint = randi([1 col]);
    r = rand;
    if r < pm
        newpop(i,:) = ~pop(i,mpoint);
    else
        newpop(i,:) = pop(i,:);
    end
end