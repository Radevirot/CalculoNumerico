% ECUACION ORIGINAL:
% x''(t) = -gR^2/(x(t)+R)^2
% x(0) = 0, x'(0) = v0
%
% DESPEJE:
% x''(t) = -gR^2/(x(t)+R)^2
% x1 = x
% x2 = x' = x1'
% x3 = x'' = x2'
%
% SISTEMA FORMADO:
% x1' = x2
% x2' = -gR^2/(x1+R)^2
% x1(0) = 0, x2(0) = v0
%

clear all; clc; format long;

g = 9.81; R = 6373002;
f = @(t,x) [x(2) ; -g.*R.^2./(x(1)+R).^2];
t0 = 0 ; tF = 3*60; %3 mins
inter = [t0 tF];
x0 = [0 1409.34];
L0 = 10;

[t, x, L, i, h] = iterative_singlepass_firstOrderEDO('rk4',f,inter,x0,L0,1e-6,100);
#[t x] = rk4(f, inter, x0, L);

##kmax = 100; k=1;
##tol = 1e-6;
##x_prev = x(L+1,1);
##L*=2;
##
##while k<kmax
##  [t x] = rk4(f, inter, x0, L);
##  x_actual = x(L+1,1); disp(abs(x_actual-x_prev));
##  if (abs(x_actual-x_prev) < tol) break; endif
##
##  x_prev = x_actual;
##  k+=1;
##  L*=2;
##endwhile
##if (k==kmax)
##   disp('iteraciones');
##   L/=2;
##endif
##k
vel_3m = x(L+1,2)

% B)

plot(t,x(:,1),'g-'); hold on; grid on; grid minor;
plot(t,x(:,2),'b-'); legend('posicion','velocidad'); legend show;
%gráficamente se puede observar que la derivada pasa de + a - entre t=130 y t=160.

%por la naturaleza parabólica de la posición, ajustaremos un polinomio de grado 2
%mediante mínimos cuadrados.
p2 = polyfit(t,x(:,1),2);
p2t = @(t) polyval(p2, t);
graphFunction(p2t,0,180,1000,'r-');
%por la naturaleza lineal de la velocidad, ajustaremos un polinomio de grado 1.
p1 = polyfit(t,x(:,2),2);
p1t = @(t) polyval(p1, t);
graphFunction(p1t,0,180,1000,'r-');

%ahora, en p1t usamos bisección, entre t=130 y t=160.
tiempo_ascenso_ajuste = biseccion(p1t,130,160,1e-6,100);
p = newton_raphson(f, df, p0, tol, kmax)
%y evaluamos p2t en ese valor de t.
altura_maxima_ajuste = p2t(tiempo_ascenso_ajuste)

% B de otra forma
% simplemente busco el valor más alto de los puntos que ya obtuve con runge kutta
[altura_maxima pos] = max(x(:,1))
tiempo_ascenso = t(pos)



