%ifѡ�����
A=[2 3;4 5;];
B=[2 4 6; 9 7 6; 0 7 3;];

if size(A,1)>size(B,1)
    disp('A���д���B���У�');
elseif size(A,1)<size(B,1)
     disp('A����С��B���У�');
else
   disp('A���е���B���У�');
end

a=input('������һ������');

if (a>1)&&(a<10)
    disp('a����1С��10');
elseif (a>10)&&(a<100)
    disp('a����10С��100');
elseif (a>100)&&(a<1000)
    disp('a����100С��1000');
elseif (a>1000)&&(a<10000)
    disp('a����1000С��10000');
else
    disp('���������')
end
    
    
    
