%�����������
%����A��1-������
A=[2 3 4;5 6 1;2 3 8];
a1=cond(A,1);
L_max=max(sum(abs(A),1));
L1_max=max(sum(abs(inv(A)),1));
a1-L_max*L1_max

%�����2-������
a2=cond(A,2)
a21=cond(A)

%����������
a3=cond(A,inf)

%ϣ�����ؾ��󣬵��͵Ĳ�̬����
H3=hilb(3)
h_3=cond(H3,inf)

H4=hilb(4)
h_4=cond(H4,inf)

H5=hilb(5)
h_5=cond(H5,inf)
