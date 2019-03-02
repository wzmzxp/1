function minx=DCX(f,x0,h,gama,beta,eps,k)
% f  函数符号表达式
% x0 初始点
% h  初始单纯形构造因子
% gama 扩张因子
% beta 收缩因子
% eps
% k 

x0=x0';
X(:,1)=x0;
Num_var_f=length(symvar(f));
%% 构造初始单纯形
for i = 1:Num_var_f
    x = zeros(Num_var_f,1);
    x(i) = x0(i) + h;
    X(:,i+1)=x;% 将单纯形按列存储
end

n=1;
tol = 1 ;
while n < k && tol > eps
    %% 计算函数值
    for i = 1:Num_var_f+1
        F_val(i)=double(subs(f,symvar(f),X(:,i)'));
    end
    [F_sort,F_index]=sort(F_val);%从小到大
    %最好点
    f_best=F_sort(1);
    X_best=X(:,F_index(1));
    %最差点
    f_bad=F_sort(end);
    X_bad=X(:,F_index(end));
    %次差点
    f_nextbad=F_sort(end-1);
    X_nextbad=X(:,F_index(end-1));
    % 计算形心
    tol=abs((f_bad-f_best)/f_best);
    Xc=1/Num_var_f*sum(X(:,F_index(1:end-1)),2);
    
    %% 反射
    flag = 0;
    X_reflect=Xc+(Xc-X_bad);
    f_reflect=double(subs(f,symvar(f),X_reflect'));
    %比较反射之后 
    if f_best > f_reflect  % 可以往前一步
         X_reflect_expand=Xc+gama*(Xc-X_bad);
         f_reflect_expand=double(subs(f,symvar(f),X_reflect_expand'));
         if f_reflect_expand < f_reflect
             X(:,F_index(end)) = X_reflect_expand;
         else
             X(:,F_index(end)) = X_reflect;
         end
         flag = 1;
    end
    if flag == 0  %说明没有反射成功
        if f_reflect < f_nextbad
            X(:,F_index(end)) = X_reflect;
        else  % f_reflect >= f_nextbad
            if f_reflect < f_bad % 反射点要比最差点好一些
                X_reflect_shrink=Xc+beta*(X_reflect-Xc);% 收缩点
                f_reflect_shrink=double(subs(f,symvar(f),X_reflect_shrink'));
            else
                X_reflect_shrink=Xc+beta*(X_bad-Xc);% 收缩点
                f_reflect_shrink=double(subs(f,symvar(f),X_reflect_shrink'));
            end
            if f_reflect_shrink < f_bad
                X(:,F_index(end)) = X_reflect_shrink;
            else % 缩短边长
                X = X_best + 1/2 * (X-X_best);
            end
            
        end
    end
    n=n+1;
end
minx=X_best;

