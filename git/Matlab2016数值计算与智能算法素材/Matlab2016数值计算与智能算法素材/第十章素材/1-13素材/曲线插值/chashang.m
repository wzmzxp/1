function CHA=chashang(X,Y)
m=length(X);

for i=1:m-1  %����m-1�ײ���
    CHA=diff(Y)./diff(X);
end
