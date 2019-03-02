%while 语句
% while(判断条件)
%   语句
% end

a=input('输入一个整数：');
while (a>2)&&(a<7)
    a=a-1;
end


b=input('请输入成绩：');
while 1
    flag=0;
    if b>90
        disp('成绩优秀！');
        flag=1;
    end
    if flag==1
        break;%终止循环
    end
    b=input('请输入成绩：');
end

