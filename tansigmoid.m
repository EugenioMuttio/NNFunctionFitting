function [a,da]=tansigmoid(n)
    a = 2./(1+exp(-2*n))-1;
    da = (a+1).^2./exp(2*n);
end