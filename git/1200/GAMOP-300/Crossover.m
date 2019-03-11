

function [y1, y2]=Crossover(x1,x2)
global VarMin VarMax VarMin1 VarMax1
    alpha=rand(size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    if y1<0
        y1= unifrnd(VarMin,VarMax,1);
    end
    if y2<0
        y2= unifrnd(VarMin1,VarMax1,1);
    end
end