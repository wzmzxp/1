function [dad,mom] = selection(pop,fitvalue)

[row,~] = size(pop);


Ni = row * fitvalue / (sum(fitvalue))

Int = floor(Ni);
[introw,~,Nzero]= find(Int);
Newindex = cumsum([0 ;Nzero]);

for i = 1:length(introw)
    for j = Newindex(i)+1 : Newindex(i+1)
        dad(j,:) = pop(introw(i),:);
    end
end


Float = mod(Ni,1);
[~,index] = sort(Float,'descend');
Left = row - sum(Nzero);
if Left > 0
    dad(row:-1:row-Left+1,:) = pop(index(1:Left),:);
end

mom(1:row,:) = pop(randi([1 row],row,1),:);


