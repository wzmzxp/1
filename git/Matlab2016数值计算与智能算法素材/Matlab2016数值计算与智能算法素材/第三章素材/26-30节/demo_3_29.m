%矩阵的旋转操作rot90

A=[1 2 3;4 5 6;7 8 9]
% B=rot90(A,1)%n代表逆时针旋转n*90度
% B1=rot90(A,2)%n代表逆时针旋转n*90度
A1=[1 2 3 5;4 5 6 9;7 8 9 0;2 3 4 5]
%左右翻转函数 fliplr()
% B2=fliplr(A1)

%上下反转操作 flipud()
B3=flipud(A1)
B4=shangxia(A1)


