function vard=Modelo_loteal(var,u1,u2,u3,u4)

%Llamar parámetros
umax = u1;%0.83;
Yxs= u2;%0.8;
Ks=0.08;
alfa=0.05;
beta=0.002;
Smax=30;
ms=0.00001;
Sin=u3;
F=u4;


%Definir dinámicas
X=var(1);
S=var(2);
P=var(3);
V=var(4);

%Ecuaciones constitutivas
u=umax*(S/(Ks+S))*(1-(S/Smax));
Rx = u*X;
Rp=(alfa*u+beta)*X;
Rs=((u/Yxs)+ms)*X;

%Ecuaciones diferenciales
vard(1)=Rx-(F/V)*X;
vard(2)=(F/V)*(Sin-S)-Rs;
vard(3)=Rp-(F/V)*P;
vard(4)=F;
vard=vard';
