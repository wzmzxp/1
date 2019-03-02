%在同一程序中随机数种子的设置
clear
clc
% rand可以指定数据类型
% a=rand(3,4,'single');
% b=rand(3,4);
% c=rand(size(a),'like',a);
%在程序中，调用rand，默认方式是生成不同的随机数，不需要额外的进行设置
% a=rand(2)
% a1=rand(2)
% a2=rand(2)

%怎么生成重复的随机数，用到一个函数rng
% rng(1)
% a=rand(2)
% a1=rand(2)
% rng(1)
% a2=rand(2)

% s=rng;
% a=rand(2)
% a1=rand(2)
% 
% rng(s)
% a2=rand(2)

%随机数种子和伪随机数生成器联合使用
rng(1,'twister')
a=rand(2)
a1=rand(2)
rng(1,'twister')
a2=rand(2)








