clear all; clc;
c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)))
c1 = 11/10 - c2
y_exacta = @(x) c1 .* x + (c2 ./ x.^2) - (3./10) .* sin(log(x)) - (1./10) .* cos(log(x))

f = @(x) [-2./x , 2./(x.^2) , sin(log(x))./(x.^2)]
alpha = 1; beta = 2;
inter = [alpha beta]
yc = inter

h = 0.1
L = (2-1)/h

[x_disp y_disp] = disparo_lineal(f, inter, yc, L);
[x_dif y_dif_h01] = dif_fin_dir(f, inter, yc, L);
error_abs_disp = abs(y_disp - y_exacta(x_disp))
error_abs_dif = abs(y_dif_h01 - y_exacta(x_dif))

h = 0.01
L = (2-1)/h

[x_disp y_disp] = disparo_lineal(f, inter, yc, L);
[x_dif y_dif] = dif_fin_dir(f, inter, yc, L);
error_abs_disp = abs(y_disp - y_exacta(x_disp))
error_abs_dif = abs(y_dif - y_exacta(x_dif))

disp("========= Ejercicio 4 =========")
disp("la condición de contorno del extremo derecho es y(2)=2")
disp("la ecuación diferencial es de la forma A*y'(b) + B*y(b)= C")
disp("el coeficiente A es 0, B es 1 y C es 2.")

rob = [0 1 2];
h = 0.1
L = (2-1)/h
[x_dif_rob y_dif_rob] = dif_fin_rob(f,inter,alpha,rob,L);
disp("Dirichlet | Robin")
[y_dif_h01 y_dif_rob]
