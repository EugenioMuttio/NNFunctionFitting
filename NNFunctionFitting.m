close all
clear all
clc

%%
%DATA
%Interval definition
c=-1;
b=2;
R=50; %Number of points

P=linspace(c,b,50); %Inputs
T=polynomial(P); %Outputs

%%
S=2; %Neurons in first layer

w1=[-4; -1.10]; %Initial weight
b1=[-1.30 ; -0.65];%Initial bias

n1=w1.*P+b1;

[a1,da1] = logsigmoid (n1);

w2=[6.40 ; 2.20]; %Initial weight
b2=[-0.75];%Initial bias

n2=w2'*a1+b2;

[a2,da2] = lineal (n2);

emin=mise(T,a2,R,S); %First error


%%
%SENSIBILITIES

s2=-2*(T-a2); 
s1= da1.*w2;

for i=1:S   
    s1(i,:)=s1(i,:).*s2;
end

%%
%TRAINING FUNCTION

tpar=[1000 0.01 0.01 emin]; %Number o it, Learning rate, Goal.

[w1,w2,b1,b2,emin,a2min]=SteepestDescent(w1,w2,b1,b2,a1,a2,s1,s2,P,T,S,R,tpar);

% a2=a2*(targets(1)^2+targets(2)^2+targets(3)^2+targets(4)^2)^(1/2);



%%

x=linspace(c,b,10000);
y=polynomial(x);

hold on
grid on
set(gca,'fontsize',12)
plot(x,y,'--k','LineWidth',1)
plot (P,T,'*r','LineWidth',1)
plot (P,a2min,'*b','LineWidth',1)
legend('Real function','Targets','Aprox','fontsize',12)
hold off











