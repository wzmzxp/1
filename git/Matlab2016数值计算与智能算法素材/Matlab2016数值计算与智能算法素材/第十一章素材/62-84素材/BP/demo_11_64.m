%% BP������ͼ��ѹ��
close
clear
clc

I = imread('1.jpg');
%��ȡ������ɫ
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
% 4 ������Ϊһ����
N = 4;

t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = R(rowrang,colrang);
        R1(:,t) = temp(:); %���е�˳���ų�һ��
        t = t + 1;
    end
    
end

t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = G(rowrang,colrang);
        G1(:,t) = temp(:); %���е�˳���ų�һ��
        t = t + 1;
    end
end

t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = B(rowrang,colrang);
        B1(:,t) = temp(:); %���е�˳���ų�һ��
        t = t + 1;
    end
end

%% һ����ɫ
num = 5;
% ��һ��
R1 = double(R1) /255;


net = feedforwardnet(num);
T = R1;
net.trainParam.epochs = 50;
tic
net = train(net,R1,T);
toc

% ��������������
iw = net.iw{1};
b1 = net.b{1};
len = size(R1,2);
for i = 1 : len
    D1(:,i) = tansig(iw*R1(:,i) + b1);
end
% �������������
lw = net.lw{2};
b2 = net.b{2};
len = size(D1,2);
for i = 1 : len
    R_out(:,i) = tansig(lw*D1(:,i) + b2);
end
R_out = uint8(R_out * 255);
 
% �ؽ�ͼ��
t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = R_out(:,t);
        R_result(rowrang,colrang) = reshape(temp,N,N); %���е�˳���ų�һ��
        t = t + 1;
    end 
end

subplot(4,2,1);
imshow(R)
title('Rԭͼ');

subplot(4,2,2);
imshow(R_result)
title('R����֮��');

%% ������ɫ
% ��һ��
G1 = double(G1) /255;

net2 = feedforwardnet(num);
T = G1;
net2.trainParam.epochs = 50;
tic
net2 = train(net2,G1,T);
toc

% ��������������
iw = net2.iw{1};
b1 = net2.b{1};
len = size(R1,2);
for i = 1 : len
    D2(:,i) = tansig(iw*G1(:,i) + b1);
end
% �������������
lw = net2.lw{2};
b2 = net2.b{2};
len = size(D2,2);
for i = 1 : len
    G_out(:,i) = tansig(lw*D2(:,i) + b2);
end
G_out = uint8(G_out * 255);
 
% �ؽ�ͼ��
t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = G_out(:,t);
        G_result(rowrang,colrang) = reshape(temp,N,N); %���е�˳���ų�һ��
        t = t + 1;
    end 
end
subplot(4,2,3);
imshow(G)
title('Gԭͼ');

subplot(4,2,4);
imshow(G_result)
title('G����֮��');
%% ������ɫ
% ��һ��
B1 = double(B1) /255;

net3 = feedforwardnet(num);
T = B1;
net3.trainParam.epochs = 50;
tic
net3 = train(net3,B1,T);
toc

% ��������������
iw = net3.iw{1};
b1 = net3.b{1};
len = size(B1,2);
for i = 1 : len
    D3(:,i) = tansig(iw*B1(:,i) + b1);
end
% �������������
lw = net3.lw{2};
b2 = net3.b{2};
len = size(D3,2);
for i = 1 : len
    B_out(:,i) = tansig(lw*D3(:,i) + b2);
end
B_out = uint8(B_out * 255);
 
% �ؽ�ͼ��
t = 1;
for i = 1 : 312/N
    for j = 1 : 208/N
        rowrang = 1 + (i-1)*N : i*N;
        colrang = 1 + (j-1)*N : j*N;
        temp = B_out(:,t);
        B_result(rowrang,colrang) = reshape(temp,N,N); %���е�˳���ų�һ��
        t = t + 1;
    end 
end
subplot(4,2,5);
imshow(R)
title('Bԭͼ');

subplot(4,2,6);
imshow(B_result)
title('B����֮��');

%% ��ɫͼ��
I_result(:,:,1) = R_result;
I_result(:,:,2) = G_result;
I_result(:,:,3) = B_result;


subplot(4,2,7);
imshow(I)
title('ԭͼ');

subplot(4,2,8);
imshow(I_result)
title('����֮��');



