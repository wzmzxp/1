function newpop = mutation(pop,pm,lb,ub,t,T)
% t 当前迭代次数
% T 最大迭代次数

[row,col] = size(pop);
newpop = zeros(row,col);

mut = {'均匀变异','边界变异','非均匀变异','高斯变异'};
switch mut{4}
    case '均匀变异'
        for i = 1:row
            mpoint = randi([1 col]);
            if rand < pm
                pop(i,mpoint) = lb(mpoint) + (ub(mpoint) - lb(mpoint))*rand;
                newpop(i,:) = pop(i,:);
            else
                newpop(i,:) = pop(i,:);
            end
        end
    case '边界变异'
        for i = 1:row
            mpoint = randi([1 col]);
            if rand < pm
                if randi([0 1]) == 0
                    pop(i,mpoint) = lb(mpoint);
                end
                if randi([0 1]) == 1
                    pop(i,mpoint) = ub(mpoint);
                end
                newpop(i,:) = pop(i,:);
            else
                newpop(i,:) = pop(i,:);
            end
        end
    case '非均匀变异'
        for i = 1:row
            mpoint = randi([1 col]);
            r = rand;
            a = (1-t/T);
            b = 5;% 2 - 5
            if rand < pm
                if randi([0 1]) == 0
                    pop(i,mpoint) = pop(i,mpoint) + (ub(mpoint) - pop(i,mpoint))*(1-r^(a*b));
                end
                if randi([0 1]) == 1
                    pop(i,mpoint) = pop(i,mpoint) - (pop(i,mpoint) - lb(mpoint))*(1-r^(a*b));
                end
                newpop(i,:) = pop(i,:);
            else
                newpop(i,:) = pop(i,:);
            end
        end
    case '高斯变异'
        for i = 1:row
            if rand < pm
                mpoint = randi([1 col]);
                mvalue = inf;
                while mvalue < lb(mpoint) || mvalue > ub(mpoint)
                    mvalue = (lb(mpoint) + ub(mpoint))/2 + (ub(mpoint) - lb(mpoint))/6*randn;
                end
                pop(i,mpoint) = mvalue;
                newpop(i,:) = pop(i,:);
            else
                newpop(i,:) = pop(i,:);
            end
        end
end
