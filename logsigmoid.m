function [a,da]=logsigmoid(n)
    a = 1./(1+exp(-n));
    da = a.*(1-a);
end