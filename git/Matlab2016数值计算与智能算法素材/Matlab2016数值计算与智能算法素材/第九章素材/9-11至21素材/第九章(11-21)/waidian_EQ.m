function [x,result]=waidian_EQ(f,x0,hx,M,C,eps)
% f Ŀ�꺯��
% x0 ��ʼֵ
% hx Լ������
% M ��ʼ������
% C �����ӷŴ�ϵ��
% eps �ݲ�

%����ͷ���
CF=sum(hx.^2);  %chengfa

while 1
    F=matlabFunction(f+M*CF);%Ŀ�꺯����ʹ��֮ǰ��ţ�ٷ�����Ҫת���ɾ��
    x1=Min_Newton(F,x0,eps,100);
    if norm(x1-x0)<eps
        x=x1;
        result=double(subs(f,symvar(f),x'));
        break;
    else
        M=M*C;
        x0=x1;
    end
end