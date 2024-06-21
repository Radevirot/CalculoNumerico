clear all; clc;

% la ED de difusión es
% -K0 * u'' = f(x)
% despejando para la forma lineal
% u'' = - f(x) * 1/K0
% donde
% p(x) = 0 , q (x) = 0 , r(x) = - f(x) * 1/K0

K0 = 1 ; L = 3 ; alpha = 21 ; rob = [-K0 0 0]; inter = [0 L];
f = @(x) [0.*x , 0.*x , - 20.*sin(5.*(x-1)) .* (1./K0)];
[x, y, N, i, h] = iterative_dif_fin_rob(f,inter,alpha,rob,10,1e-2,100);
% iterative_dif_fin_rob tiene que tener los índices de y en L+1 (end) para
% que los resultados sean correctos, se pide el extremo derecho de la viga

disp("a)")
temp_extr_der = y(end)

disp("b)")
disp("el L final es bastante grande así que se utilizará la función max con")
disp("los puntos obtenidos de los sub-intervalos de diferencias finitas")
[m pos] = max(y);
punto_viga = x(pos)
max_temp = m

plot(x,y,'b-'); grid on; grid minor; hold on;
plot(punto_viga,max_temp,'ro')





