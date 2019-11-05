close all
clear all
clc

%%
%DATA
%Interval definition
c=-3;
b=0;
R=10; %Number of points

P=linspace(c,b,R); %Inputs
T=polynomial2(P); %Outputs

Data=linspace(c,b,100); %Data 

%NET DATA
Nepoch=100; %Number of global iterations updating W and b
S=2; %Neurons in first layer

w1=[2; 3]; %Initial weight
b1=[2 ; -5];%Initial bias

w2=[-8 ; -3]; %Initial weight
b2=[5];%Initial bias

eminvec=[];

%%
%Global Loop
for epoch=1:Nepoch
    n1=w1.*P+b1;

    [a1,da1] = logsigmoid (n1);

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

    tpar=[100 0.01 0.01 emin]; %Number o it, Learning rate, Goal.

    [w1,w2,b1,b2,emin,a2min]=SteepestDescent(w1,w2,b1,b2,a1,a2,s1,s2,P,T,S,R,tpar);
    eminvec(epoch)=emin;
    
end

for Pi=1:length(Data) 
    %Global Loop 
    n1=w1.*Data(Pi)+b1; 
 
    [a1,da1] = logsigmoid (n1); 
 
    n2=w2'*a1+b2; 
 
    [a2,da2] = lineal (n2); 
    fit(Pi)=a2; 
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
plot (P,a2min,'*b','LineWidth',1)
plot(Data,fit,'--m','LineWidth',1) 
legend('Real function','Targets','Aprox','Fit','fontsize',12) 
hold off

figure(2)
hold on
grid on
set(gca,'fontsize',12)
plot(eminvec,'--k','LineWidth',1)
legend('Error');
hold off









