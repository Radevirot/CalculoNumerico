%x1 es la presa y x2 el depredador

clear all; clc;
inter = [0 24]; %voy a probar 24 meses
h = 0.05; L = 24/h; %y un paso de 0.05
x0 = [1600 800];

f = @(t,x) [x(1).*(3-0.002.*x(2)) ; -x(2).*(0.5-0.0006.*x(1))];

%voy a usar rk4

[t, x] = rk4(f, inter, x0, L);

plot(t, x(:,1),'b-'); hold on; grid on; grid minor;
plot(t, x(:,2),'r-');
legend('x1','x2'); legend show;

%comienzan pocos depredadores y presas, aumenta la cantidad de presas y
%debido a ello los depredadores aumentan porque tienen más comida, la situación
%se invierte rápidamente cuando los depredadores reducen casi por completo la cantidad
%de presas, y comienzan a reducir también estos. Esto se produce cíclicamente.
