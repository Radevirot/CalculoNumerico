%calcula las cotas de error absoluto entre iteraciones para el método de
%punto fijo en base al número k, un punto inicial, los extremos del intervalo
%y la cantidad de iteraciones.

% ESTA FUNCION SOLO SE PUEDE UTILIZAR SI SE SATISFACEN LAS HIPÓTESIS DEL TEOREMA
% 2.4 DEL LIBRO DE BURDEN!!!

function [c1, c2] = cotas_puntofijo(k, n, p0, p1, a, b)

  c1 = (k^n)*max([p0-a b-p0]);
  c2 = ((k^n)/(1-k))*abs(p1-p0);


