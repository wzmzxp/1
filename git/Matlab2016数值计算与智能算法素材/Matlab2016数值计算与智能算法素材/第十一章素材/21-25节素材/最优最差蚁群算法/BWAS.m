function shortestdistance = BWAS()
%% ��Ⱥϵͳ
clear
close
clc
n = 10;  % ��������
m = 30;  % ��������
alfa = 1.5;
beta = 2.5;
rho = 0.05;
P0 = 0.9; % ����ѡ����ֵ
epsilon = 0.0001;
maxgen = 50;
x = [2 14 9 6 3 2 4 8 12 5]';
y = [8 9 12 4 1 2 5 8 1 15]';
City = [x,y]; % ��������

%% ����֮����໥����
for i = 1:n
    D(i,:) = ((City(i,1) - City(:,1)).^2 + (City(i,2) - City(:,2)).^2).^0.5 + eps;
end

%% ��ĳһ���г���������ڹ������
Lnn = 0;
visitedcity = 5;
for i = 1 : n - 1
    leftnode = setdiff(1:10,visitedcity);
    [d,location] = min(D(visitedcity(end),leftnode));
    visitedcity = [visitedcity ,leftnode(location)];
    Lnn = Lnn + d;
end

eta = 1./D;    % ��������
tau = 1./(ones(n)*(n*Lnn)); % ��Ϣ�ؾ���
path = zeros(m,n); % ��¼·��

for iter = 1: maxgen
    %% ��������
    path(:,1) = randi([1 n],m,1); % �ӵ�һ�����е���10(n)�������������һ����һ������m����m����������
                                  % �����Ͱ�mֻ���Ϸ�����n��������
    %% ���Ͽ�ʼ����ʣ�µĳ���
    for i = 2 : n
        for j = 1 : m
            visited = path(j,1:i-1);% ��jֻ�����Ѿ�����ǰ i-1��������
            leftcity = setdiff(1:n,visited);%����1��n��ÿ�����У�visited�ǵ����ĳ��У���ȥ�����ĳ��о���ʣ�µĳ���
            r = rand;
            if r < P0  % ����֪ʶ
                temp = tau(visited(end),leftcity).^alfa .* eta(visited(end),leftcity).^beta;
                [~,nextcityindex] = max(temp);
                 nextcity = leftcity(nextcityindex(1));
            else   
              %% ����ȥʣ�µĳ��еĸ���
                P = zeros(1,length(leftcity));
                for k = 1:length(leftcity)
                    P(k) = tau(visited(end),leftcity(k))^alfa*eta(visited(end),leftcity(k))^beta;%��ʽ�ķ���
                end
                P1 = sum(P); %��ʽ�ķ�ĸ
                Pk = P / P1; %��ʽ
                % �����̶ĵķ�ʽ���ѡ��
                P = cumsum(Pk);
                index = find(P >= r);
                nextcity = leftcity(index(1));
            end
            path(j,i) = nextcity;%��jֻ���ϵ���һ������
            % �ֲ��������
            tau(visited(end),nextcity) = (1-rho)*tau(visited(end),nextcity) + rho*(n*Lnn)^(-1);
            tau(nextcity,visited(end)) = tau(visited(end),nextcity);
        end
    end
    path = horzcat(path,path(:,1));
    % ���ˣ��������Ϸ��������г���
    % ������Ҫ������룬������Ϣ�أ�·��������
%     if iter >= 2
%         path(1,:) = Pathbest(iter-1,:); % ��֤��һ�������·�߲���
%     end
    
    for i = 1 : m
        node = path(i,:); % ��iֻ�����߹��ĳ��нڵ�
        d = 0;
        for j = 1 : n  % �����iֻ�����߹�·���ܳ���
            d = d + D(node(j),node(j + 1));
        end
        L(i) = d; % ���������߹�·�ĳ���
    end
    [longroute,badindex] = max(L);
    longpath = path(badindex,:);
    [shortroute,antindex] = min(L); % ��һֻ�������
    Lbest(iter) = shortroute; %��һ�����������ߵ���õ�·
    Pathbest(iter,:) = path(antindex,:);%��õ�·����һ��
    eroute=Pathbest(iter,:); % ��ǰ����·����Ҳ����ʹ��ȫ������·��
    % ������Ϣ��
    % ���ȼ���ÿһ�Գ���֮�����Ϣ������
    detatau = zeros(n);

    for j = 1 : n
        detatau(eroute(1,j),eroute(1,j + 1)) = detatau(eroute(1,j),eroute(1,j + 1)) + 1/L(i);
        detatau(eroute(1,j + 1),eroute(1,j))=detatau(eroute(1,j),eroute(1,j + 1));
    end
    tau = (1 - rho)*tau + detatau;
    
    % ���������·��������Ϣ�ظ���
    % �ж���һ��·������������·�����е�·��
    temp = {};
    for i = 1 : 10
        temp = [temp,{strcat(num2str(eroute(i)),num2str(eroute(i+1)))}];
    end
    
    for i = 1 : 10
        temp1 = {strcat(num2str(longpath(i)),num2str(longpath(i+1)))};
        temp2 = {strcat(num2str(longpath(i + 1)),num2str(longpath(i)))};
        [~,location1] = find(ismember(temp,temp1));%���location1�ǿյģ�˵��temp1����temp�ĳ�Ա����ζ�ŵ�ǰ·����������·��һ����
        [~,location2] = find(ismember(temp,temp2));
        if isempty(location1)&&isempty(location2)
            tau(longpath(1,i),longpath(1,i+1)) = (1-rho)* tau(longpath(1,i),longpath(1,i+1)) - epsilon*longroute/shortroute;
            tau(longpath(1,i + 1),longpath(1,i)) = tau(longpath(1,i),longpath(1,i+1));
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

