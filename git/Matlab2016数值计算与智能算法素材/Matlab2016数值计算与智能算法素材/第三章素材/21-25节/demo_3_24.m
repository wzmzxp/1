%结构体数组的键盘写入与存储文件
clear
clc
i=1;
fid=fopen('student.txt','w');
while 1
    fprintf('请您输入第%d个学生的信息！\n',i);
    name=input('姓名：','s');
    fprintf(fid,'姓名：%s  ',name);
    stu(i).name=name;
    
    age=input('年龄：');
    fprintf(fid,'年龄：%d  ',age);
    stu(i).age=age;
    
    sex=input('性别：','s');
    fprintf(fid,'性别：%s  ',sex);
    stu(i).sex=sex;
    
    score=input('请输入语数英成绩（[语 数 英]）：');
    fprintf(fid,'语文：%.2f\t数学：%.2f\t英语：%.2f\r\n',score(1),score(2),score(3));
    stu(i).score=score;
    
    S=input('是否继续(Y,N)：','s');
    if S == 'N'
        break;
    end
    i=i+1;
end
fclose(fid);
