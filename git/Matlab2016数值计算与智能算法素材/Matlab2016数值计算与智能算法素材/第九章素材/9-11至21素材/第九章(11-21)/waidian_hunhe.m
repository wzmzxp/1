function [x,result]=waidian_hunhe(f,g,h,x0,M,C,eps,k)
% f Ŀ�꺯��
% g ����ʽԼ����������
% h ��ʽԼ����������
% x0 ��ʼֵ
% M ��ʼ�ͷ�����
% C �����ӷŴ���
% eps �˳��ݲ�
% ѭ������

CF=sum(h.^2);  %chengfa
n=1;
while n<k
    %�����ж��ǲ����ڿ�������
    gx=double(subs(g,symvar(g),x0));%���㵱ǰ���Լ������ֵ
    index=find(gx<0);%Ѱ��С��0��Լ������
    F_NEQ=sum(g(index).^2);
    F=matlabFunction(f+M*F_NEQ+M*CF);
    x1=Min_Newton(F,x0,eps,100);
    x1=x1'
    if norm(x1-x0)<eps
        x=x1;
        result=double(subs(f,symvar(f),x));
        break;
    else
        M=M*C;
        x0=x1;
    end
    n=n+1;
end
