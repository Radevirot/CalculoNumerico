% Este método toma como input una función, una raíz inicial, una
% tolerancia, y la cantidad máxima de iteraciones. Retorna una aproximación de
% la raíz de la función ingresada, la cantidad de iteraciones que le llevó
% encontrarla, el vector de errores por cada iteración, y el tiempo que le
% llevó encontrarla.

% Consiste en encontrar un punto tal que g(p) = p mediante la evaluación sucesiva
% de los resultados anteriores.

% Algunas consideraciones del método de punto fijo:
% - Si existe un intervalo (a,b) cuadrado donde se pueda encerrar a la función
% continua g, entonces existe al menos un punto fijo en ese intervalo.
% - Si además existe la derivada de g en ese intervalo, y el valor absoluto de
% g'(x) es menor a 1, entonces se sabe que el punto fijo en ese intervalo es único.
% - Además, si esto último se cumple se sabe que el método obligatoriamente
% debe converger a ese punto fijo.
% - La velocidad de convergencia depende de |g'(p)|, mientras más cercano a 1
% sea, más lento converge, y mientras más cercano al 0 sea, más rápido lo hace.
% Además, si es distinto de 0, la convergencia es lineal, mientras que si es
% igual a 0, la convergencia PUEDE ser cuadrática.
% - IMPORTANTE: tener en cuenta que dado un polinomio tenemos diversas formas de
% representarlo para aplicar el método de punto fijo, puede que en algunas de
% las representaciones converja y en otras no, hacer un análisis detallado de
% la situación.

% Para determinar k, evaluar g' en los extremos del intervalo solicitado y revisar
% la fluctuación del valor entre ellos, otra opción es hacerlo gráficamente.

function [p, i, h, time] = puntofijo(g,p0,tol,kmax)
  tic();
  i=1;

  while i<kmax

    p = g(p0);

    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    h(i) = abs(p - p0); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(p - p0)/abs(p); %criterio de parada relativo entre iteraciones

    if h(i) < tol     #corte por tamaño del intervalo
      disp('cortó por tolerancia')
      time = toc();
      return
    endif

    p0=p;

    i+=1;

  endwhile

  disp('cortó por iteraciones')

  time = toc();
