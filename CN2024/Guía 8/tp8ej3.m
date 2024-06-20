clear all; clc;
c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)))
c1 = 11/10 - c2
y_exacta = @(x) c1 .* x + (c2 ./ x.^2) - (3./10) .* sin(log(x)) - (1./10) .* cos(log(x))

f = @(x) [-2./x , 2./(x.^2) , sin(log(x))./(x.^2)]

inter = [1 2]
yc = inter
h = 0.1
L = ((2-1)/h) -1

[x y] = disparo_lineal(f, inter, yc, L);
ya = y(1)
yb = y(3)
error_abs_h01 = norm(y(2,:)-y_exacta(x),inf)

h = 0.01
L = ((2-1)/h) - 1

[x y] = disparo_lineal(f, inter, yc, L);
ya = y(1)
yb = y(3)
error_abs_h01 = norm(y(2,:)-y_exacta(x),inf)
