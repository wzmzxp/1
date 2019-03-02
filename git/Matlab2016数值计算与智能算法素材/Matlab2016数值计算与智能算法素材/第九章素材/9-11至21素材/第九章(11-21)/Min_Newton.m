function [X,result]=Min_Newton(f,x0,eps,n)

TiDu=gradient(sym(f),symvar(sym(f)));% ������ݶȱ��ʽ
Haisai=jacobian(TiDu,symvar(sym(f)));
Var_Tidu=symvar(TiDu);
Var_Haisai=symvar(Haisai);
Var_Num_Tidu=length(Var_Tidu);
Var_Num_Haisai=length(Var_Haisai);

TiDu=matlabFunction(TiDu);
flag = 0;
if Var_Num_Haisai == 0  %Ҳ����˵���������ǳ���
    Haisai=double((Haisai));
    flag=1;
end
    

%��ǰ���ݶ��뺣���������
f_cal='f(';
TiDu_cal='TiDu(';
Haisai_cal='Haisai(';
for k=1:length(x0)
    f_cal=[f_cal,'x0(',num2str(k),'),'];
    
    for j=1: Var_Num_Tidu
        if char(Var_Tidu(j)) == ['x',num2str(k)]
            TiDu_cal=[TiDu_cal,'x0(',num2str(k),'),'];
        end
    end
    
    for j=1:Var_Num_Haisai
        if char(Var_Haisai(j)) == ['x',num2str(k)]
            Haisai_cal=[Haisai_cal,'x0(',num2str(k),'),'];
        end
    end
end
Haisai_cal(end)=')';
TiDu_cal(end)=')';
f_cal(end)=')';

switch flag
    case 0
        Haisai=matlabFunction(Haisai);
        dk='-eval(Haisai_cal)^(-1)*eval(TiDu_cal)';
    case 1
        dk='-Haisai^(-1)*eval(TiDu_cal)';
        Haisai_cal='Haisai';
end

i=1;
while i < n 
    if abs(det(eval(Haisai_cal))) < 1e-6
        disp('����󲻴��ڣ�');
        break;
    end
    x0=x0(:)+eval(dk);
    if norm(eval(TiDu_cal)) < eps
        X=x0;
        result=eval(f_cal);
        return;
    end
    i=i+1;
end
disp('�޷�������');
X=[];
result=[];




