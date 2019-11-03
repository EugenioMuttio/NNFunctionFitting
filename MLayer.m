clear all
close all
clc

%Interval
a=-2;
b=6;
N=20;

% P = a + (b-a).*rand(N,1);
% P = sort(P);

% P= [-1.9294   -1.8468   -1.3374   -1.1970   -1.1526  -1 -0.7855   -0.4733   -0.2474   -0.1210    0.2570 0.5 1  1.4468    1.9640    2.2631    2.5892  3.2  3.4043    3.6598    4.0913    4.8460    5.0342  5.3  5.9993];
P= [-1.9294   -1.8468   -1.3374   -1.1970   -1.1526   -0.7855   -0.4733   -0.2474   -0.1210    0.2570  1.4468    1.9640    2.2631    2.5892   3.4043    3.6598    4.0913    4.8460    5.0342   5.9993];

S = [-1.4080   -0.7650   -0.7109   -0.6365    0.0623    0.3532    0.8062    1.0508    1.1744    1.2175    1.2191    2.2450    2.7799    2.9654     3.4728    3.4843    4.0649    4.6594    4.9689    5.8627];

T = sin(2.*P).*sin(P);

Xr= linspace (a,b,10000);
Yr= sin(2.*Xr).*sin(Xr);


%%
% %Linear layer 20 NEURONS
% 
% lnet = linearlayer(0,0.01); %Static , learn rate
% lnet = configure(lnet,P',T');
% 
% % lnet.layers{1}.transferFcn = 'tansig'
% 
% lnet.IW{1,1} = zeros(N); 
% lnet.b{1} = zeros(N,1);
% 
% lnet.trainParam.epochs = 10;
% lnet = train(lnet,P',T');
% 
% view(lnet)
% 
% figure(1)
% title('Linear Layer')
% hold on
% grid on
% set(gca,'fontsize',12)
% plot (Xr,Yr,'--k','LineWidth',1)
% plot (P,T,'*r','LineWidth',1)
% plot (P,lnet(P'),'-ob','LineWidth',1)
% plot (S,lnet(S'),'+-','color',[0.11 0.80 0.35],'LineWidth',1)
% 
% legend('Real function','Targets','LNet(P)','LNet(S)','fontsize',12)
% hold off

%%
% %Linear layer 1 NEURON
% 
% lnet = linearlayer(0,0.01); %Static , learn rate
% lnet = configure(lnet,P,T);
% 
% lnet.IW{1,1} = [0]; 
% lnet.b{1} = [0];
% 
% lnet.trainParam.epochs = 10;
% lnet = train(lnet,P,T);
% 
% view(lnet)
% 
% % lnet.IW{1,1}
% % lnet.b{1}
% 
% figure(1)
% title('Linear Layer','fontsize',14)
% hold on
% grid on
% set(gca,'fontsize',12)
% plot (Xr,Yr,'--k','LineWidth',1)
% plot (P,T,'*r','LineWidth',1)
% plot (P,lnet(P),'ob','LineWidth',1)
% plot (Xr,lnet(Xr),'-','color',[0.11 0.80 0.35],'LineWidth',1)
% 
% legend('Real function','Targets','LNet(P)','Linear Layer','fontsize',12)
% hold off


%%
%MultiLayer

mlnet = feedforwardnet; %HiddenSizes

% mlnet.trainParam.epochs = 100;
% mlnet.trainParam.lr= 0.1;
% mlnet.trainParam.goal=1e-10

[mlnet,tr] = train(mlnet,P,T);



figure(3)
title('MultiLayer')
hold on
grid on
set(gca,'fontsize',12)
plot (Xr,Yr,'--k','LineWidth',1)
plot (P,T,'*r','LineWidth',1)
plot (P,mlnet(P),'ob','LineWidth',1)
plot (Xr,mlnet(Xr),'-','color',[0.11 0.80 0.35],'LineWidth',1)

legend('Real function','Targets','LNet(P)','MultiLayer','fontsize',12)
