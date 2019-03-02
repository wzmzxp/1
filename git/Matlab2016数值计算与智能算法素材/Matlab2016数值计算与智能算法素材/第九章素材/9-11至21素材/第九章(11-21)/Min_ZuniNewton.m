function [X,result]=Min_ZuniNewton(f,x0,eps,n)

TiDu=gradient(sym(f),symvar(sym(f)));% 计算出梯度表达式
Haisai=jacobian(TiDu);
Var_Tidu=symvar(TiDu);
Var_Haisai=symvar(Haisai);
Var_Num_Tidu=length(Var_Tidu);
Var_Num_Haisai=length(Var_Haisai);

TiDu=matlabFunction(TiDu);
flag = 0;
if Var_Num_Haisai == 0  %也就是说海塞矩阵是常数
    Haisai=double((Haisai));
    flag=1;
end
    

%求当前点梯度与海赛矩阵的逆
alfa_cal='f(';
f_cal='f(';
TiDu_cal='TiDu(';
Haisai_cal='Haisai(';
for k=1:length(x0)
    f_cal=[f_cal,'x0(',num2str(k),'),'];
    alfa_cal=[alfa_cal,'x1(',num2str(k),'),'];
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
alfa_cal(end)=')';

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
    if rcond(eval(Haisai_cal))<1e-6 % 判断海赛矩阵是否病态，实际上计算的是rcond(A),越小越病态
        disp('海赛矩阵奇异！');
        break;
    end
    syms alfa
    x1=x0(:)+alfa*eval(dk);
    f_alfa=matlabFunction(eval(alfa_cal)); %计算得到包含alfa的表达式
    [~,alfa]=huangjin(f_alfa,0,0.1,100);
    x0=x0(:)+alfa*eval(dk);
    if norm(eval(TiDu_cal)) < eps
        X=x0;
        result=eval(f_cal);
        return;
    end
    i=i+1;
end
disp('无法收敛！');
X=[];
result=[];