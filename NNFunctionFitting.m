close all
clear all
clc

a=-5;
b=4;
P=[a a/3 b/3 b];
T=polynomial(P);

x=linspace(a,b,10000);

y=polynomial(x);

hold on
grid on
set(gca,'fontsize',12)
plot(x,y,'--k','LineWidth',1)
plot (P,T,'*r','LineWidth',1)
legend('Real function','Targets','fontsize',12)
hold off

