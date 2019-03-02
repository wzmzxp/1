%元胞cell
A=cell(2,2);
%元胞赋值,一个一个输入
B{1,1}=3;
B{1,2}='51zxw';
B{2,1}=[3 4;2 3];
a.name='xiaoming';
a.age=12;
B{2,2}=a;

C={5,'51zxw';[6 7;9 8],a};
%读取数据使用{}
D=C{1,2};
fprintf('该字符串为：%s\n',D)
%读取元胞当中矩阵的具体元素
E=C{2,1}(1,2);
F=C{2,1}(1,:);
%读取元胞当中结构体的属性值
G=C{2,2}.name
H=C{2,2}.age

%关于元胞的函数iscell
A1={'xiaoming',12;[12 2 3;6 7 5],struct('name','小王','age',13)};
a=iscell(A1);
b=iscell(8);

%显示元胞数组当中的内容celldisp  cellplot
celldisp(A1);
cellplot(A1);



