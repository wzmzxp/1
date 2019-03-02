%if选择语句
A=[2 3;4 5;];
B=[2 4 6; 9 7 6; 0 7 3;];

if size(A,1)>size(B,1)
    disp('A的行大于B的行！');
elseif size(A,1)<size(B,1)
     disp('A的行小于B的行！');
else
   disp('A的行等于B的行！');
end

a=input('请输入一个数：');

if (a>1)&&(a<10)
    disp('a大于1小于10');
elseif (a>10)&&(a<100)
    disp('a大于10小于100');
elseif (a>100)&&(a<1000)
    disp('a大于100小于1000');
elseif (a>1000)&&(a<10000)
    disp('a大于1000小于10000');
else
    disp('数输入错误！')
end
    
    
    
