%% CS �������㷨
clear
close
clc
nestnum = 15;
Pa = 0.25;
alfa = 0.01;
beta = 1.5;
lb = -pi;
ub = pi;
maxgen = 500;

nest = lb + (ub - lb)*rand(nestnum,1);
fval = objfunc(nest);

[fbest,fbestindex]  = max(fval);
bestnest = nest(fbestindex);

plotx = linspace(-pi,pi,200);
ploty = objfunc(plotx);
plot(plotx,ploty);
hold on
h = plot(nest,fval,'*');
% ��¼ȫ�ּ�ֵ
fmax = fbest;
nestmax = bestnest;

for iter = 1 : maxgen
    for i = 1 : nestnum
        s = nest(i);
        newnest = s + alfa*(s - bestnest)*levyrand(beta)*randn; % ������һ�����������Ƕ��������Ҫ�������levy������Ͷ��randn�����Ȼ���Ӧ���
        if newnest < lb
            newnest = lb;
        end
        if newnest > ub
            newnest = ub;
        end
        fnew = objfunc(newnest);
        if fnew > fval(i)
            fval(i) = fnew;
            nest(i) = newnest;
        end
    end
    
    for i = 1 : nestnum
        if rand < Pa
            si = nest(i);
            leftnestindex = setdiff(1:nestnum,i);
            leftnest = nest(leftnestindex,:);
            index = randi(length(leftnestindex),2,1);
            sj = leftnest(index(1),:);
            sk = leftnest(index(2),:);
            newnest = si + (sj - sk)*rand;
            if newnest < lb
                newnest = lb;
            end
            if newnest > ub
                newnest = ub;
            end
            fnew = objfunc(newnest);
            if fnew > fval(i)
                fval(i) = fnew;
                nest(i) = newnest;
            end
        end
    end
    [fbest,fbestindex]  = max(fval);
    bestnest = nest(fbestindex);
    
    h.XData = nest;
    h.YData = fval;
    pause(0.02);
    if fbest > fmax
        fmax = fbest;
        nestmax = bestnest;
    end   
end


fprintf('���λ�ã�%f\r��Ѻ���ֵ��%f\r',nestmax,fmax)

