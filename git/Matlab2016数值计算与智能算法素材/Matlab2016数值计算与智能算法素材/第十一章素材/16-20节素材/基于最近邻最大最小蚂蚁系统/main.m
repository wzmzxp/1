for i = 1 : 100
    L(i) = MMAS;
end

success = length(find(L == min(L)))/i*100