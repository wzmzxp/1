function [result,k]=jacobi(A,b,x0,n)
%���Է����������⣬�ſ˱ȵ���
%AΪϵ������
%bΪ��������
%x0Ϊ��ʼֵ
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D^(-1)*(L+U);
r=vrho(B);%�װ뾶������ֵ����ֵ�����Ǹ���С��1����
if r>=1
    disp('�޷�������');
    return;
end
f=D^(-1)*b;
i=1;
while i<n
    x1=B*x0+f;
    if norm(x1-x0)<1e-9
        result=x1;
        k=i;
        return;
    end
    x0=x1;
    i=i+1;
end
