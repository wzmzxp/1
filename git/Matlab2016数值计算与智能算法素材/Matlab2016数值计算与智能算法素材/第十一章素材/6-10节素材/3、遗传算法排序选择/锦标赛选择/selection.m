function [dad,mom] = selection(pop,fitvalue)
global sn
[row,~] = size(pop);

%% ѡ���row������
for i = 1:row
    r = randi([1 row],sn,1);
    [~,bestindex] = max(fitvalue(r)); %���������max����С������min
    dad(i,:) = pop(r(bestindex),:);
    mom(i,:) = pop(randi([1 row]),:);
end

