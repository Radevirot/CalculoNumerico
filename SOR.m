%Esta función tiene como entrada una matriz (A), un vector de términos
%independientes (b), un vector de incógnitas inicial (x0), la cantidad
%máxima de iteraciones antes de que el algoritmo corte (maxit), la tolerancia,
%(tol) utilizada como parámetro de corte, y omega (w), que es el parámetro de
%relajación cuyo valor puede estar dentro del intervalo abierto (0,2).

%Retorna el vector de soluciones aproximadas (x) (si es que converge), la
%cantidad de iteraciones necesarias antes de que el error alcance la tolerancia
%(it), y un vector que contiene todos los errores de las iteraciones (r). Este
%último puede ser ploteado para analizar la convergencia gráficamente.

%Es importante tener en cuenta que esta función sólo se puede utilizar con
%matrices cuya matriz de iteración Tc (dependiente del método iterativo) tenga
%un radio espectral menor a 1. → spectral_radius(Tc(A,'sor',w)) < 1

%Otro posible análisis de convergencia es revisar si la matriz es estrictamente
%diagonal dominante. En caso de serlo, se sabe que el método iterativo converge.
%Además, si la matriz es simétrica definida positiva entonces el método converge.

% CONSIDERACIONES IMPORTANTES DEL MÉTODO SOR
% - Si w = 1, entonces el método SOR se transforma en el de GaussSeidel
% - Si 0 < w < 1 entonces el método se llama de "sub-relajación"
% - Si 1 < w < 2 entonces el método se lllama de "sobre-relajación"
%Es posible hallar el w óptimo para matrices que son estrictamente diagonal
%dominantes y al mismo tiempo son matrices banda o tridiagonales, para esto se
%puede usar la función wOpt(A).


%Por último, otro valor a revisar es el número de condición de la matriz de
%iteración, que en octave se calcula como 'cond(A)', si este es pequeño significa
%que las perturbaciones pequeñas no causan grandes cambios en el resultado.


function [x, it, r] = SOR(A,b,x0,maxit,tol,w)
  tic();
  n = length(A(1,:));
  x = x0;
  it = 0;

  while it < maxit
    for i = 1:n
      x(i) = ((1-w)*x0(i))...
      +(w*(b(i)...
      -A(i,1:i-1)*x(1:i-1)...
      -A(i,i+1:n)*x0(i+1:n))...
      /A(i,i));
     endfor

     r(it+1) = norm((A*x)-b,inf);

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

