function fitvalue = fitnessfun(x)
global M
fval = objfun(x);
transmit = {'不变换','直接转换','线性变换1','线性变换2','动态线性变换','指数变换'};

switch transmit{2}
    case '不变换'
        fitvalue = fval;
    case '直接转换'
        Cmin = 0.1;
        [row,~] = size(x);
        for i = 1:row
            fval = objfun(x(i,:));
            if fval + Cmin > 0
                fitvalue(i) = fval + Cmin;
            else
                fitvalue(i) = 0;
            end
        end
    case '线性变换1'
        kesai = 0.1;
        fmin = min(fval);
        fitvalue = fval - fmin + kesai;
    case '线性变换2'
        C = 1.5; %  1.2-2
        fmin = min(fval);
        fmax = max(fval);
        favg = sum(fval) / size(x,1);
        if fmin < (C*favg - fmax)/(C - 1)
            a = (C - 1)*favg / (fmax - favg);
            b = (fmax - C*favg)*favg / (fmax - favg);
        else
            a = favg / (favg - fmin);
            b = favg*fmin / (favg - fmin);
        end
        fitvalue = a*fval + b;
    case '动态线性变换'
        c = 0.9 + (0.099)*rand; % 0.9 - 0.999
        M = M*c;
        fmin = min(fval);
        fitvalue = fval - fmin + M;
    case '指数变换'
        alfa = -0.5;
        fitvalue = exp(-alfa*fval);
end





