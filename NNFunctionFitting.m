close all
clear all
clc

%%
%DATA
%Interval definition
c=-3;
b=2;
R=100; %Number of points

<<<<<<< Updated upstream
P=linspace(c,b,50); %Inputs
T=polynomial2(P); %Outputs
=======
P=linspace(c,b,R); %Inputs
T=polynomial(P); %Outputs
>>>>>>> Stashed changes

%NET DATA
Nepoch=23; %Number of global iterations updating W and b
S=2; %Neurons in first layer

w1=[10; 5]; %Initial weight
b1=[-10 ; -5];%Initial bias

w2=[7 ; 5]; %Initial weight
b2=[-15];%Initial bias

eminvec=[];

%%
%Global Loop
for epoch=1:Nepoch
    n1=w1.*P+b1;

    [a1,da1] = tansigmoid (n1);

    n2=w2'*a1+b2;

    [a2,da2] = lineal (n2);

    emin=mise(T,a2,R,S); %First error in each Epoch
    


    %%
    %SENSIBILITIES

    s2=-2*(T-a2); 
    s1= da1.*w2;

    for i=1:S   
        s1(i,:)=s1(i,:).*s2;
    end

    %%
    %TRAINING FUNCTION

    tpar=[10000 0.1 0.01 emin]; %Number o it, Learning rate, Goal.

    [w1,w2,b1,b2,emin,a2min]=SteepestDescent(w1,w2,b1,b2,a1,a2,s1,s2,P,T,S,R,tpar);
    eminvec(epoch)=emin;
    
end

%%
%Plot
x=linspace(c,b,10000);
y=polynomial2(x);

figure(1)
hold on
grid on
set(gca,'fontsize',12)
plot(x,y,'--k','LineWidth',1)
plot (P,T,'*r','LineWidth',1)
plot (P,a2min,'--*b','LineWidth',1)
legend('Real function','Targets','Aprox','fontsize',12)
hold off

figure(2)
hold on
grid on
set(gca,'fontsize',12)
plot(eminvec,'--k','LineWidth',1)
legend('Error');
hold off









