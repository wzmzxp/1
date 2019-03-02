function [Xj,Yj] = follow(X,i,vision,deta,lb,ub)

Xi = X(i,:);
Yi = foodconsistence(Xi);
%% 计算其他鱼与当前鱼之间的距离
row = size(X,1);
temp = X - Xi;
for k = 1 : row
    D(k) = norm(temp(k,:));
end

visionRangeindextemp = find(D < vision);
selfindex = find(D == 0);
if length(visionRangeindextemp) < 2
    Xj = Xi;
    Yj = Yi;
else
    visionRangeindex = setdiff(visionRangeindextemp,selfindex);
    visionFish = X(visionRangeindex,:);
    Y = foodconsistence(X);
    [bestY,bestYindex] = max(Y);
    bestX = X(bestYindex,:);
    nf = length(visionRangeindex);
    if bestY/nf > deta*Yi
        step = rand * norm(bestX - Xi);
        Xj = Xi + (bestX - Xi)/norm(bestX - Xi)*step*rand;
        Yj = foodconsistence(Xj);
    else
        Xj = Xi;
        Yj = Yi;
    end
end
varnum = length(Xi);

for k = 1 : varnum
    if Xj(k) < lb(k)
        Xj(k) = lb(k);
        Yj = foodconsistence(Xj);
    end
    if Xj(k) > ub(k)
        Xj(k) = ub(k);
        Yj = foodconsistence(Xj);
    end
end


    
    
    