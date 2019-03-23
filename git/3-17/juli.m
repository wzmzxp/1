%计算邻接矩阵
%输入参数a是中国31个城市的坐标
%输出参数D是无向图的赋权邻接矩阵

function D=juli(a)
[c,d]=size(a);%此例中c=31,d=2
D=zeros(c,c);%申请一个0阵
for i=1:c
    for j=i:c
        bb=(a(i,1)-a(j,1)).^2+(a(i,2)-a(j,2)).^2;
        D(i,j)=bb^(0.5);%计算第i个城市到j城市的距离
        D(j,i)=D(i,j);
    end
end
