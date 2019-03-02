%写文件操作 fopen fprintf fclose

%fopen
% fid=fopen('a.txt','r');%如果文件不存在，返回值为-1
fid=fopen('b.txt','w');%w,控制存入数据，存入数据时，会清空b.txt中的内容，然后再存入数据
fid1=fopen('b.txt','a');%同样也是存入数据，会在b.txt后面追加数据
fid2=fopen('b.txt','at');%同样也是存入数据，会在b.txt后面追加数据

%fprintf
a=2;
% fprintf('变量a的值为：%d\n',a)%  %d可以控制打印整数，%f是小数，%s是字符串
% fprintf('变量a的值为：%f\n',a)

fprintf('变量a的值为：%f\r\n',a)

