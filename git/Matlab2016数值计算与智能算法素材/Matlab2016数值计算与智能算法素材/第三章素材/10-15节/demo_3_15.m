%�������-ȫ0���� zeros()

% A=zeros(5,1);
% A=zeros(1,5);
% A=zeros(600,300);
% A=zeros(300,300);
% A=zeros(300);

% clear
% clc
% 
% tic%ͨ����toc���ã���������֮����仨��ʱ��
% for m=1:1000
%     for n=1:1000
%         a(m,n)=m+n;
%     end
% end
% toc
% %����ʱ��0.747299

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
% ����ʱ�� 0.032275 ��
a=zeros(1000,1000,'single');

