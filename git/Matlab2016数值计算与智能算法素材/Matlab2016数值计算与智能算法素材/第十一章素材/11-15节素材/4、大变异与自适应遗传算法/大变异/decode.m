function real = decode(pop,lb,ub)
%% pop 种群
%% varnum 变量个数
[~,col] = size(pop);

for j = col:-1:1
    temp(j) = 2^(j-1)*pop(j);
end
temp = sum(temp);
real = lb + temp * (ub - lb)/(2^col-1);
end