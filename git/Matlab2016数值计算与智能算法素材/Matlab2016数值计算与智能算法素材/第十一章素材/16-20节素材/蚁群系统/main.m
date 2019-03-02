for i = 1 : 100
    L(i) = ACS;
end

success = length(find(L == min(L)))/i*100