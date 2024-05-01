% Este método toma como input una función, dos puntos iniciales, una
% tolerancia, y la cantidad máxima de iteraciones. Retorna una aproximación de
% la raíz de la función ingresada, la cantidad de iteraciones que le llevó
% encontrarla, el vector de errores por cada iteración, y el tiempo que le
% llevó encontrarla.

% Este método hace uso de los términos del polinomio de taylor para aproximar
% una solución de una raíz de una función, pero lo hace sin calcular ninguna
% derivada, sino aproximándolas.

% Algunas consideraciones del método de la Secante:
% - Evita tener que evaluar derivadas.
% - Converge más lento que Newton-Raphson pero más rápido que Bisección.
% - La convergencia es superlineal, con exponente 1.618... .

function [p, i, h, time] = secante(f, p0, p1, tol, kmax)
  tic();
  i=2 ; q0 = f(p0) ; q1 = f(p1) ;

  while i<kmax

    p = p1-(q1(p1-p0))/(q1-q0);

    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    h(i) = abs(p - p1); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(p - p1)/abs(p); %criterio de parada relativo entre iteraciones

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
