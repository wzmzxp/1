%矩阵的幂
A=[0.7 0.15 0.1;0.15 0.8 0.3;0.15 0.05 0.6]
x0=[300;350;200]

%求一年后的种群分布
x1=A*x0
x10=A^10*x0
x20=A^20*x0
x30=A^30*x0
%矩阵的点乘幂
B=A.^2