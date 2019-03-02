%% �˹���Ⱥ�㷨
close
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fishnum = 100;
trynum = 50;
vision = 1;
step = 0.5;
deta = 0.5;
maxgen = 50;
C = 2;
alfa = 0.5;
lb = -pi;
ub = pi;


%% ������Ⱥ
X = lb + (ub - lb)*rand(fishnum,1);
Y = foodconsistence(X);

% ��ͼ
x = linspace(-pi,pi,100);
y = 11*sin(6*x) + 7*cos(5*x);
h = plot(x,y,X,Y,'*');

[bulletin,bestindex] = max(Y); % �����Ƽ�¼��ʼ���ֵ
bestX = X(bestindex,:);

for iter = 1 : maxgen
    for i = 1 : fishnum
        % ����ִ��׷β��Ϊ��׷β���ɣ���ʳ
        [X1,Y1] = follow(X,i,vision,deta,lb,ub);
        % Ȼ��ִ�о�Ⱥ��Ϊ����Ⱥ���ɣ���ʳ
        [X2,Y2] = swarm(X,i,vision,deta,lb,ub);
        Xi = X(i,:);
        Yi = foodconsistence(Xi);
        [X3,Y3] = prey(Xi,Yi,vision,trynum,lb,ub,alfa,C,iter);
        tempY = [Yi,Y1,Y2,Y3];
        tempX = [Xi;X1;X2;X3];
        [~,index] = max(tempY);
        X(i,:) = tempX(index);
        if foodconsistence(X(i,:)) > bulletin
            bulletin = foodconsistence(X(i,:));
            bestX = X(i,:);
        end
        % Ȼ��ִ����ʳ��Ϊ����ʳ���ɣ��������ʳ��������ܳ�����Χ���жϱ߽�
        % �ж��ǲ����Ż��ˣ�û���Ż��������Ϊ
        % ���¹����
    end
    iterbestY = max(foodconsistence(X));
    interbestvalue(iter) = iterbestY;
    pause(0.1)
    h(2).XData = X;
    h(2).YData = foodconsistence(X);
end

fprintf('���λ�ã�%f\r��Ѻ���ֵ��%f\r',bestX,bulletin)
