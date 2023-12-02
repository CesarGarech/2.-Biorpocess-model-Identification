clear 
close all
clc

%%
x0 = [0.01; 20; 0; 1; 0.83; 0.8; 10];
Ts = 0.1;
tic
mdl = 'Bio_fedbatch_PP2';
open_system(mdl);
sim(mdl)
toc
%%
figure;plot(t,y(:,1));hold on;plot(t,Est(:,1),'*');xlabel('Time (h)');ylabel('Biomass (g/l)');legend('X model','X EKF','Location','best')
figure;plot(t,y(:,2));hold on;plot(t,Est(:,2),'*');xlabel('Time (h)');ylabel('Sustrato (g/l)');legend('S model','S EKF','Location','best')
figure;plot(t,y(:,3));hold on;plot(t,Est(:,3),'*');xlabel('Time (h)');ylabel('Producto (g/l)');legend('P model','P EKF','Location','best')
figure;plot(t,y(:,4));hold on;plot(t,Est(:,4),'*');xlabel('Time (h)');ylabel('Volume (l)');legend('V model','V EKF','Location','best')
figure;plot(t,P(:,1));hold on;plot(t,Est(:,5),'*');xlabel('Time (h)');ylabel('Umax (1/h)');legend('Umax model','Umax EKF','Location','best')
figure;plot(t,P1(:,1));hold on;plot(t,Est(:,6),'*');xlabel('Time (h)');ylabel('Yxs g/g)');legend('Yxs model','Yxs EKF','Location','best')
figure;plot(t,P2(:,1));hold on;plot(t,Est(:,7),'*');xlabel('Time (h)');ylabel('Sin (g/L)');legend('Sin model','Sin EKF','Location','best')
figure;plot(t,P3(:,1));xlabel('Time (h)');ylabel('Feed (L/h)');
