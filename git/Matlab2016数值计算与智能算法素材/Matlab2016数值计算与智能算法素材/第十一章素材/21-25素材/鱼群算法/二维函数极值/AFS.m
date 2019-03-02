%% �˹���Ⱥ�㷨
close
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fishnum = 100;
trynum = 50;
vision = 1;
step = 0.1;
deta = 0.6;
maxgen = 200;
lb = [0 0];
ub = [20 20];


%% ������Ⱥ

X = lb + (ub - lb).*rand(fishnum,2);
Y = foodconsistence(X);

% ��ͼ
x = 0:0.5:20;
y = 0:0.5:20;
[x,y] = meshgrid(x,y);
z = sin(sqrt((x-10).^2+(y-10).^2))./sqrt((x-10).^2+(y-10).^2);
mesh(x,y,z)
hold on
h = scatter3(X(:,1),X(:,2),Y);
axis vis3d
[bulletin,bestindex] = max(Y); % �����Ƽ�¼��ʼ���ֵ
bestX = X(bestindex,:);

for iter = 1 : maxgen
    for i = 1 : fishnum
        % ����ִ��׷β��Ϊ��׷β���ɣ���ʳ
        [X1,Y1] = follow(X,i,vision,deta,step,lb,ub);
        % Ȼ��ִ�о�Ⱥ��Ϊ����Ⱥ���ɣ���ʳ
        [X2,Y2] = swarm(X,i,vision,deta,step,lb,ub);
        Xi = X(i,:);
        Yi = foodconsistence(Xi);
        [X3,Y3] = prey(Xi,Yi,vision,step,trynum,lb,ub);
        tempY = [Yi,Y1,Y2,Y3];
        tempX = [Xi;X1;X2;X3];
        [~,index] = max(tempY);
        X(i,:) = tempX(index,:);
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
    pause(0.01)
    h.XData = X(:,1);
    h.YData = X(:,2);
    h.ZData = foodconsistence(X);
end

fprintf('����λ�ã�%f %f\n',bestX)
fprintf('���ź���ֵ��%f\n',bulletin)



