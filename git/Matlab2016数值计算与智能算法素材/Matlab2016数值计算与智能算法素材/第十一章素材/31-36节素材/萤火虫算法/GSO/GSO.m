%%  GSO ө����㷨
clear
close
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
glowwormnum = 12;
L0 = 5; %��ʼӫ���ش�С
rs = 7; % ����֪�뾶
rho = 0.4; % ӫ���ػӷ�ϵ��
gama = 0.6; %ӫ���ظ�����
beta = 0.1; % ��֪�뾶�仯ϵ��
s = 0.03; % ����
nt = 5; % ��֪��Χ���޶������������
maxgen = 500;
lb = -pi;
ub = pi;

%% ��ʼ��
Li = ones(glowwormnum,1)*L0; %��ʼ��ÿֻө���ӫ����
rdi = ones(glowwormnum,1)*rs;

X = lb + (ub - lb)*rand(glowwormnum,1);
Y = objfunc(X);
[bestY,bestYindex] = max(Y);
bestX = X(bestYindex);

%% ��ͼ
plotx = linspace(-pi,pi,400);
ploty = objfunc(plotx);
plot(plotx,ploty)
hold on
h = plot(X,Y,'*');


for iter = 1 : maxgen
    %% ����ӫ����
    Li = (1-rho)*Li + gama*Y;
    for i = 1 : glowwormnum
        %% �ж�ÿһֻ ө���ľ��߷�Χ�ڷ���Ҫ���ө���
        dist = sqrt((X - X(i)).^2);
        Rindex = setdiff(find(dist < rdi(i)),i); %�ܿ�����ө��������ֵ
        if isempty(Rindex)
            rdi(i)=min(rs,max(0,rdi(i)+beta*(nt)));
            continue;
        end
        index = Rindex( Li(Rindex) > Li(i) ); % ���Լ��õ���Ұ��Χ�ڵ�����ֵ
        if isempty(index)
            rdi(i)=min(rs,max(0,rdi(i)+beta*(nt)));
            continue;
        end
        Betterglowworm =X(index); % ���Լ��õ�ө���
        sumNit = sum(Li(index));
        Lj = Li(index);
        p = (Lj - Li(i)) / (sumNit - Li(i));
        P = cumsum(p./sum(p));
        Pindex = find(P > rand);
        neighborGlowworm = X(index(Pindex(1)));
        nextX = X(i) + s*(neighborGlowworm - X(i)) / norm(neighborGlowworm - X(i));
        if nextX < lb
            nextX = lb;
        end
        if nextX > ub
            nextX = ub;
        end
        nextY = objfunc(nextX);
        X(i) = nextX;
        Y(i) = nextY;
        if nextY > bestY
            bestY = nextY;
            bestX = nextX;
        end
        rdi(i)=min(rs,max(0,rdi(i)+beta*(nt-length(Betterglowworm))));
        %% ����ө���λ��
    end
    h.XData = X;
    h.YData = Y;
    pause(0.02);
end

fprintf('����λ�ã�%f\r���ź���ֵ��%f\r',bestX,bestY)

