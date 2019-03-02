function newpop = mutation(pop,pm,lb,ub,t,T)
% t ��ǰ��������
% T ����������

[row,col] = size(pop);
newpop = zeros(row,col);

mut = {'���ȱ���','�߽����','�Ǿ��ȱ���','��˹����'};
switch mut{4}
    case '���ȱ���'
        for i = 1:row
            mpoint = randi([1 col]);
            if rand < pm
                pop(i,mpoint) = lb(mpoint) + (ub(mpoint) - lb(mpoint))*rand;
                newpop(i,:) = pop(i,:);
            else
                newpop(i,:) = pop(i,:);
            end
        end
    case '�߽����'
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
    case '�Ǿ��ȱ���'
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
    case '��˹����'
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
