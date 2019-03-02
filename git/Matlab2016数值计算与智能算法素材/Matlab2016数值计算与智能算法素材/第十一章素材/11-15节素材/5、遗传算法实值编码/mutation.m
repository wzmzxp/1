function newpop = mutation(pop,pm,lb,ub)


[row,col] = size(pop);
newpop = zeros(row,col);


for i = 1:row
    mpoint = randi([1 col]);
    if rand < pm
        pop(i,mpoint) = lb(mpoint) + (ub(mpoint) - lb(mpoint))*rand;
        newpop(i,:) = pop(i,:);
    else
        newpop(i,:) = pop(i,:);
    end
end


