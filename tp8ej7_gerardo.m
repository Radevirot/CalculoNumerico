clear all; clc;clf
% Disipador
% Metodo de diferencias finitas Robin
W1 = 2;
L = 6;
L1 = 4;
D = 0.2;
k = 2.04;
H = 6*10^(-3);
Ta = 40;
T1=200;
N=10;
A1=W1*D
C1 =((D*W1)/L);
C2 = (H/k);


inter=[0 L1];


f =@(x) [(C1./((C1.*(L-x))))...
  ((C2*(((2*W1)./L).*(L-x)+2*D)))./(C1.*(L-x)) ...
  -((((C2*(((2*W1)./L).*(L-x)+2*D))))./(C1.*(L-x)))*Ta];

z=k; z1=H; Co=H*Ta;
rob=[ z z1 Co]
ycd=T1

[x,y]=dif_fin_rob(f,inter,ycd,rob,N); % codigo de Juan
deltax =(x(2)-x(1));
deltaT =(y(2)-y(1));
q=-(k*A1/deltax)*deltaT

figure(1)
hold on
plot(x,y,'b-o')
grid on
grid minor
xlabel('posicion: x')
ylabel('Solucion: Temperatura ºC')
title('Calculo Aleta disipadora')
