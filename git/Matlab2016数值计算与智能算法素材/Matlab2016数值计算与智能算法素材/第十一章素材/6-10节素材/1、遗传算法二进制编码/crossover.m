function newpop = crossover(dad,mom,pc)

[row,col] = size(dad);
for i = 1:row
    if rand < pc
        cpoint = randi([1 col-1]);
        newpop(i,:) = [dad(i,1:cpoint) mom(i,cpoint+1:end)];
    else
        newpop(i,:) = dad(i,:);
    end
end