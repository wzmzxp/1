%д�ļ����� fopen fprintf fclose

%fopen
% fid=fopen('a.txt','r');%����ļ������ڣ�����ֵΪ-1
fid=fopen('b.txt','w');%w,���ƴ������ݣ���������ʱ�������b.txt�е����ݣ�Ȼ���ٴ�������
fid1=fopen('b.txt','a');%ͬ��Ҳ�Ǵ������ݣ�����b.txt����׷������
fid2=fopen('b.txt','at');%ͬ��Ҳ�Ǵ������ݣ�����b.txt����׷������

%fprintf
a=2;
% fprintf('����a��ֵΪ��%d\n',a)%  %d���Կ��ƴ�ӡ������%f��С����%s���ַ���
% fprintf('����a��ֵΪ��%f\n',a)

fprintf('����a��ֵΪ��%f\r\n',a)

