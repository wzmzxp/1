%�ṹ������ļ���д����洢�ļ�
clear
clc
i=1;
fid=fopen('student.txt','w');
while 1
    fprintf('���������%d��ѧ������Ϣ��\n',i);
    name=input('������','s');
    fprintf(fid,'������%s  ',name);
    stu(i).name=name;
    
    age=input('���䣺');
    fprintf(fid,'���䣺%d  ',age);
    stu(i).age=age;
    
    sex=input('�Ա�','s');
    fprintf(fid,'�Ա�%s  ',sex);
    stu(i).sex=sex;
    
    score=input('����������Ӣ�ɼ���[�� �� Ӣ]����');
    fprintf(fid,'���ģ�%.2f\t��ѧ��%.2f\tӢ�%.2f\r\n',score(1),score(2),score(3));
    stu(i).score=score;
    
    S=input('�Ƿ����(Y,N)��','s');
    if S == 'N'
        break;
    end
    i=i+1;
end
fclose(fid);
