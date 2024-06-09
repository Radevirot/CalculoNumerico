% ECUACION ORIGINAL:
% y'''+4y''+5y'+2y = -4sin(t)-2cos(t)
% y(0) = 1, y'(0) = 0, y''(0) = -1
%
% DESPEJE:
% y''' = -4sin(t) - 2cos(t) - 4y'' - 5y' - 2y
% y1 = y
% y2 = y' = y1'
% y3 = y'' = y2'
% y4 = y''' = y3'
%
% SISTEMA FORMADO:
% y1' = y2
% y2' = y3
% y3' = -4sin(t) - 2cos(t) - 4y3 - 5y2 - 2y1
% y1(0) = 1, y2(0) = 0, y3(0) = -1
clear all; clc;
format long

f = @(t,y) [y(2) ; y(3) ; -4.*sin(t) - 2.*cos(t) - 4.*y(3) - 5.*y(2) - 2.*y(1)];
y0 = [1 0 -1];
inter = [0 2.5];
L = 60;

[t, y] = rk4(f, inter, y0, L);
variable_estado_t25 = y(L+1,1)

inter = [0 15];
[t, y] = rk4(f, inter, y0, L);

plot(t,y(:,1),'-go'); hold on; grid on; grid minor;
plot(t,y(:,2),'-ro'); plot(t,y(:,3),'-bo'); legend('y','dy','ddy'); legend show;

%dy se hace 0 4 veces.
