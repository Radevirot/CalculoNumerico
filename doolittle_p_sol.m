% Esta función realiza una factorización de Doolittle para una matriz
% cuadrada A de forma vectorizada con pivoteo parcial, retorna la nueva matriz
% A modificada (L y U dentro de la misma), retorna L y U por separado, la
% matriz de permutación (P), la matriz original permutada (Z), y Z1 es el
% producto de la factorización, que debería devolver lo mismo que la matriz
% original permutada Z.

% Agregados x y r a los posibles retornos de la función, x es el vector de
% incógnitas de la ecuación LUx = b, calculado en las últimas líneas de la función,
% mientras que r es el vector de posiciones.

% Básicamente viene de la teoría, donde dice que PA = LU, en este caso PA es Z
% y LU es Z1.


function [x, A, r, L, U, P, Z, Z1] = doolittle_p_sol(A1, b)
  n = length(A1(1,:));
  r = 1:n;
  epsilon = 1e-9;
  A=A1;

  for k=1:n-1

    [pivmax,pos] = max(abs(A(r(k:n),k)));
    if pivmax<epsilon
      disp('Los posibles pivotes son CERO')
      break
    endif

    pos = pos(1)+k-1;

    if pos!=k
      r([pos k]) = r([k pos]);
    endif

    P = eye(n)(r,:); % Genera una matriz identidad cuyos renglones están
                     % cambiados de posición dependiendo de cómo lo indique
                     % el vector de posiciones r, esta es la matriz de
                     % permutación

    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n) -= A(r(k+1:n),k) * A(r(k),k+1:n);


  endfor

  L = eye(n) + tril(A(r,1:n),-1);
  U = triu(A(r,1:n),0);
  P;
  Z = P*A1;
  Z1 = L*U;

  y = sust_adelante_v([L b(r)]); % Importante permutar el vector de términos
                                 % independientes antes de realizar la sust.
  x = sust_atras_v([U y]);
  endfunction
