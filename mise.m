function e=mise(T,a,R,S)

e=[];
sum=0;
    for j=1:R
        sum = sum +(T(j)-a(j))^2; 
    end
    e=1/R * sum;
end