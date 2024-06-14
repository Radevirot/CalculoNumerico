% ECUACION ORIGINAL:
% o''(t) + o'(t) + sin(o(t)) = 20*(cos(o(t)))^2
% o(0) = pi/2, o'(0) = 0
%
% DESPEJE:
% o''(t) = 20*(cos(o(t)))^2 - o'(t) - sin(o(t))
% o1 = o
% o2 = o' = o1'
% o3 = o'' = o2'
%
% SISTEMA FORMADO:
% o1' = o2
% o2' = 20*(cos(o1))^2 - o2 - sin(o1)
% o1(0) = pi/2, o2(0) = 0
%

clear all; clc; format long;

%a)

f = @(t,o) [o(2) ; 20.*(cos(o(1))).^2 - o(2) - sin(o(1))];
t0 = 0 ; tF = 3.5;
inter = [t0 tF];
o0 = [pi/2 0];
L0 = 10;

[t, o, L, i, h] = iterative_singlepass_firstOrderEDO('rk4',f,inter,o0,L0,1e-4,100);

angulo_t35 = (o(L+1,1))
vel_t35 = (o(L+1,2))

plot(t,o(:,1),'b-'); hold on; grid on; grid minor;
plot(t,o(:,2),'g-'); %se mueve de izq a der por los signos de la velocidad

%b)
tF = 5;
inter = [t0 tF];
[t, o, L, i, h] = iterative_singlepass_firstOrderEDO('rk4',f,inter,o0,L0,1e-4,100);
figure(2); hold on; grid on; grid minor;
plot(t,o(:,1),'b-');
plot(t,o(:,2),'g-');
%el péndulo cambia de dirección cada vez que la velocidad se hace 0, observando
%la gráfica de la derivada (color verde), podemos observar que cambia de dirección
%un total de 4 veces.

%c)
tF = 20; %hacemos un intervalo grande para ver qué valor estacionario toma
%la posición cuando pasa bastante tiempo.
inter = [t0 tF];
[t, o, L, i, h] = iterative_singlepass_firstOrderEDO('rk4',f,inter,o0,L0,1e-4,100);
figure(3); hold on; grid on; grid minor;
plot(t,o(:,1),'b-');
plot(t,o(:,2),'g-');
%en la gráfica, observando la función de color azul, que es el ángulo respecto al tiempo
%podemos observar que ya toma un valor estacionario cuando t es lo suficientemente grande,
%así que la evaluaremos en el último valor del intervalo para obtenerlo.
angulo_rad_t20 = (o(L+1,1))
angulo_deg_t20 = (angulo_rad_t20*180)/pi


