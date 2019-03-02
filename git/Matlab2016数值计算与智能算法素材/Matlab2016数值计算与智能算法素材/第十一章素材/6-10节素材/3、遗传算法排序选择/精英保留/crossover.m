function newpop = crossover(dad,mom,pc)

[row,col] = size(dad);
for i = 1:row
    r = rand;
    if r < pc
        cpoint = randi([2 col-1]);
        newpop(i,:) = [dad(i,1:cpoint) mom(i,cpoint+1:end)];
    else
        newpop(i,:) = dad(i,:);
    end
end