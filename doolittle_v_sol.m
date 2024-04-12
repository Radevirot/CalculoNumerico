% Esta función realiza una factorización de Doolittle para una matriz
% cuadrada A de forma vectorizada, retorna la nueva matriz A modificada
% (L y U dentro de la misma), también retorna L y U por separado.

% Se modificó para retornar el vector de soluciones x.

% Para vectorizar simplemente se reemplazaron las equivalencias de los lazos dentro
% de los índices de la matriz: por ejemplo, si el lazo era "for i=k+1:n", se
% cambió A(i,k) por A(k+1:n,k)

function [x, A, L, U] = doolittle_v_sol(A,b)
  n = length(A(1,:));

  for k=1:n-1

    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) -= A(k+1:n,k) * A(k,k+1:n); % Se utilizó "-="


  endfor

  L = eye(n) + tril(A,-1);
  U = triu(A);

  y = sust_adelante_v([L b]);
  x = sust_atras_v([U y]);

  endfunction
