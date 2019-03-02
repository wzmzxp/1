function [x,result]=neidian(f,g,x0,M,C,eps,k)
% f Ŀ�꺯��
% g ����ʽԼ����������
% h ��ʽԼ����������
% x0 ��ʼֵ
% M ��ʼ�ϰ�����
% C �ϰ�������С����
% eps �˳��ݲ�
% k ѭ������

%�ͷ���
Neq=sum((1./g));

n=1;
while n<k
    F=matlabFunction(f+M*Neq);
    [x1,result]=Min_Newton(F,x0,eps,100);
    x1=reshape(x1,1,length(x0));
    tol=double(subs(Neq,symvar(Neq),x1)*M);
    if tol < eps
        if norm(x1-x0) < eps
            x=x1;
            result=double(subs(f,symvar(f),x));
            break;
        else
            x0=x1;
            M=M*C;
        end
    else
        if norm(x1-x0) < eps
            x=x1;
            result=double(subs(f,symvar(f),x));
            break;
        else
            x0=x1;
            M=M*C;
        end
    end
    n=n+1;
end

