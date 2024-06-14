format long

% a)

fm = @(m) 9.8.*m.*(1-e.^(-(15./m).*9)) - 15*35
dfm = @(m) (e.^(-135./m)).*((-1323./m)-9.8)+9.8

fm(1)
fm(100)

% Podemos observar que la raíz está entre 1 y 100, no consideramos
% números negativos por la naturaleza del problema (la masa no puede ser negativa)

pm_0 = biseccion(fm,0,100,1e-2,1000);
[pm, im, hm, timem] = newton_raphson(fm, dfm, pm_0, 1e-5, 1000);
pm

% b)

fc = @(c) 9.8.*65.*(1-e.^(-(c./65).*9)) - c*35
dfc = @(c) 88.2.*e.^(-(9.*c)./65)-35

fc(14)
fc(20)
fc(17)

% Pruebo valores cercanos al coeficiente de arrastre del inciso a, debido a
% que el valor de m dado para el inciso b es cercano al obtenido.

pc_0 = biseccion(fc,14,17,1e-2,1000);
[pc, ic, hc, timec] = newton_raphson(fc, dfc, pc_0, 1e-5, 1000);

% Todos los métodos utilizados tienen como tolerancia el error absoluto entre dos
% iteraciones sucesivas.

pm
pc
