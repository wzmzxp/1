function [nextX,nextY] = prey(Xi,Yi,vision,trynum,lb,ub,alfa,C,iter)
% 每一组解按行表示，列数表示解得分量数
% Xi 表示某一只鱼
% Yi 表示某一只鱼的当前食物浓度
% vision 表示视野
% step 表示步长
% trynum 表示尝试觅食次数
% lb 表示变量下界
% ub 表示变量上界

varnum = length(Xi);
for j = 1 : trynum
    Xj = Xi + vision*(2*rand(1,varnum) - 1);
    for k = 1 : varnum
        if Xj(k) < lb(k)
            Xj(k) = lb(k);
        end
        if Xj(k) > ub(k)
            Xj(k) = ub(k);
        end
    end
    Yj = foodconsistence(Xj);
    if Yj > Yi
        step = rand * norm(Xj - Xi);
        nextX = Xi + (Xj - Xi)/norm(Xj - Xi)*step*rand;
        nextY = foodconsistence(nextX);
        break;
    elseif Yj < Yi && exp(C*iter*(Yj - Yi)) > alfa
        step = rand * norm(Xj - Xi);
        nextX = Xi + (Xj - Xi)/norm(Xj - Xi)*step*rand;
        nextY = foodconsistence(nextX);
        break;
    end
end

if j == trynum
    nextX = Xj;
    nextY = foodconsistence(nextX);
end

