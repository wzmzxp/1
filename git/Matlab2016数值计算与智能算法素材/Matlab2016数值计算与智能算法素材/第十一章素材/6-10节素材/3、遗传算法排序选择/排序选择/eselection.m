function newpop = eselection(pop,bestfitvalue,bestx)

global  n varnum lb ub L

spoint = cumsum([0 L]);
for i = 1:n
    for j = 1:varnum
        startpoint = spoint(j) + 1;
        endpoint = spoint(j+1);
        real(i,j) = decode(pop(i,startpoint:endpoint),lb(j),ub(j));
    end
end

fitvalue = fitnessfun(real);

% 寻找出最优与最差
[Gbestfitvalue,Gbestindex] = max(fitvalue);
[Gbadfitvalue,Gbadindex] = min(fitvalue);

% 如果本次最优小于上次最优，说明种群没有进化，替换最差
if Gbestfitvalue < bestfitvalue
    pop(Gbadindex(1),:) = bestx;
    
end
newpop = pop;