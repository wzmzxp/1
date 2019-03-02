function [nextX,nextY] = prey(Xi,Yi,vision,trynum,lb,ub,alfa,C,iter)
% ÿһ��ⰴ�б�ʾ��������ʾ��÷�����
% Xi ��ʾĳһֻ��
% Yi ��ʾĳһֻ��ĵ�ǰʳ��Ũ��
% vision ��ʾ��Ұ
% step ��ʾ����
% trynum ��ʾ������ʳ����
% lb ��ʾ�����½�
% ub ��ʾ�����Ͻ�

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

