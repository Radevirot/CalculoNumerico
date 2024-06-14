format long

% Se transformará el problema en uno de encontrar ceros mediante la igualación
% de P(x) a x, donde pasa a ser 0 = 230x^4+18x^3+9x^2-222x-9.

pfx = @(x) 230.*x.^4 + 18.*x.^3 + 9.*x.^2 - 222.*x - 9
dpfx = @(x) 920.*x.^3+54.*x.^2+18.*x-222

graphFunction(pfx,-0.25,1,10000,'-r')

% Observando la gráfica podemos apreciar que un punto fijo se encuentra entre
% -0.2 y 0.2, y el otro entre 0.8 y 1.

% Se aproximará por bisección y luego se utilizará newton-raphson.

p0_1 = biseccion(pfx,-0.2,0.2,1e-2,1000);
p0_2 = biseccion(pfx,0.8,1,1e-2,1000);

[p1, i1, h1, time1] = newton_raphson(pfx, dpfx, p0_1, 1e-6, 1000);
[p2, i2, h2, time2] = newton_raphson(pfx, dpfx, p0_2, 1e-6, 1000);

p1
p2


