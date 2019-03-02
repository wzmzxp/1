%% �������С����ϵͳ
clear
close
clc
n = 10;  % ��������
m = 30;  % ��������
alfa = 1;
beta = 6;
rho = 0.01;
taumax = 1;
taumin = 0.01;
omg = 0.5;
flag = 1;
maxgen = 500;
x = [2 14 9 6 3 2 4 8 12 5]';
y = [8 9 12 4 1 2 5 8 1 15]';
City = [x,y]; % ��������

%% ����֮����໥����
for i = 1:n
    D(i,:) = ((City(i,1) - City(:,1)).^2 + (City(i,2) - City(:,2)).^2).^0.5 + eps;
end

eta = 1./D;  
tau = ones(n)*omg*taumax; 
path = zeros(m,n); 

for iter = 1: maxgen
    %% ��������
    path(:,1) = randi([1 n],m,1); 
    %% ���Ͽ�ʼ����ʣ�µĳ���
    for i = 2 : n
        for j = 1 : m
            visited = path(j,1:i-1);
            leftcity = setdiff(1:n,visited);
            %% ����ȥʣ�µĳ��еĸ���
            P = zeros(1,length(leftcity));
            for k = 1:length(leftcity)
                P(k) = tau(visited(end),leftcity(k))^alfa*eta(visited(end),leftcity(k))^beta;%��ʽ�ķ���
            end
            P1 = sum(P);
            Pk = P / P1; 
            % �����̶ĵķ�ʽ���ѡ��
            P = cumsum(Pk);
            r = rand;
            index = find(P >= r);
            nextcity = leftcity(index(1));
            path(j,i) = nextcity;
        end
    end

    % ������Ϣ�أ�·��������
    path = horzcat(path,path(:,1));
    for i = 1 : m
        node = path(i,:); 
        d = 0;
        for j = 1 : n 
            d = d + D(node(j),node(j + 1));
        end
        L(i) = d; 
    end
    [shortroute,antindex] = min(L); 
    Lbest(iter) = shortroute; 
    Pathbest(iter,:) = path(antindex,:);
 
    % ������Ϣ��

    detatau = zeros(n);
    if flag == 6
        [~,Gshort] = min(Lbest);
        Curroute = Pathbest(Gshort,:);
        flag = 1;
    else
        Curroute = Pathbest(iter,:);
        flag = flag + 1;
    end
    for j = 1 : n
        detatau(Curroute(1,j),Curroute(1,j + 1)) = detatau(Curroute(1,j),Curroute(1,j + 1)) + rho*taumax;
        detatau(Curroute(1,j + 1),Curroute(1,j )) = detatau(Curroute(1,j),Curroute(1,j + 1));
    end

    tau = (1 - rho)*tau + detatau;
    for i = 1:n
        for j = 1:n
            if tau(i,j) > taumax
                tau(i,j) = taumax;
            end
            if tau(i,j) < taumin
                tau(i,j) = taumin;
            end
        end
    end

    path = zeros(m,n);
end

index = find(Lbest == min(Lbest));
shortestpath = Pathbest(index(1),:);
shortestdistance = Lbest(index(1))

subplot(1,2,1)

plot(x,y,'o')
hold on
for i = 1 : n - 1
    firstcity = shortestpath(i);
    nextcity = shortestpath(i + 1);
    plot([x(firstcity),x(nextcity)],[y(firstcity),y(nextcity)],'b');
end
firstcity = shortestpath(n);
nextcity = shortestpath(1);
plot([x(firstcity),x(nextcity)],[y(firstcity),y(nextcity)],'b');
axis equal
axis([0 18 0 18])

subplot(1,2,2)
plot(Lbest)
hold on 
title('��̾���')

