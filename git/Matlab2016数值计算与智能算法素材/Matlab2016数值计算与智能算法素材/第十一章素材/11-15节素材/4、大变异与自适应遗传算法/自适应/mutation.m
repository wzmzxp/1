function newpop = mutation(pop,pm1,pm2)
global  varnum L lb ub n

[row,col] = size(pop);
real = zeros(row,varnum);
spoint = cumsum([0 L]);
for i = 1:n
    for j = 1:varnum
        startpoint = spoint(j) + 1;
        endpoint = spoint(j+1);
        real(i,j) = decode(pop(i,startpoint:endpoint),lb(j),ub(j));
    end
end

%% 计算适应度值
fitvalue = fitnessfun(real);
Maxfitvalue = max(fitvalue);
Meanfitvalue = sum(fitvalue) / n;

newpop = zeros(row,col);
for i = 1:row
    f = fitvalue(i);
    if f >= Meanfitvalue
        pm = pm1*(Maxfitvalue - f )/(Maxfitvalue - Meanfitvalue);
    else
        pm = pm2;
    end
    
    mpoint = randi([1 col]);
    if rand < pm
        newpop(i,:) = ~pop(i,mpoint);
    else
        newpop(i,:) = pop(i,:);
    end
end