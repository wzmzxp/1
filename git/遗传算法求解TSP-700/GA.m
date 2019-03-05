%遗传算法
%D是距离矩阵，n为种群个数
%参数a是中国31个城市的坐标
%C为停止代数，遗传到第 C代时程序停止,C的具体取值视问题的规模和耗费的时间而定
%m为适配值淘汰加速指数,最好取为1,2,3,4,不宜太大
%交叉概率Pc，变异概率Pm 
%R为最短路径,Rlength为路径长度

%目前zzyang得到的最优解为：1.6179e+004

function GA

%初始化
a=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;...
               3238 1229;4196 1044;4312  790;4386  570;3007 1970;2562 1756;...
                2788 1491;2381 1676;1332  695;3715 1678;3918 2179;4061 2370;...
                3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2376;...
                3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;2370 2975];
            
n=100;
C=2000;
m=2;
Pc=0.8;
Pm=0.1;
D=juli(a);%生成距离矩阵
[R,Rlength]=geneticTSP(D,a,n,C,m,Pc,Pm);%运算返回最优路径R和其总距离Rlength