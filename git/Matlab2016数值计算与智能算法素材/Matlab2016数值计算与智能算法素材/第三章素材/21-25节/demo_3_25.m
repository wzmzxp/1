%Ԫ��cell
A=cell(2,2);
%Ԫ����ֵ,һ��һ������
B{1,1}=3;
B{1,2}='51zxw';
B{2,1}=[3 4;2 3];
a.name='xiaoming';
a.age=12;
B{2,2}=a;

C={5,'51zxw';[6 7;9 8],a};
%��ȡ����ʹ��{}
D=C{1,2};
fprintf('���ַ���Ϊ��%s\n',D)
%��ȡԪ�����о���ľ���Ԫ��
E=C{2,1}(1,2);
F=C{2,1}(1,:);
%��ȡԪ�����нṹ�������ֵ
G=C{2,2}.name
H=C{2,2}.age

%����Ԫ���ĺ���iscell
A1={'xiaoming',12;[12 2 3;6 7 5],struct('name','С��','age',13)};
a=iscell(A1);
b=iscell(8);

%��ʾԪ�����鵱�е�����celldisp  cellplot
celldisp(A1);
cellplot(A1);



