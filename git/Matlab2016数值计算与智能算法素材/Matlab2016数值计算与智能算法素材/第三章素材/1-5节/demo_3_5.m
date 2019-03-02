%圆整函数

%ceil 天花板 向上圆整，向正无穷方向进行元整
a=ceil(-1.2);
b=ceil(-1.5);
c=ceil(-1.7);
a1=ceil(1.2);
b1=ceil(1.5);
c1=ceil(1.7);

%floor 地板 向下圆整，向负无穷方向进行元整
a=floor(-1.2);
b=floor(-1.5);
c=floor(-1.7);
a1=floor(1.2);
b1=floor(1.5);
c1=floor(1.7);

%round 如果是.5的话，就向着绝对值大的数进行圆整，如果不是，就圆整到最近的数
a=round(-1.2);
b=round(-1.5);
c=round(-1.7);
a1=round(1.2);
b1=round(1.5);
c1=round(1.7);
%fix 
a=fix(-1.2);
b=fix(-1.5);
c=fix(-1.7);
a1=fix(1.2);
b1=fix(1.5);
c1=fix(1.7);

%int8 类似于round函数
%uint8 如果是小于0的数，圆整到0，如果大于0，小数部分大于等于.5的话，向上圆整，小于.5的话，向下圆整


