function newpop = crossover(dad,mom,pc1,pc2)
global  varnum L lb ub n

[row,col] = size(dad);
spoint = cumsum([0 L]);
for i = 1:n
    for j = 1:varnum
        startpoint = spoint(j) + 1;
        endpoint = spoint(j+1);
        real(i,j) = decode(dad(i,startpoint:endpoint),lb(j),ub(j));
    end
end

%% 计算适应度值
fitvalue = fitnessfun(real);
Maxfitvalue = max(fitvalue);
Meanfitvalue = sum(fitvalue)/n;

for i = 1:n
    for j = 1:varnum
        startpoint = spoint(j) + 1;
        endpoint = spoint(j+1);
        Mreal = decode(mom(i,startpoint:endpoint),lb(j),ub(j));
    end
    
    Mfit = fitnessfun(Mreal);
    if max(Mfit,fitvalue(i)) >= Meanfitvalue
        pc = pc1*(Maxfitvalue - max(Mfit,fitvalue(i)))/(Maxfitvalue - Meanfitvalue);
    else
        pc = pc2;
    end
    
    if rand < pc
        cpoint = randi([1 col-1]);
        newpop(i,:) = [dad(i,1:cpoint) mom(i,cpoint+1:end)];
    else
        newpop(i,:) = dad(i,:);
    end
end

