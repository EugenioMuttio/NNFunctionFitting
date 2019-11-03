close all
clear all
clc

%%
%DATA
c=-3;
b=3;
R=4; %Number of points
P=[c c/3 b/3 b];
targets=polynomial(P);
T=polynomial(P);
T=T/(T(1)^2+T(2)^2+T(3)^2+T(4)^2)^(1/2);

x=linspace(c,b,10000);

y=polynomial(x);

% hold on
% grid on
% set(gca,'fontsize',12)
% plot(x,y,'--k','LineWidth',1)
% plot (P,T,'*r','LineWidth',1)
% legend('Real function','Targets','fontsize',12)
% hold off

%%
S=2; %Neurons in first layer

w1=[-0.27; -0.41]; %Initial weight
b1=[-0.48 ; -0.13];%Initial bias

n1=w1.*P+b1;

[a1,da1] = logsigmoid (n1);

w2=[-0.35 ; -0.20]; %Initial weight
b2=[-0.50];%Initial bias

n2=w2'*a1+b2;

[a2,da2] = lineal (n2);

emin=mise(T,a2,R,S);

s2=-2*(T-a2);

s1= da1.*w2;

for i=1:S   
    s1(i,:)=s1(i,:).*s2;
end

%TRAINING FUNCTION

tpar=[10000 , 0.01 , 0.001 , 0.001, emin]; %Number o it, Learning rate, Goal, Grad goal.

[w1,w2,b1,b2,emin]=SteepestDescent(P,T,S,R,w1,w2,b1,b2,a1,a2,s1,s2,tpar);

a2=a2*(targets(1)^2+targets(2)^2+targets(3)^2+targets(4)^2)^(1/2);

hold on
grid on
set(gca,'fontsize',12)
plot(x,y,'--k','LineWidth',1)
plot (P,targets,'*r','LineWidth',1)
plot (P,a2,'*b','LineWidth',1)
legend('Real function','Targets','Aprox','fontsize',12)
hold off











