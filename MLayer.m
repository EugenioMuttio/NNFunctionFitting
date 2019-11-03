clear all
close all
clc

%DATA
c=-1;
b=1;
R=4; %Number of points
P=linspace(c,b,10);
targets=polynomial(P);
T=polynomial(P);

x=linspace(c,b,10000);

y=polynomial(x);

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

mlnet = feedforwardnet(1,'traingd'); %HiddenSizes

% mlnet.trainParam.epochs = 100;
% mlnet.trainParam.goal=1e-10
mlnet.trainParam.epochs = 1;
mlnet.layers{1}.size = 4;
mlnet.layers{1}.transferFcn = 'logsig';
mlnet.trainParam.lr= 0.1;
dividetrain(20);
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
