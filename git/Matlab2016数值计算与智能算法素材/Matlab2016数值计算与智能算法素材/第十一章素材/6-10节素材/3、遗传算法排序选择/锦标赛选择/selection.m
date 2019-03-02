function [dad,mom] = selection(pop,fitvalue)
global sn
[row,~] = size(pop);

%% 选择出row个个体
for i = 1:row
    r = randi([1 row],sn,1);
    [~,bestindex] = max(fitvalue(r)); %最大问题用max，最小问题用min
    dad(i,:) = pop(r(bestindex),:);
    mom(i,:) = pop(randi([1 row]),:);
end

