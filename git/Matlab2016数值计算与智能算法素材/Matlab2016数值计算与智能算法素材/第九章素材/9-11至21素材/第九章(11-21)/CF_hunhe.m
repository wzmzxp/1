function [x,result]=CF_hunhe(f,g,h,x0,r,c,eps,k)
% f Ŀ�꺯��
% g ����ʽԼ����������
% h ��ʽԼ����������
% x0 ��ʼֵ
% r ��ʼ�ϰ�����
% c �ϰ�������С����
% eps �˳��ݲ�
% k ѭ������

Neq=sum(1./g);%����ʽԼ��
Eq=sum(h.^2);%��ʽԼ��

f_Neq=double(subs(g,symvar(Neq),x0));
if ~isempty(find(f_Neq < 0))
    x=[];
    result=[];
    return;
end

n=1;
while n < k
    F=f+r*Neq+1/sqrt(r)*Eq;
    F=matlabFunction(F);
    [x1,result]=Min_Newton(F,x0,eps,100);
    x1=reshape(x1,1,length(x0));
    if norm(x1-x0) < eps
        x=x1;
        result=double(subs(f,symvar(f),x));
        break;
    else
        x0=x1;
        r=r*c;
    end
    
    n=n+1;
end
