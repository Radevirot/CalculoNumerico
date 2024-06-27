clear all; clc; format long;

% a)

% la ED de difusión-reacción es
% -K0 u''(x) + cR(x) * u(x) = f(x)
% despejando para la forma lineal
% u'' = cR(x) * u * 1/K0 - f(x) * 1/K0
% donde
% p(x) = 0  ,  q(x) = cR(x) * 1/K0  ,  r(x) = -f(x) * 1/K0

K0 = 0.9 ; L = 5 ; alpha = 6 ;
H = 15; uE = 4; rob = [K0 H H*uE]; inter = [0 L];
%f = @(x) [0.*x , (1.05 .* x + 2) .* (1./K0), - (5 .*x.*(5-x)) .* (1./K0)];
f = @(x) [0.*x , (0.5 .* x + 0.5) .* (1./K0), - (5 .*x.*(5-x)) .* (1./K0)]; %para un ej de CFI
[x, y, N, i, h] = iterative_dif_fin_rob(f,inter,alpha,rob,10,1e-4,100);
% iterative_dif_fin_rob tiene que tener los índices de y en L/2 + 1 para
% que los resultados sean correctos, se pide la mitad de la viga

disp("b)")
temp_mitad = y(N/2 + 1)

plot(x,y,'b-')


%h =  %para un ej de CFI
flujo_izq = -K0*((y(2)-y(1))/(x(2)-x(1))) %(f(x_i+1)-f(x))/h viene de taylor con 2 puntos
%para flujo derecho y(end)-y(end-1)

