function vard=BiofedbatchCT(var,F)

%Llamar parámetros
% umax = 0.83;
% Yxs=0.8;
Ks=0.08;
alfa=0.05;
beta=0.002;
Smax=30;
ms=0.00001;

%Definir dinámicas
X=var(1);
S=var(2);
P=var(3);
V=var(4);
umax=var(5);
Yxs=var(6);
Sin=var(7);

%Ecuaciones constitutivas
u=umax*(S/(Ks+S))*(1-(S/Smax));
Rx = u*X;
Rp=(alfa*u+beta)*X;
Rs=((u/Yxs)+ms)*X;

vard = zeros(7,1);
%Ecuaciones diferenciales
vard(1)=Rx-(F/V)*X;
vard(2)=(F/V)*(Sin-S)-Rs;
vard(3)=Rp-(F/V)*P;
vard(4)=F;
vard(5)=0;
vard(6)=0;
vard(7)=0;
% vard=vard';
