%特殊矩阵-全0矩阵 zeros()

% A=zeros(5,1);
% A=zeros(1,5);
% A=zeros(600,300);
% A=zeros(300,300);
% A=zeros(300);

% clear
% clc
% 
% tic%通常和toc共用，计算两者之间语句花费时间
% for m=1:1000
%     for n=1:1000
%         a(m,n)=m+n;
%     end
% end
% toc
% %花费时间0.747299

clear
clc
tic 
a=zeros(1000,1000);
for m=1:1000
    for n=1:1000
        a(m,n)=m+n;
    end
end
toc
% 花费时间 0.032275 秒
a=zeros(1000,1000,'single');

