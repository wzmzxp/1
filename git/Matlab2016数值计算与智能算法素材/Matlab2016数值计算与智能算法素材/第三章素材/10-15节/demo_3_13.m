%解线性方程组-克莱姆法则
%det函数求一个方阵的行列式的值

D=[1 2 1;2 -1 2;1 3 -2;]
D1=[6 2 1;2 -1 2;5 3 -2]
D2=[1 6 1;2 2 2;1 5 -2;]
D3=[1 2 6;2 -1 2;1 3 5]
x1=det(D1)/det(D)
x2=det(D2)/det(D)
x3=det(D3)/det(D)

x11=my_det(D1)/my_det(D)
x21=my_det(D2)/my_det(D)
x31=my_det(D3)/my_det(D)