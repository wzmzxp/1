%浮点数的增广矩阵的书写
A=[1 2 1 6;2 -1.5 2 2;1 3.2 -2 5.5];
b=2;
c=1.2;
%默认存储使用double型浮点
%浮点数：单精度的浮点数 single
d=single(b);

%整型：无符号整型和有符号整型
% 有符号整型 int8 int16 int32 int64
%int8 表示范围：intmin('int8')，intmax(),[-128,127],-2^7 ~ 2^7-1
% 无符号整型：uint8 unit16 uint32 uint64
%uint8的表示范围：[0 255]  0 ~ 2^8-1
%uint64的表示范围：[0 18446744073709551615]  0 ~ 2^64-1






