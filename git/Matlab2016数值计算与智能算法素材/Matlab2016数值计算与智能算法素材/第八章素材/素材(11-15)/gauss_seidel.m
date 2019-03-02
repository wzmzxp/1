function result=gauss_seidel(A,b,x0)
%���Է����������⣬��˹-���¶����������õ�ǰ���ǰ��ķ���������ķ���
%AΪϵ������
%bΪ��������
%x0Ϊ��ʼֵ
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=(D-L)^(-1)*U;
r=vrho(B);%�װ뾶������ֵ����ֵ�����Ǹ���С��1����
if r>=1
    disp('�޷�������');
    return;
end
f=(D-L)^(-1)*b;
i=1;
while 1
    x1=B*x0+f;
    if norm(x1-x0)<1e-8
        result=x1;
        return;
    end
    if i>1000
        return;
    end
    i=i+1;
    x0=x1;
end
% a=[2 2 -1;1 2 -3;1 -2 11]
% b=[2;6;10]
% -16.0000
%    20.0000
%     6.0000