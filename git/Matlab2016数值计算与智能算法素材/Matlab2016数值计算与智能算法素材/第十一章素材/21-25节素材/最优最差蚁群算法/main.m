for i = 1 : 50
    L(i) = BWAS;
end

success = length(find(L == min(L)))/i*100