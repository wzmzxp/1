function newpop = crossover(dad,pc)

[row,col] = size(dad);
cross = {'离散交叉','算术交叉','平均交叉','启发式交叉'};
switch cross{4}
    case '离散交叉'
        for i = 1:2:row-1
            if rand < pc
                for j = 1:col
                    if randi([0 1]) == 1
                        newpop(i,j) = dad(i,j);
                        newpop(i+1,j) = dad(i+1,j);
                    else
                        newpop(i,j) = dad(i+1,j);
                        newpop(i+1,j) = dad(i,j);
                    end
                end
            else
                newpop(i,:) = dad(i,:);
                newpop(i+1,:) = dad(i+1,:);
            end
        end
    case '算术交叉'
        for i = 1:2:row-1
            if rand < pc
                cpoint = randi([1 col]);
                r = rand;
                newpop(i,:) = r*dad(i,cpoint) + (1-r)*dad(i+1,cpoint);
                newpop(i+1,:) = r*dad(i+1,cpoint) + (1-r)*dad(i,cpoint);
            else
                newpop(i,:) = dad(i,:);
                newpop(i+1,:) = dad(i+1,:);
            end
        end
    case '平均交叉'
         for i = 1:2:row-1
            if rand < pc
                cpoint = randi([1 col]);
                r = rand;
                newpop(i,:) = 0.5*dad(i,cpoint) + (1-0.5)*dad(i+1,cpoint);
                newpop(i+1,:) = 0.5*dad(i+1,cpoint) + (1-0.5)*dad(i,cpoint);
            else
                newpop(i,:) = dad(i,:);
                newpop(i+1,:) = dad(i+1,:);
            end
         end
    case '启发式交叉'
        for i = 1:2:row-1
            if rand < pc
                f1 = fitnessfun(dad(i,:));
                f2 = fitnessfun(dad(i+1,:));
                if f1 > f2 % i是好的
                    newpop(i,:) = dad(i,:);
                    newpop(i+1,:) = dad(i+1,:) + 1.2*(dad(i,:)-dad(i+1,:));
                else %i+1是好的
                    newpop(i,:) = dad(i,:) + 1.2*(dad(i+1,:)-dad(i,:));
                    newpop(i+1,:) = dad(i+1,:);
                end
            else
                newpop(i,:) = dad(i,:);
                newpop(i+1,:) = dad(i+1,:);
            end
        end
end




