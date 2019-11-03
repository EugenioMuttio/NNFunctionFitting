function [w1min,w2min,b1min,b2min,emin,a2min]=SteepestDescent(w1,w2,b1,b2,a1,a2,s1,s2,P,T,S,R,tpar)

    MaxI = tpar(1);
    lr = tpar(2);
    Goal = tpar(3);
    emin = tpar(4);
    
    w1min=w1;
    w2min=w2;
    b1min=b1;
    b2min=b2;
    a2min=a2;
    
    j=1;
    
    while j<=MaxI | e<=Goal %| grad<=GradGoal 
        
    sums2=[];
    sums1=[];
    
    for i=1:S
        l=s2.*a1;
        m=s1.*P;
        sums2(i,1)=sum(l(i,:));
        sums1(i,1)=sum(m(i,:));
    end
    
    %grad=max(sums1/R,sums2/R);
    w2=w2-lr*sums2/R;
    b2=b2-lr*sum(s2)/R;
    
    w1=w1-lr*sums1/R;
    b1=b1-lr*[sum(s1(1,:));sum(s1(2,:))]/R;
    
    n1=w1.*P+b1;

    [a1,da1] = logsigmoid (n1);

    n2=w2'*a1+b2;

    [a2,da2] = lineal (n2);
    
    e=mise(T,a2,R,S);
    
    if emin>e
        emin=e;
        w1min=w1;
        w2min=w2;
        b1min=b1;
        b2min=b2;
        a2min=a2;
    end
    
    j=j+1;
    
    
    end
end
