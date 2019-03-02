function [result,k]=Sor(A,b,x0,w)
%���Է����������⣬��γ��ɳڣ�successive over relaxation method  M=1/w*(D-wL)
%w=1��Ϊgauss_sedidel������w>1Ϊ���ɳڵ�����w<1Ϊ���ɳڵ������ɳڵ�������ֻ����0-2��Χ�ڲſ������� 
%AΪϵ������
%bΪ��������
%x0Ϊ��ʼֵ
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=(D-w*L)^(-1)*((1-w)*D+w*U);
r=vrho(B);%�װ뾶������ֵ����ֵ�����Ǹ���С��1����
if r>=1
    disp('�޷�������');
    return;
end
f=w*(D-w*L)^(-1)*b;
i=1;
while 1
    x1=B*x0+f;
    if norm(x1-x0)<1e-8
        result=x1;
        k=i;
        return;
    end
    if i>1000
        return;
    end
    x0=x1;
    i=i+1;
end