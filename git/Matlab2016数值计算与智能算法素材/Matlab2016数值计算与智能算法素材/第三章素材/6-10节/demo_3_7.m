%while ���
% while(�ж�����)
%   ���
% end

a=input('����һ��������');
while (a>2)&&(a<7)
    a=a-1;
end


b=input('������ɼ���');
while 1
    flag=0;
    if b>90
        disp('�ɼ����㣡');
        flag=1;
    end
    if flag==1
        break;%��ֹѭ��
    end
    b=input('������ɼ���');
end

