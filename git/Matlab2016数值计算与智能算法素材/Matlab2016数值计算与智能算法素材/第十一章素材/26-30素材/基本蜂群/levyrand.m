function levy = levyrand(beta)

u = randn;
v =randn;
fai1 = gamma(1 + beta)*sin(pi*beta/2);
fai2 = gamma((1 + beta)/2*beta*2^((beta - 1)/2));

fai = (fai1/fai2)^(1/beta);

levy = fai*u/(abs(v)^(1/beta));
