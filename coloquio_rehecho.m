clear all; clc;
% -------- PARTE A --------

% defino las constantes y sub-funciones
K0 = 0.57; alpha = 6; rob = [-K0 0 -40]; L = 2; inter = [0 L];

fuente = @(x) 12.*cos(2.*x);
cR = @(x) 5.*(x-2);

% defino p, q y r usando las constantes y sub-funciones
p = @(x) 0.*x;
q = @(x) cR(x)./K0;
r = @(x) -fuente(x)./K0;

% defino la función para dif_fin, usando p, q y r.
f1 = @(x) [p(x) , q(x) , r(x)];

% diferencias finitas
[x, y, L, i, h] = iterative_dif_fin_rob('dya',f1,inter,alpha,rob,10,1e-4,100);

flujo_izq = -K0*((y(2)-y(1))/(x(2)-x(1)))
%flujo_der = -K0*(y(end)-y(end-1))/(x(end)-x(end-1))

% -------- PARTE B --------
% "considerando la discretización obtenida" -> usar método de integración compuesto
% defino las nuevas constantes
A = 0.01; c = 0.217; ro = 2.7;

% obtengo los puntos a integrar
integrando = c.*ro.*y;

% utilizamos método compuesto (simpson en este caso) y calculamos E
I = simpsoncomp(x,integrando);

E = A*I


% -------- PARTE C --------

% el problema es ahora un PVI:
% DESPEJE:
% u''(x) = cR(x)u(x)/K0 - f(x)/K0
% u1 = u
% u2 = u' = u1'
% u3 = u'' = u2'
%
% SISTEMA FORMADO:
% u1' = u2
% u2' = cR(x)u1(x)/K0 - f(x)/K0
% u1(0) = 6, u2(0) = 20/K0   (viene de despejar fi(x)=-K0*u'(x))
%

f = @(x,u) [u(2) ; (5.*(x-2).*u(1))./K0 - (12.*cos(2.*x))./K0];
u0 = [6 20/K0];

[x, y, L, i, h] = iterative_singlepass_firstOrderEDO('rk4',f,inter,u0,10,1e-6,100);

% recordar que y es una matriz, donde la primera columna es u y la segunda du
% por lo que nos quedamos con los últimos valores de cada columna
temp_extr_der = y(end,1)
flujo_extr_der = -K0*y(end,2)


