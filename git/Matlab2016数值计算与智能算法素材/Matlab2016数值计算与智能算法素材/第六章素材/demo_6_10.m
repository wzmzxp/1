%% 数据分析
% 最大最小
A=[4 5 6 9 8]   %一个向量，列向量也可以
Amax=max(A)   %求出最大值
A=[4 5 6;8 5 2;4 2 1]  %A是一个矩阵，计算每一列的最大值
Amax=max(A)
[Amax1,I]=max(A,[],1) %求列最大,Amax是值，I是每一列的位置
Amax2=max(A,[],2) %求行最大
Amax3=max(max(A))  %求最大
%如果想找矩阵中最大值的坐标可以这样搞
[Amax,I]=max(A(:));
[r,c]=ind2sub([3,3],I)
%求最小用法是一样的，函数是 min

%排序 sort
A=[4 5 8 7 1]
b=sort(A) %升序排列
b1=sort(A,'descend')%降序排列
A=[4 5 6 2 1;7 8 2 5 1]
b=sort(A)%每一列进行升序排列
b1=sort(A,2)%每一行进行升序排列
%也可以对字符串排序
name={'Jone','Bale','Abel','Kate'};
name1=sort(name) %不支持dim和descend ascend

%求和sum
A=[7 8 4 5];
a=sum(A)%求和
A=[4 2 3;7 1 8;]
a=sum(A,1) %求每一列的和
b=sum(A,2) %求每一行的和
c=sum(sum(A)) %求和
%累积求和 cumsum  Cumulative sum 
A=[7 8 4 5];
a=cumsum(A)%结果是第一个数是A的第一个数，第二个数是A的前两个数和，第三个数是前三个数和
A=[4 2 3;7 1 8;]
a1=cumsum(A,1)%按列进行
a2=cumsum(A,2)%按行进行


%求积   前面讲行列式使用过
A=[4 5 6 2 1;7 8 2 5 1]
a=prod(A,1)%每一列求积
a1=prod(A)%每一列求积
a2=prod(A,2)%每一行求积
a3=prod(prod(A))
%累积求积 cumprod
A=[7 8 4 5];
a=cumprod(A)
A=[4 2 3;7 1 8;]
a1=cumprod(A,1)%按列进行
a2=cumprod(A,2)%按行进行

% 平均值
A=[1 2 3]
a=mean(A)
A=[1 2 3;4 5 6];
a=mean(A,1)%按列
a=mean(A,2)%按行
%3维数组
A(:,:,1)=[1 2 3;4 5 6];
A(:,:,2)=[3 1 9;4 4 2];
a=mean(A) %先计算第一页，按列，再计算第二页，按列
a=mean(A,2)%先计算第一页，按行，再计算第二页，按行
A = [1 0 0 1 NaN 1 NaN 0];
M = mean(A,'omitnan')%消除NaN   includenan

% 中位数 排在中间的数，偶数的时候是平均值，不受个别极端数据变化的影响，比较稳健
A=[1 2 3 4 5 6 2]
a=median(A)
A=[1 2 3 4 5 6 2 4]
a=median(A)
a=median(A,2)%每一列的中位数

%方差 var
A=[4 5 2 3 6];%矢量
a=var(A)
A=[4 -7 3; 1 4 -2; 10 7 9];% 矩阵,按列计算，1/(n-1)*[]
a=var(A)
a=var(A,1)%默认是0，1/(n)
a=var(A,0,1)%矩阵按列计算
a=var(A,0,2)%矩阵按行计算
%如果包含NaN元素，可以去掉
A=[4 5 6 1 NaN]
a=var(A,'omitnan')

%标准差 std  用法和var一样

A=[4 5 2 3 6];%矢量
a=sqrt(var(A))
a1=std(A)

A=[4 -7 3; 1 4 -2; 10 7 9];% 矩阵,按列计算，1/(n-1)*[]
a=sqrt(var(A))
a1=std(A)

a=sqrt(var(A,1))%默认是0，1/(n)
a1=std(A,1)
%另外的用法也一样
