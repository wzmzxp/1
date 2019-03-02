function CHA=chashang(X,Y)
m=length(X);

for i=1:m-1  %╧╧тЛm-1╫в╡Нил
    CHA=diff(Y)./diff(X);
end
