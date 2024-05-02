% Este método toma como input una función, su derivada, un punto inicial, una
% tolerancia, y la cantidad máxima de iteraciones. Retorna una aproximación de
% la raíz de la función ingresada, la cantidad de iteraciones que le llevó
% encontrarla, el vector de errores por cada iteración, y el tiempo que le
% llevó encontrarla.

% Este método hace uso de los términos del polinomio de taylor para aproximar
% una solución de una raíz de una función.

% Algunas consideraciones del método de Newton-Raphson:
% - Puede haber problemas si f(p) y df(p) tienden simultáneamente a 0.
% - El método es de convergencia LOCAL, por lo que p0 debe estar lo
% lo suficientemente cerca de la raíz para poder utilizarlo.
% - Se suele utilizar en conjunto con el método de bisección.
% - Para raíces de multiplicidad = 1, tiene convergencia cuadrática.
% - Para raíces de muiltiplicidad > 1, tiene convergencia lineal.

function [p, i, h, time] = newton_raphson(f, df, p0, tol, kmax)
  tic();
  i=1;

  while i<kmax

    p = p0-f(p0)/df(p0);

    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    %h(i) = abs(p - p0); %criterio de parada absoluto entre iteraciones
    h(i) = abs(p - p0)/abs(p); %criterio de parada relativo entre iteraciones

    if h(i) < tol
      disp('cortó por tolerancia')
      time = toc();
      return
    endif

    p0=p;
    i+=1;

  endwhile

  disp('cortó por iteraciones')
  time=toc();

endfunction
