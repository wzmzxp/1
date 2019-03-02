function [Xj,Yj] = swarm(X,i,vision,deta,step,lb,ub)

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
    nf = length(visionRangeindex);
    visionFish = X(visionRangeindex,:);
    Xc = sum(visionFish,1)/nf;
    Yc = foodconsistence(Xc);
    
    if Yc/nf > deta*Yi
        Xj = Xi + (Xc - Xi)/norm(Xc - Xi)*step*rand;
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

    
    
    
    