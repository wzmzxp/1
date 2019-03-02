function fitvalue = fitnessfun(x)
global M
fval = objfun(x);
transmit = {'���任','ֱ��ת��','���Ա任1','���Ա任2','��̬���Ա任','ָ���任'};

switch transmit{6}
    case '���任'
        fitvalue = fval;
    case 'ֱ��ת��'
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
    case '���Ա任1'
        kesai = 0.1;
        fmin = min(fval);
        fitvalue = fval - fmin + kesai;
    case '���Ա任2'
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
    case '��̬���Ա任'
        c = 0.95; % 0.9 - 0.999
        M = M*c;
        fmin = min(fval);
        fitvalue = fval - fmin + M;
    case 'ָ���任'
        alfa = -0.5;
        fitvalue = exp(-alfa*fval);
end





