function [x,result]=Min_ND_1(f,x0,k)
if nargin == 2
    k=500;
end
%% �жϺ��������Լ�һ�ס����׵���
f_1=sym(f);

if ~isempty(symvar(f_1))
    df=diff(f_1);%һ����
    if ~isempty(symvar(df))
        df=matlabFunction(df);
    end
else
    fprintf('������������');
    return;
end

if isa(df,'function_handle')
    dff=diff(sym(df));
    flag=1;
    if ~isempty(symvar(dff))
        dff=matlabFunction(dff);
        flag=0;
    end
end

tol=1;
eps=1e-6;
n=1;
while tol > eps && n < k
    if flag == 1
        x1=x0-df(x0)/double(dff);
    end
    if flag == 0
        x1=x0-df(x0)/dff(x0);
    end
    tol=abs(x0-x1);
    x0=x1;
end

x=x1;
result=f(x);
    
    
    
