function minx=DCX(f,x0,h,gama,beta,eps,k)
% f  �������ű��ʽ
% x0 ��ʼ��
% h  ��ʼ�����ι�������
% gama ��������
% beta ��������
% eps
% k 

x0=x0';
X(:,1)=x0;
Num_var_f=length(symvar(f));
%% �����ʼ������
for i = 1:Num_var_f
    x = zeros(Num_var_f,1);
    x(i) = x0(i) + h;
    X(:,i+1)=x;% �������ΰ��д洢
end

n=1;
tol = 1 ;
while n < k && tol > eps
    %% ���㺯��ֵ
    for i = 1:Num_var_f+1
        F_val(i)=double(subs(f,symvar(f),X(:,i)'));
    end
    [F_sort,F_index]=sort(F_val);%��С����
    %��õ�
    f_best=F_sort(1);
    X_best=X(:,F_index(1));
    %����
    f_bad=F_sort(end);
    X_bad=X(:,F_index(end));
    %�β��
    f_nextbad=F_sort(end-1);
    X_nextbad=X(:,F_index(end-1));
    % ��������
    tol=abs((f_bad-f_best)/f_best);
    Xc=1/Num_var_f*sum(X(:,F_index(1:end-1)),2);
    
    %% ����
    flag = 0;
    X_reflect=Xc+(Xc-X_bad);
    f_reflect=double(subs(f,symvar(f),X_reflect'));
    %�ȽϷ���֮�� 
    if f_best > f_reflect  % ������ǰһ��
         X_reflect_expand=Xc+gama*(Xc-X_bad);
         f_reflect_expand=double(subs(f,symvar(f),X_reflect_expand'));
         if f_reflect_expand < f_reflect
             X(:,F_index(end)) = X_reflect_expand;
         else
             X(:,F_index(end)) = X_reflect;
         end
         flag = 1;
    end
    if flag == 0  %˵��û�з���ɹ�
        if f_reflect < f_nextbad
            X(:,F_index(end)) = X_reflect;
        else  % f_reflect >= f_nextbad
            if f_reflect < f_bad % �����Ҫ�������һЩ
                X_reflect_shrink=Xc+beta*(X_reflect-Xc);% ������
                f_reflect_shrink=double(subs(f,symvar(f),X_reflect_shrink'));
            else
                X_reflect_shrink=Xc+beta*(X_bad-Xc);% ������
                f_reflect_shrink=double(subs(f,symvar(f),X_reflect_shrink'));
            end
            if f_reflect_shrink < f_bad
                X(:,F_index(end)) = X_reflect_shrink;
            else % ���̱߳�
                X = X_best + 1/2 * (X-X_best);
            end
            
        end
    end
    n=n+1;
end
minx=X_best;

