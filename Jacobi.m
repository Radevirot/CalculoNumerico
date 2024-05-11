%Esta función tiene como entrada una matriz (A), un vector de términos
%independientes (b), un vector de incógnitas inicial (x0), la cantidad
%máxima de iteraciones antes de que el algoritmo corte (maxit), y la tolerancia,
%(tol) utilizada como parámetro de corte.

%Retorna el vector de soluciones aproximadas (x) (si es que converge), la
%cantidad de iteraciones necesarias antes de que el error alcance la tolerancia
%(it), y un vector que contiene todos los errores de las iteraciones (r). Este
%último puede ser ploteado para analizar la convergencia gráficamente.

%Es importante tener en cuenta que esta función sólo se puede utilizar con
%matrices cuya matriz de iteración Tc (dependiente del método iterativo) tenga
%un radio espectral menor a 1. → spectral_radius(Tc(A,'j')) < 1

%Otro posible análisis de convergencia es revisar si la matriz es estrictamente
%diagonal dominante. En caso de serlo, se sabe que el método iterativo converge.

%Por último, otro valor a revisar es el número de condición de la matriz de
%iteración, que en octave se calcula como 'cond(A)', si este es pequeño significa
%que las perturbaciones pequeñas no causan grandes cambios en el resultado.


function [x, it, r] = Jacobi(A,b,x0,maxit,tol)
  tic();
  n = length(A(1,:)); %tamaño matriz
  x = x0;
  it = 0; %contador de iteraciones

  while it < maxit                  % A = L + D + U → Aj = D + (L+U)
    for i = 1:n                     % x^(k) = D^-1 b - D^-1 (L+U) x^(k-1)
      x(i) =...
      (b(i)...
      -A(i,1:i-1)*x0(1:i-1)...
      -A(i,i+1:n)*x0(i+1:n))...
      /A(i,i);
     endfor

     r(it+1) = norm(b-(A*x));     % Residuo de la ecuación, norma euclídea
     %r(it+1) = norm(b-(A*x),inf); % Residuo de la ecuación, norma infinito
     %r(it+1) = norm(b-(A*x),1);   % Residuo de la ecuación, norma L1

     %r(it+1) = norm(x-x0);      % Error absoluto entre iteraciones, norma euclídea
     %r(it+1) = norm(x-x0,inf);  % Error absoluto entre iteraciones, norma infinito
     %r(it+1) = norm(x-x0,1);    % Error absoluto entre iteraciones, norma L1

     %r(it+1) = norm(x-x0)/norm(x);          % Error relativo entre iteraciones, norma euclídea
     %r(it+1) = norm(x-x0,inf)/norm(x,inf);  % Error relativo entre iteraciones, norma infinito
     %r(it+1) = norm(x-x0,1)/norm(x,1);      % Error relativo entre iteraciones, norma L1

     if r(it+1) < tol
       disp("Cortó por tolerancia")
       break;
     endif

     x0=x;
     it=it+1;

  endwhile

  if it == maxit
    disp("Cortó por iteraciones")
  endif

  toc()

