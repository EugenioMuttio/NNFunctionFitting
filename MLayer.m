clear all
close all
clc

%DATA
c=-1.5;
b=1;
P=linspace(c,b,20);
targets=polynomial2(P);
T=polynomial2(P);

x=linspace(c,b,10000);

y=polynomial2(x);


%%
%MultiLayer

mlnet = feedforwardnet(1,'traingd'); %HiddenSizes

 
% mlnet.trainParam.goal=1e-10
%mlnet.trainParam.epochs = 1;

mlnet.trainParam.epochs = 100;
mlnet.layers{1}.size = 2;
mlnet.layers{1}.transferFcn = 'logsig';
mlnet.trainParam.lr= 0.01;
dividetrain(50);
[mlnet,tr] = train(mlnet,P,T);


figure(3)
title('MultiLayer')
hold on
grid on
set(gca,'fontsize',12)
plot (x,y,'--k','LineWidth',1)
plot (P,T,'*r','LineWidth',1)
plot (P,mlnet(P),'ob','LineWidth',1)
plot (x,mlnet(x),'-','color',[0.11 0.80 0.35],'LineWidth',1)

legend('Real function','Targets','LNet(P)','MultiLayer','fontsize',12)
